--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("mapcomponent")
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
function M:initView( target )
	local size = target:getContentSize()
	self.width_ = size.width
	self.height_ = size.height
	target:setTouchEvent(handler(self,self.touch))
end
function M:touch( event,x,y )
	if event == "began" then
		self.drag = {
	        startX  = x,
	        startY  = y,
	        lastX   = x,
	        lastY   = y,
	        offsetX = 0,
	        offsetY = 0,
	    }
	elseif event =="moved" then
		self.drag.offsetX = x - self.drag.lastX
        self.drag.offsetY = y - self.drag.lastY
        self.drag.lastX = x
        self.drag.lastY = y
        self.target:moveOffset(self.drag.offsetX, self.drag.offsetY)
	elseif event == "ended" then
		self.drag = nil
	end
end
--[[--

返回地图尺寸

]]
function M:getSize(target)
    return self.width_, self.height_
end
function M:updateView( target )	
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"getSize")
end
return M