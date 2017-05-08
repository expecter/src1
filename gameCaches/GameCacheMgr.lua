--
-- Author: Your Name
-- Date: 2016-05-23 23:53:58
--
local M = {}
local GameCache = import(".GameCache")
local CmdCommon = require("gameCaches.caches.CmdCommon")
local tmGameCache = {}

for _,name in pairs(CmdCommon.CacheName) do
	if GameStateManager:getDataByName(name) then
		tmGameCache[name] = GameCache.new(GameStateManager:getDataByName(name))
	else
		tmGameCache[name] = GameCache.new({})
	end
end
-- static_Listener:addEventListener("CmdAppend",function ( event )
-- 	local data = event.data
-- 	tmGameCache[event.className]:updateByCmdX(data)
-- end)
function M.getGameCacheByName(enumCacheName)
	return tmGameCache[enumCacheName]
end

-- function M.saveLocalData(  )
-- 	for k,v in pairs(tmGameCache) do
-- 		GameStateManager:save({name = k,data = v:getAll()})
-- 	end
-- end
return M