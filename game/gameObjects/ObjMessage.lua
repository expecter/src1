--
-- Author: Your Name
-- Date: 2016-11-16 21:43:53
--
local M = {}
local event = require("framework.cc.components.behavior.EventProtocol").new()
event:bind_(cc(M))
event:exportMethods() 
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