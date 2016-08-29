--[[
For quick-cocos2d-x
SocketTCP lua
@author zrong (zengrong.net)
Creation: 2013-11-12
Last Modification: 2013-12-05
@see http://cn.quick-x.com/?topic=quickkydsocketfzl
]]
local SOCKET_TICK_TIME = 0.1            -- check socket data interval
local SOCKET_RECONNECT_TIME = 5         -- socket reconnect try interval
local SOCKET_CONNECT_FAIL_TIMEOUT = 3   -- socket failure timeout

local STATUS_CLOSED = "closed"
local STATUS_NOT_CONNECTED = "Socket is not connected"
local STATUS_ALREADY_CONNECTED = "already connected"
local STATUS_ALREADY_IN_PROGRESS = "Operation already in progress"
local STATUS_TIMEOUT = "timeout"

local LENGTH_HEAD = 4 --粘包头长度

local scheduler = require("framework.scheduler")
local socket = require "socket"

local SocketTCP = class("SocketTCP")

SocketTCP.EVENT_DATA = "SOCKET_TCP_DATA"
SocketTCP.EVENT_CLOSE = "SOCKET_TCP_CLOSE"
SocketTCP.EVENT_CLOSED = "SOCKET_TCP_CLOSED"
SocketTCP.EVENT_CONNECTED = "SOCKET_TCP_CONNECTED"
SocketTCP.EVENT_CONNECT_FAILURE = "SOCKET_TCP_CONNECT_FAILURE"

SocketTCP._VERSION = socket._VERSION
SocketTCP._DEBUG = socket._DEBUG

--[[
获取数字的整数部分
]]
local function getIntPart(x)
    if x <= 0 then
       return math.ceil(x);
    end
    
    if math.ceil(x) == x then
       x = math.ceil(x);
    else
       x = math.ceil(x) - 1;
    end
    return x;
end

