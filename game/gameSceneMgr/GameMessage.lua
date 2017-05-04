--
-- Author: Your Name
-- Date: 2017-04-13 17:50:38
--定义某些公用function
-- local ModelName = ...
--执行某些游戏消息事件
local M = {}

M.MessageName =
{
    replaceLayer = "replaceLayer", --切换界面
    pushLayer = "pushLayer", --弹出界面
    showPanel = "showPanel", --窗口界面
	Msg_ReceiveBall = "Msg_ReceiveBall",
    Msg_PassToMe = "Msg_PassToMe",
    Msg_SupportAttacker = "Msg_SupportAttacker",
    Msg_GoHome = "Msg_GoHome",
    Msg_Wait = "Msg_Wait",
    switch = "switch", --切换标签页
    enterGame = "enterGame",
    exitGame = "exitGame",
    saveGame = "saveGame",
}
cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()
--打印分发的点击事件
for k,eventName in pairs(MessageType) do
    M:addEventListener(eventName,function ( cmdX )
        dump(cmdX.data,eventName)
    end)
end

return M