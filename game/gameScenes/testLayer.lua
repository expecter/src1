--测试接口专用界面
local M = class(..., GameLayer)

function M:ctor(  )
	local viewList
	viewList:setTlCcNode()
end

function M:request( className,funcName,params )
	local CacheObj = GameCache[className]
	if CacheObj then
		CacheObj[funcName](params)
	end	
end


return M