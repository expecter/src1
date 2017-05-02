--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("AutoScrollComponent")
function M:ctor( target ,params)
	self.target = target
	self:setData(params)
end
function M:setData(params )
    self.dir = "v"
    self.vec = 20
end
function M:enterView( target )
	self:startScroll(target)
end
function M:startScroll( target )
	local contentSize = target:getViewNode():getContentSize()
	local pos = cc.p(0,0)
	local length = 0
	if self.dir == "h" then
		length = contentSize.height-display.height
		pos.y = pos.y-length
	else
		length = contentSize.width-display.width
		pos.x = pos.x-length
	end
	local time = length/self.vec
	target:setScrollOffsetInDuration(pos,time)
	target:setScrollMovable(false)
end
function M:updateView( target )	
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"startScroll")
end
return M