--
-- Author: Your Name
-- Date: 2016-11-17 15:24:20
--
local M = {}
cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()
local modelName = {}
for i,v in ipairs(modelName) do
	GameMgr:addEventListener(v,function()
	    
	end)
end
return M