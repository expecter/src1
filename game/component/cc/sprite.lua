--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( target ,params)
	self.target = target
	self.spriteName = params.spriteName or "img_btn_gray_2_s"
	self.isToContentSize = DEFAULT_FALSE(params.isToContentSize) 
	self:setData(params)
end
function M:setData(params )
end
function M:initView( target )
	self.viewSprite = display.newSprite(string.format("%s.png",self.spriteName))
	self.viewSprite:setPosition(cc.p(target:getCenterPosition()))
	target:addChild(self.viewSprite)
	if self.isToContentSize then
		target:setContentSize(self.viewSprite:getContentSize())
	end
end
function M:updateView( target )
	self.viewSprite:setSpriteFrame(display.newSpriteFrame(string.format("%s.png",self.spriteName)))
end
function M:getSprite(  )
	return self.viewSprite
end
function M:updateSpriteName( target,spriteName )
	self.spriteName=spriteName
	self:updateView()
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
end
return M