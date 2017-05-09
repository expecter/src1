--
-- Author: Your Name
-- Date: 2017-05-09 14:38:59
--
local M = {}

function M.getGameCaches(  )
	for k,gameCache in pairs(tmGameCache) do
		for _,request in ipairs(gameCache.requestName) do
			-- gameCache[request.name](request.params)
		end
	end
	return GameCacheMgr.getAllGameCache()
end

return M