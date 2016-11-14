--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( target ,params)
	self.target = target
	self.spriteName = params.spriteName
	self.spriteFrameName = params.spriteFrameName
	self.isEnough = DEFAULT_FALSE(params.isEnough) 
	self:setData(params)
end
function M:setData(params )
end
function M:initView( target )
	
	if self.spriteName then
		self.viewSprite = display.newSprite(string.format("%s.png",self.spriteName))
	end
	if self.spriteFrameName then
		self.viewSprite = display.newSprite(string.format("#%s.png",self.spriteFrameName))
	end	
	if self.isEnough then
		self.target:setContentSize(self.viewSprite:getContentSize())
	end
	self.viewSprite:setPosition(cc.p(self.target:getCenterPosition()))
	-- self.viewSprite:setAnchorPoint(cc.p(0,0))
	self.target:addChild(self.viewSprite)
end
function M:updateView( target )
	
end
function M:getSprite(  )
	return self.viewSprite
end
function M:updateSpriteName( target,spriteName )
	self.spriteName=spriteName
	self.viewSprite:setSpriteFrame(display.newSpriteFrame(string.format("%s.png",self.spriteName)))
end
--对应onenter
function M:enterView(  )
	
end
--对应onexit
function M:exitView(  )
	
end
--对应release
function M:releaseView(  )
	
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"updateSpriteName")
	target:bindOnceMethod(self,"getSprite")
end
return M