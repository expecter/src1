--
-- Author: Your Name
-- Date: 2016-11-16 21:47:08
--
local M = {}
M.cache = {}
GameMgr:addEventListener("enterGame",function()
    for i,v in ipairs(ref.getRef{refName = "refarmy"}) do
    	local cache = clone(v)
    	cache.health = 100
    	M.cache[i] = cache
    end
end)

GameSceneMgr:addEventListener("time",function (  )
	for i,v in ipairs(M.cache) do
		v.health = v.health-1
	end
end)
function M.getCacheData(  )
	return M.cache
end
return M