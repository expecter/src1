--
-- Author: Your Name
-- Date: 2017-04-13 17:50:38
--定义某些公用function
-- local ModelName = ...
--执行某些游戏消息事件
local M = {}

M.MessageName =
{
    replaceLayer = "replaceLayer", --切换界面 参数name = "loginLayer"
    pushLayer = "pushLayer", --弹出界面 参数name = "loginLayer"
    showPanel = "showPanel", --窗口界面 参数name = "loginLayer"
    switchTo = "switchTo", --切换标签页
    enterGame = "enterGame",
    exitGame = "exitGame",
    saveGame = "saveGame",
    releaseNode = "releaseNode",
    update = "update",
    time = "time",
    request = "request", --修改cache请求 参数cacheName = "CachesItem",funcName = "newItem",params = {}
    dispatch = "dispatch", --界面点击分发事件
    guideScript = "guideScript",--指定引导步骤
    registerTimeEvent = "registerTimeEvent",--注册各种时间事件
    updateData = "updateData",
}
cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()
--打印分发的点击事件
for k,eventName in pairs(M.MessageName) do
    if eventName~="update" and eventName~="time" then
        M:addEventListener(eventName,function ( cmdX )
            -- dump(cmdX.data,eventName)
        end)
    end
    
end
M:addEventListener(M.MessageName.exitGame,function ( cmdX )
    --TODO判断是否能进入界面
    GameMgr.exitGame()
end)

function M.onEventHandler( params )
    for i,v in ipairs(params) do
        if M[params.eventName] then
            M[params.eventName](params)
        end
    end
end
--nodeName
--funcName
--params
--[[
    
]]
function M.callfunc( params )
    
end

function M.switchto( params )

end

function M.click( params )
    
end

function M.request( params )
    
end

function M.exitGame( params )
    
end

return M