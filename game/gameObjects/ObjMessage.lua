--
-- Author: Your Name
-- Date: 2016-11-16 21:43:53
--
local M = {}
cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()
M.clickEvent = {
    switch = "switch",
}
--打印分发的点击事件
for k,eventName in pairs(M.clickEvent) do
    M:addEventListener(eventName,function ( cmdX )
        dump(cmdX.data,eventName)
    end)
end
return M