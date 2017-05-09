--
-- Author: Your Name
-- Date: 2016-05-23 23:53:58
--
local M = {}
local GameCache = import(".GameCache")
local tmGameCache = {}
local CacheName = {
	"CacheCard",
	"CacheFight",
	"CacheHero",
	"CachePlayer",
}
for _,name in pairs(CacheName) do
	tmGameCache[name] = require("gameCaches."..name).new()
end

-- static_Listener:addEventListener("CmdAppend",function ( event )
-- 	local data = event.data
-- 	tmGameCache[event.className]:updateByCmdX(data)
-- end)
function M.getGameCacheByName(enumCacheName)
	return tmGameCache[enumCacheName]
end
function M.getAllGameCache(  )
	return tmGameCache
end

-- function M.saveLocalData(  )
-- 	for k,v in pairs(tmGameCache) do
-- 		GameStateManager:save({name = k,data = v:getAll()})
-- 	end
-- end
return M