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
	dump(CmdCommon[name])
end
-- M.LoadLocalData()
static_Listener:addEventListener("CmdAppend",function ( event )
	local data = event.data
	tmGameCache[event.className]:updateByProto(data)
end)
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