--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( target ,params)
	self.target = target
	self:setData(params)
end
function M:setData(params )
end
function M:initView( target )	
end
function M:updateView( target )
end
function M:bindFunc( target )
	target:bindMethod(self,"updateView")
	target:bindMethod(self,"initView")
end
return M