--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("ParkourComponent")
function M:ctor( target ,params)
	self.target = target
	self.vec = cc.p(0,0)
end
function M:getDepends(  )
	return {
		{
			_type = "cc_ClickComponent",
		},
	}
end
function M:initView( target )
	self.ditectSpr = display.newSprite("Direction_bt.png")
	self.ditectSpr:setPosition(target:getCenterPosition())
	target:addChild(self.ditectSpr)
	target:setTouchEvent(handler(self,self.touch))
end
function M:touch( event,x,y )
	if event == "began" then
		if self:isTouch(event,x,y) then
			self:updateHeroState()
		end
	elseif event =="moved" then
		
	elseif event == "ended" then
	end
end
function M:updateHeroState(  )
	local hero = self.target:getGameNode("hero")
	hero:runAction(cc.JumpBy:create(1,cc.p(200,150),100,1))
end
function M:updateView( target )

end
function M:isTouch( event,x,y )
	local ccNode = self.target
    local ccpoint = ccNode:convertToNodeSpace(cc.p(x,y))
    local ccBox = ccNode:getBoundingBox()
    local ccRect = cc.rect(0,0, ccBox.width, ccBox.height)
    return cc.rectContainsPoint(ccRect,ccpoint)
end
function M:bindFunc( target )
end
return M