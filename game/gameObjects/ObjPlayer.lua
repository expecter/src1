--
-- Author: Your Name
-- Date: 2016-05-24 23:40:37
--
local M = class(...,require("game.gameObjects.GameObj"))
M.class = "CmdPlayer"
function M.createNewObject(  )
	M.request()
end
function M.requestChangeName( name )
	M.request({name = name})
end
return M