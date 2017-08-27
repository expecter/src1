
-----------------------------------------------------------------------------------------------  
-- @description  游戏管理器
-- @author  ny
-- @coryright  蜂鸟工作室
-- @release  2015/11/30
--------------------------------------------------------------------------------------------

local M = {}

cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()

--游戏当状态: 
--登录状态:login 
--加载状态:loading 
--运行状态:running
--非运行状态:idle
M.state = nil
M.LOGINDATA=nil
--初始化
--function M.init()

--end

--登录游戏
function M.loginGame()
    M.state = "login"
    GameSceneMgr.replaceLayer("game.gameScenes.login.FightLayer")
end

--开始游戏, 加载完成后, 会执行enterGame
function M.startGame(accountInfo, serverInfo, fErrCallback)

    M.state = "start"

    M:dispatchEvent{
        name = "startGame"
    }

    local connect 
    connect = function()
        print("connect")

        local function response(data)
            M.LOGINDATA=data
            M.loadingGame()
        end

        local function errresponse()
            fErrCallback()
        end
        local params = {
            openId = accountInfo.openId,
            userType = 0,
            serverSign = accountInfo.token,
            timestamp = accountInfo.timestamp,
            channelSimpleName = "youai01",
            ver = 42010,
            imei = "test",
            sdkType = 0,
            serverId=serverInfo.id
        }
        net.Client.request{
            messageName = "CmdLogin", 
            params = params, 
            fCallback = response,
            fErrorCallback = errresponse}
    end


    --开启socket
    net.Client.start(serverInfo.address, tonumber(serverInfo.port), tonumber(serverInfo.id), 
        --连接成功
        function()
            connect()
        end,
        --连接失败
        function()
            fErrCallback()
        end, 
        --连接断开
        function()
            M.onSocketClose()
        end)

end

--加载游戏
function M.loadingGame()

    M.state = "loading"

    --加载游戏
    M:dispatchEvent{
        name = "loadingGame"
    }

    local fCallback = function()
        M.enterGame()
    end
    
    --[[
    net.Client.request{
        messageName = "CmdQueryNoticeFlag", 
        params = {}, 
        fCallback = function(data) 
        end,
    } 
    --]]
    GameSceneMgr.replaceLayer("game.gameScenes.login.LayerLoading", fCallback)
end

--开始游戏
function M.enterGame()

    M.state = "running"

    --enterGame
    M:dispatchEvent{
        name = "enterGame"
    }
    
    GameSceneMgr.replaceNormalLayer("game.gameScenes.world.LayerWorld")
    -- GameSceneMgr.replaceNormalLayer("game.gameScenes.login.loginLayer")
    -- GameSceneMgr.replaceLayer("game.config.demo.DialogLayer")
end

--退出游戏并切换到登录界面
function M.exitGame()

    M.state = "idle"

    M:dispatchEvent{
        name = "exitGame"
    }

    --清理缓存
    -- GameCacheMgr:clean()

    --登录游戏
    -- M.loginGame()
end

--socket断开连接处理函数
function M.onSocketClose()
    if M.state ~= "login" then
        M.exitGame()
        print("~~~~~~~~~~~~~~~~~onSocketClose~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        AlertTips.showTips(G_W("断开连接"))
    end
end

function M.getCurTime(  )
    return os.time()*1000
end

return M