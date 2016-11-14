--
-- Author: Your Name
-- Date: 2016-08-19 23:58:16
--
local M = class(...)

function M:ctor( target ,params)
	self.target = target
	self:setData(params)
end
function M:getDepends(  )
	return {
		{
			_type = "cc_node",
		},
	}
end
function M:setData( params )
	self.borderColor = params.borderColor or cc.c4f(1,1,1,1)
end

function M:initView( )
	self.drawNode = display.newPolygon(self:initPoints(), {fillColor = cc.c4f(0,0,0,0), borderColor = self.borderColor, borderWidth = 0.5})
    self.target:addChild(self.drawNode)
end

function M:updateView(  )
	self.drawNode:clear()
	display.newPolygon(self:initPoints(), {fillColor = cc.c4f(0,0,0,0), borderColor = self.borderColor, borderWidth = 0.5},self.drawNode)
end
function M:initPoints(  )
	local width = self.target:getContentSize().width
	local height = self.target:getContentSize().height
	local x,y = self.target:getPosition()
	local anX = self.target:getAnchorPoint().x
	local anY = self.target:getAnchorPoint().y
	x = 0
	y = 0
	return {
        {x,y},
        {x + width, y},
        {x + width, y + height},
        {x, y + height}
    }
end
function M:bindFunc( target )
    
end
return M