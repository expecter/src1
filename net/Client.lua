-----------------------------------------------------------------------------------------------  
-- @description Client 
-- @author  ny
-- @coryright  蜂鸟工作室
-- @release  2014/9/8
--------------------------------------------------------------------------------------------

local SocketTCP = import(".SocketTCP")
local Message = import(".Message")
local Request = import(".Request")
local Proto = import(".Proto")
local protobuff = import(".proto.protobuf")

--超时时间
local M_Timeout = 20

local M = class(...)

--Client当前的状态
M.state = "idle"

--client当前的socket
M.socketTCP = nil

--接收消息的分发

--普通事件, socketclose后, 事件会自动移除
M.event = {}
cc(M.event):addComponent("components.behavior.EventProtocol"):exportMethods()

--静态事件, socketclose后, 事件不会移除
M.event_static = {}
cc(M.event_static):addComponent("components.behavior.EventProtocol"):exportMethods()

--自身事件分发
cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()

--请求
M.tmRequest = {}

--服务器id
M.serverId = nil

--playerId
M.playerId = nil

--定时器句柄
M.handleSchedule = nil

--服务器时间和本地时间差
M.timediff = 0


local M_index = 1


function M.start(ip, port, serverId, fConnect, fConnectFailure, fConnectClose)
    -- assert(M.state == "idle")
    if M.state=="connected" then 
        if fConnect then
            fConnect()
        end
        return  
    end
    printInfo("Client start ip:%s:%s", ip, tostring(port))

    --当状态是连接上的时候 才会回调关闭回调
    local fClose = function(state)
        if state == "connected" then
            if fConnectClose then fConnectClose() end
        end

        --清理数据
        M.serverId = nil
        M.playerId = nil
        M.event:removeAllEventListeners()
        M.tmRequest = {}

        --清理定时器
        if M.handleSchedule then
            require("framework.scheduler").unscheduleGlobal(M.handleSchedule)
            M.handleSchedule = nil
        end

        --分发接收事件
        M:dispatchEvent{
            name = "close"
        }
    end

    local function connect()
        M.state = "connected"
        M.handleSchedule = require("framework.scheduler").scheduleGlobal(M.onUpdate, 2)
        if fConnect then
            fConnect()
        end
        --分发接收事件
        M:dispatchEvent{
            name = "connect"
        }
    end

    local function connect_failure()
        if fConnectFailure then
            fConnectFailure()
        end
        M.state = "idle"
    end

    local function close()
        --切换state
        local state = M.state
        M.state = "idle"
        fClose(state)
    end

    local function closed()
        close()
    end

    --改变状态
    M.state = "connecting"

    --服务器Id赋值
    M.serverId = serverId

    --socket
    local socket = SocketTCP.new(ip, port, false)
    socket:addEventListener(SocketTCP.EVENT_CONNECTED, connect)
    socket:addEventListener(SocketTCP.EVENT_CLOSE, close)
    socket:addEventListener(SocketTCP.EVENT_CLOSED, closed)
    socket:addEventListener(SocketTCP.EVENT_CONNECT_FAILURE, connect_failure)
    socket:addEventListener(SocketTCP.EVENT_DATA, M.onReceive)
    socket:connect()

    
    M.socketTCP = socket
end

function M.request(params)

    local request = Request.new(params)
    
    return M.addRequest(request)
end

function M.addRequest(request)

    --request 唯一索引
    M_index = M_index + 1
    M.tmRequest[M_index] = request
    request.index = M_index

    local messageName = request.messageName
    local params = request.params

    --数据
    local messageId = Message.getMessageId(messageName)
    local reqMessageName = Message.getReqMessageName(messageId)
    --打印
    Proto.easyprint(reqMessageName, params, "请求")
    
    --序列化数据
    local data = Proto.encode(reqMessageName, params)

    --消息头
    local cmdMessage = {
        messageId = messageId,
        serverId = M.serverId,
        playerId = M.playerId,
        index = M_index,
    }

    --封装CmdData
    local cmdData = {
        message = cmdMessage,
        data = data,
        appendCode = nil,
        appendData = nil,
    }

    --分发请求事件
    M:dispatchEvent{
        name = "request",
        data = {
            request = request
        }
    }

    --序列化,并发送数据
    M.socketTCP:send(
        Proto.encode("CmdData", cmdData)
    )

    return true
