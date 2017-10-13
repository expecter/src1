--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class(...,componentBase)
function M:ctor(params)
end
function M:setData(params )
end
function M:initView( parent )
end
function M:enterView(  )
	self.target:addListener(v,function ( cmdX )
	end)
end
function M:exitView(  )
	
end
function M:bindFunc( target )
end
return M