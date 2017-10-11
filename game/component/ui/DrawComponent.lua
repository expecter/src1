--
-- Author: Your Name
-- Date: 2016-08-19 23:58:16
--
local M = class(...,componentBase)

function M:ctor( params)
	M.super.ctor(self,params)
	self:setData(params)
end
function M:setData( params )
	self.borderColor = params.borderColor or cc.c4f(1,1,1,1)
end

function M:initView( )
	print("BBBBBBBBBB")
	self.drawNode = self.target:getView()
end

function M:updateView(  )
	print("AAAAAAAAAAAAAA")
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