end
M.LOADIN_GBEFOR_DATA={}
M.LOGIN_STATE=nil
require("game.GameMgr"):addEventListener("startGame",function()
    M.LOADINGBEFOR_DATA={}
    M.LOGIN_STATE="startGame"
end)
require("game.GameMgr"):addEventListener("loadingGame",function()
    M.LOGIN_STATE="loadingGame"
    for i=1,#M.LOADIN_GBEFOR_DATA do
        M.onReceive(LOADINGBEFOR_DATA[i])
    end
end)
function M.onReceive(event)
    local data = event.data
    local cmdData = Proto.decode("CmdData", data)
    local cmdMessage = cmdData.message
    local messageId = cmdMessage.messageId
    if M.LOGIN_STATE=="startGame" and tonumber(messageId)~=10001 then
        M.LOADINGBEFOR_DATA[#M.LOADINGBEFOR_DATA+1]=event
        return 
    end
    local index = cmdMessage.index
    local data = cmdData.data

    --更新时间
    M.updateServerTime(cmdMessage.serverTime)

    --请求
    local request = M.tmRequest[index]
    M.tmRequest[index] = nil

    -- 缓存gamecache数据
    local appendData = cmdData.appendData

    if appendData ~= nil and appendData ~= "" then
        --
        local cmdAppendRsp =Proto.decode("CmdAppendRsp", appendData)
        if cmdAppendRsp then
            --分发协议事件
            M.event_static:dispatchEvent{
                name = "CmdAppend",
                data = {
                    cmdX = cmdAppendRsp
                },
            }
            M.event:dispatchEvent{
                name = "CmdAppend",
                data = {
                    cmdX = cmdAppendRsp
                },
            }
			M.event:dispatchEvent{
                name = "ShowReward",
                data = {
                    cmdX = cmdAppendRsp,
					messageId = messageId,
                },
            }
        end

        --错误处理
        local cmdError = cmdAppendRsp.cmdError
        -- print(cmdError.code)
        if cmdError and cmdError.code ~= "NO_ERROR" then
            --错误处理逻辑
            M.onReceiveError(cmdError, request)
            --出错后,直接返回
            return
        end
    end
    
    --解压
    if cmdData.compress then
        data = require("zlib").inflate()(data,"finish") 
    end

    --反序列化类名
    local rspMessgeName= Message.getRspMessageName(messageId)
    local messageName = Message.getMessageName(messageId)

    --反序列化
    local cmdX = Proto.decode(rspMessgeName, data)

    --打印
    Proto.easyprint(rspMessgeName, cmdX, "响应")
    print("messageName",messageName)

    --构建事件数据
    local data = {
        cmdX = cmdX,
        request = request,
    }
    --分发协议事件
    M.event_static:dispatchEvent{
        name = messageName,
        data = data,
    }

    M.event:dispatchEvent{
        name = messageName,
        data = data,
    }

    --分发接收事件
    M:dispatchEvent{
        name = "receive",
        data = data
    }

    --request接收回调
    if not request then
        return
    end
    request:onReceive(cmdX, true)

end

function M.updateServerTime(serverTime)
    M.timediff = serverTime - os.time()*1000
end

--获取服务器时间
function M.getServerTime()
    return os.time()*1000 + M.timediff
end

--本地时区和服务器时区默认为8区
M.localTimeZone = 8
M.serverTimeZone = 8

--设置服务器时区
function M.updateServerTimeZone(timezone)
    --服务器时区 (全球同服 暂时写死)
    local serverTimeZone = timezone
    
    --当前系统时区
    local localTimeZone = 0
    local temp = os.date("*t",0)
    if temp.year == 1970 then 
        localTimeZone = temp.hour
    else
        localTimeZone = temp.hour -24
    end 

    --保存时区
    M.localTimeZone = localTimeZone
    M.serverTimeZone = serverTimeZone
end

--获取服务器 date 数据, 接口等同  os.date()
function M.getServerDate(format, time)
    --时区差
    local diffTimeZone =  M.localTimeZone - M.serverTimeZone
    return os.date(format, time - diffTimeZone*3600)
end

--错误处理
function M.onReceiveError(cmdError, request)
    local dontDispatchEvent = false
    if request then
        dontDispatchEvent = request:onReceive(cmdError, false)
    end

    --是否走默认的错误处理逻辑
    if dontDispatchEvent then

    else
        
        local data = {
            cmdX = cmdError,
            request = request,
        }

        --分发错误事件
        M:dispatchEvent{
            name = "error",
            data = data
        }

    end
end

--定时做超时检测
function M.onUpdate()

    local now = os.time()

    local timeout = false
    for _, request in pairs(M.tmRequest) do
        if now - request.timestamp > M_Timeout then
            timeout = true
            break
        end
    end

    --超时逻辑
    if timeout then
        --request超时回调
        for _, request in pairs(M.tmRequest) do
            if now - request.timestamp > M_Timeout then              
                request:onTimeout()
            end
        end

        --关闭socket
        M.socketTCP:close() 
    end
end

return M



