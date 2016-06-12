--
-- Author: Your Name
-- Date: 2016-05-23 23:53:58
--
local M = {}
local GameCache = import(".GameCache")
local CmdCommon = require("gameCaches.caches.CmdCommon")
local tmGameCache = {}

for _,name in pairs(CmdCommon.CacheName) do
	tmGameCache[name] = GameCache.new(CmdCommon[name])
	-- dump(tmGameCache[name]:getCmdX())
end
-- M.LoadLocalData()
static_Listener:addEventListener("CmdAppend",function ( event )
	local data = event.data
	dump(data)
	tmGameCache[event.className]:updateByCmdX(data)
end)
function M.getGameCacheByName(enumCacheName)
	return tmGameCache[enumCacheName]
end
function M.LoadLocalData(  )	
	for _,name in pairs(CmdCommon.CacheName) do
		tmGameCache[k]:updateByProto(GameStateManager:getDataByName(name))
	end
end
function M.saveLocalData(  )
	for k,v in pairs(tmGameCache) do
		GameStateManager:save({name = k,data = v})
	end
end
return M