--[[
将数字转换成字节数据并返回，最大支持99999999
与bytes2Num(bytes)配合使用
]]
local function num2Bytes(num)
    local BASE_ZERO =28
    if type(num) =="number"  and  num >0 and num <= 99999999 then 
        local temp =num
        local weiItem=0
        local re_btyes={}
        local i
        for i=1,4 do
            if temp >0 then 
                weiItem= temp % 100
                re_btyes[#re_btyes+1] = weiItem+BASE_ZERO
                temp = getIntPart(temp / 100)
            else
                re_btyes[#re_btyes+1]=BASE_ZERO
            end
        end 
        local result = string.char(re_btyes[4],re_btyes[3],re_btyes[2],re_btyes[1])  
        --eachInfo("num2Btyes reslt="..result)
        return result
    end
    echoInfo("num must >0 and <= 99999999") 
end 

--[[
将字节数据转换为数字并返回，与num2Btyes(num) 配合使用
]]
local function bytes2Num(bytes)
    local BASE_ZERO =28
    if type(bytes) =="string" and  string.len(bytes)==4 then
        local wei =1
        local re_num=0
        local i
        for i=4,1,-1 do
            re_num = re_num + (string.byte(bytes,i)-BASE_ZERO) * wei
            if i > 1 then 
                wei = wei * 100
            end
        end
        --eachInfo(string.format("bytes2Num re_num=%d",re_num))
        return re_num 
    end 
    echoInfo("bytes len must is 4")
end

function SocketTCP.getTime()
    return socket.gettime()
end

function SocketTCP:ctor(__host, __port, __retryConnectWhenFailure)
    cc(self):addComponent("components.behavior.EventProtocol"):exportMethods()

    self.host = __host
    self.port = __port
    self.tickScheduler = nil            -- timer for data
    self.reconnectScheduler = nil       -- timer for reconnect
    self.connectTimeTickScheduler = nil -- timer for connect timeout
    self.name = 'SocketTCP'
    self.tcp = nil
    self.isRetryConnect = __retryConnectWhenFailure
    self.isConnected = false
end

function SocketTCP:setName( __name )
    self.name = __name
    return self
end

function SocketTCP:setTickTime(__time)
    SOCKET_TICK_TIME = __time
    return self
end

function SocketTCP:setReconnTime(__time)
    SOCKET_RECONNECT_TIME = __time
    return self
end

function SocketTCP:setConnFailTime(__time)
    SOCKET_CONNECT_FAIL_TIMEOUT = __time
    return self
end

function SocketTCP:connect(__host, __port, __retryConnectWhenFailure)
    if __host then self.host = __host end
    if __port then self.port = __port end
    if __retryConnectWhenFailure ~= nil then self.isRetryConnect = __retryConnectWhenFailure end
    assert(self.host or self.port, "Host and port are necessary!")
    --printInfo("%s.connect(%s, %d)", self.name, self.host, self.port)
    self.tcp = socket.tcp()
    self.tcp:settimeout(0)

    local function __checkConnect()
        local __succ = self:_connect()
        if __succ then
            self:_onConnected()
        end
        return __succ
    end

    if not __checkConnect() then
        -- check whether connection is success
        -- the connection is failure if socket isn't connected after SOCKET_CONNECT_FAIL_TIMEOUT seconds
        local __connectTimeTick = function ()
            --printInfo("%s.connectTimeTick", self.name)
            if self.isConnected then return end
            self.waitConnect = self.waitConnect or 0
            self.waitConnect = self.waitConnect + SOCKET_TICK_TIME
            if self.waitConnect >= SOCKET_CONNECT_FAIL_TIMEOUT then
                self.waitConnect = nil
                self:close()
                self:_connectFailure()
            end
            __checkConnect()
        end
        self.connectTimeTickScheduler = scheduler.scheduleGlobal(__connectTimeTick, SOCKET_TICK_TIME)
    end
end
function SocketTCP:bind( host, port )
    local sock, err = socket.tcp()
    if not sock then return nil, err end
    sock:setoption("reuseaddr", true)
    local res, err = sock:bind(host, port)
    if not res then return nil, err end
    res, err = sock:listen(backlog)
    if not res then return nil, err end
    return sock
end
function SocketTCP:_send(__data)
    assert(self.isConnected, self.name .. " is not connected.")
    self.tcp:send(__data)
end

function SocketTCP:send(__data)
    local len = LENGTH_HEAD + string.len(__data)
    __data = num2Bytes(len)..__data
    self:_send(__data)
end

function SocketTCP:close( ... )
    --printInfo("%s.close", self.name)
    self.tcp:close();
    if self.connectTimeTickScheduler then scheduler.unscheduleGlobal(self.connectTimeTickScheduler) end
    if self.tickScheduler then scheduler.unscheduleGlobal(self.tickScheduler) end
    self:dispatchEvent({name=SocketTCP.EVENT_CLOSE})
end

-- disconnect on user's own initiative.
function SocketTCP:disconnect()
    self:_disconnect()
    self.isRetryConnect = false -- initiative to disconnect, no reconnect.
end

--------------------
-- private
--------------------

--- When connect a connected socket server, it will return "already connected"
-- @see: http://lua-users.org/lists/lua-l/2009-10/msg00584.html
function SocketTCP:_connect()
    local __succ, __status = self.tcp:connect(self.host, self.port)
    -- print("SocketTCP._connect:", __succ, __status)
    return __succ == 1 or __status == STATUS_ALREADY_CONNECTED
end

function SocketTCP:_disconnect()
    self.isConnected = false
    self.tcp:shutdown()
    self:dispatchEvent({name=SocketTCP.EVENT_CLOSED})
end

function SocketTCP:_onDisconnect()
    --printInfo("%s._onDisConnect", self.name);
    self.isConnected = false
    self:dispatchEvent({name=SocketTCP.EVENT_CLOSED})
    self:_reconnect();
end

-- connecte success, cancel the connection timerout timer
function SocketTCP:_onConnected()
    --printInfo("%s._onConnectd", self.name)
    self.isConnected = true
    self:dispatchEvent({name=SocketTCP.EVENT_CONNECTED})
    if self.connectTimeTickScheduler then scheduler.unscheduleGlobal(self.connectTimeTickScheduler) end

    local __tick = function()
        while true do
            -- if use "*l" pattern, some buffer will be discarded, why?
            local __body, __status, __partial = self.tcp:receive("*a")  -- read the package body
            --print("body:", __body, "__status:", __status, "__partial:", __partial)
            if __status == STATUS_CLOSED or __status == STATUS_NOT_CONNECTED then
                self:close()
                if self.isConnected then
                    self:_onDisconnect()
                else
                    self:_connectFailure()
                end
                return
            end
            if  (__body and string.len(__body) == 0) or
                (__partial and string.len(__partial) == 0)
            then return end
            if __body and __partial then __body = __body .. __partial end
            self:dispatchEvent({name=SocketTCP.EVENT_DATA, data=(__partial or __body), partial=__partial, body=__body})
        end
    end

    -- start to read TCP data
    self.tickScheduler = scheduler.scheduleGlobal(__tick, SOCKET_TICK_TIME)
end

-- connecte success, cancel the connection timerout timer
function SocketTCP:_onConnected()
    --printInfo("%s._onConnectd", self.name)
    self.isConnected = true
    self:dispatchEvent({name=SocketTCP.EVENT_CONNECTED})
    if self.connectTimeTickScheduler then scheduler.unscheduleGlobal(self.connectTimeTickScheduler) end


    --创建一个 长度为len的 接收函数
    local function create_receive(len)
        
        local len = len
        local tlData = {}
            
        return function()
            if len == 0 then 
                return table.concat(tlData)
            end

            
            --请求
            local __body, __status, __partial = self.tcp:receive(len) 

            --请求失败
            if __status == STATUS_CLOSED or __status == STATUS_NOT_CONNECTED then
                self:close()
                if self.isConnected then
                    self:_onDisconnect()
                else
                    self:_connectFailure()
                end
                return false
            end

            --拼接数据
            if  (__body and string.len(__body) == 0) or (__partial and string.len(__partial) == 0) then return true end
            if __body and __partial then __body = __body .. __partial end
            __body = __partial or __body

            if not __body then return true end

            table.insert(tlData, __body)
            len = len-string.len(__body)
            if len ~= 0 then return true end

            return table.concat(tlData)
        end
        

    end

    
    local status = "idle" -- or "head" or "body" or "die"
    local receive = nil


    local function switch_idle()
        status = "idle"
        receive = nil
    end

    local function switch_head()
        status = "head"
        receive = create_receive(LENGTH_HEAD)
    end

    local function switch_die()
        status = "die"
        receive = nil
    end

    local function switch_body(len)
        status = "body"
        receive = create_receive(len)
    end

    local function idle()
        switch_head()
    end

    local function head()
        local ret = receive()
        if ret == false then
            switch_die()
            return
        end
        if ret == true or ret == nil then
            return
        end

        local number = bytes2Num(ret)
        switch_body(number - LENGTH_HEAD) --有时候好像需要加2个字节长度? 因为服务端的框架会发多2个字节
    end

    local function body()
        local ret = receive()
        if ret == false then
            switch_die()
            return
        end
        if ret == true or ret == nil then
            return
        end

        switch_idle()

        self:dispatchEvent{name=SocketTCP.EVENT_DATA, data=ret}
    end

    local function die()
        -- do nothing
    end

    local tm = {
        idle = idle,
        head = head,
        body = body,
        die = die,
    }
    local __tick = function()
        tm[status]()
    end

    -- start to read TCP data
    self.tickScheduler = scheduler.scheduleGlobal(__tick, SOCKET_TICK_TIME)
end

function SocketTCP:_connectFailure(status)
    self:dispatchEvent({name=SocketTCP.EVENT_CONNECT_FAILURE})
    self:_reconnect();
end

-- if connection is initiative, do not reconnect
function SocketTCP:_reconnect(__immediately)
    if not self.isRetryConnect then return end
    if __immediately then self:connect() return end
    if self.reconnectScheduler then scheduler.unscheduleGlobal(self.reconnectScheduler) end
    local __doReConnect = function ()
        self:connect()
    end
    self.reconnectScheduler = scheduler.performWithDelayGlobal(__doReConnect, SOCKET_RECONNECT_TIME)
end

return SocketTCP
