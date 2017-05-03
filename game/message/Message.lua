--
-- Author: Your Name
-- Date: 2017-04-13 17:50:38
--定义某些公用function
-- local ModelName = ...

local M = {}
cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()
--打印分发的点击事件
for k,eventName in pairs(MessageType) do
    M:addEventListener(eventName,function ( cmdX )
        dump(cmdX.data,eventName)
    end)
end

return M