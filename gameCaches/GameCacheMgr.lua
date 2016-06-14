--
-- Author: Your Name
-- Date: 2016-05-23 23:53:58
--
local M = {}
local GameCache = import(".GameCache")
local CmdCommon = require("gameCaches.caches.CmdCommon")
local tmGameCache = {}

for _,name in pairs(CmdCommon.CacheName) do
	tmGameCache[name] = GameCache.new({})
	-- dump(tmGameCache[name]:getCmdX())
end
for _,name in pairs(CmdCommon.CacheName) do
	tmGameCache[name]:updateByCmdX(GameStateManager:getDataByName(name) or {})
	dump(GameStateManager:getDataByName(name))
end
static_Listener:addEventListener("CmdAppend",function ( event )
	local data = event.data
	dump(data)
	tmGameCache[event.className]:updateByCmdX(data)
end)
function M.getGameCacheByName(enumCacheName)
	return tmGameCache[enumCacheName]
end

function M.saveLocalData(  )
	for k,v in pairs(tmGameCache) do
		GameStateManager:save({name = k,data = v:getAll()})
	end
end
return M