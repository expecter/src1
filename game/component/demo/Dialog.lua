--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( target ,params)
	self.target = target
	self:setData(params)
end
function M:getDepends(  )
	return {
		{
			_type = "cc_ClickComponent",
		},
	}
end
function M:setData(params )
end
function M:initView( )
	local size = self.target:getContentSize()
	self.width_ = size.width
	self.height_ = size.height
	self.target:setTouchEvent(handler(self,self.touch))
end
function M:touch( event,x,y )
end
return M