--
-- Author: Your Name
-- Date: 2016-05-24 23:40:37
--
local M = class(...,require("game.gameObjects.ObjBase"))
M.className = "CmdHeros"
function M.getHeroCaches(  )
	return GameCacheMgr.getGameCacheByName(M.className):getAll()
end
function M.newHero(  )
	
	return CmdData.appendCmdX(clone(CmdCommon["CmdHero"]))
end
function M.createNewObject(  )
	local index = #M.getHeroCaches()+1
	M.request(M.className,M.newHero())
end
function M.requestChangeName( name )
	M.request({name = name})
end

return M