--
-- Author: Your Name
-- Date: 2016-05-23 23:53:58
--
local data = {
	CmdPlayer = {
		name = "jean",
		level = 1,
	},
	CmdHero = {
		{id = 1,level = 2},
		{id = 2,level = 2},
		{id = 3,level = 3},
	},
}
local M = {}
local GameCache = import(".GameCache")
for k,v in pairs(data) do
	tmGameCache[k] = GameCache.new(v)
end
static_Listener:addEventListener("CmdAppend",function ( event )
	local data = event.data
	tmGameCache[event.enumName]:updateByProto(data)
end)
function M.LoadLocalData(  )	
	for k,v in pairs(data) do
		GameStateManager:getDataByName(k)
	end
end
function M.saveLocalData(  )
	for k,v in pairs(tmGameCache) do
		GameStateManager:save({name = k,data = v})
	end
end
return M