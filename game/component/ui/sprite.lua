--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class(...,componentBase)
function M:ctor(params)
	M.super.ctor(self,params)
	self.spriteName = params.spriteName
	self.spriteFrameName = params.spriteFrameName
	self.isEnough = DEFAULT_FALSE(params.isEnough) 
	self.object = params.object
	self.viewSprite = params._ccNode
	-- self:setData(params)
end
function M:getDepends(  )
	-- return {
	-- 	{
	-- 		_type = "cc_node",
	-- 	},
	-- }
	local func = {}
	if self.spriteFrameName then
		--TODO需要添加查找plist配置添加
		func = {
			_type = "cc_spriteFrame",
		}
	end
	return func
end
-- function M:setData(params )
-- end
function M:initView( parent )
	if not self.viewSprite then
		self.viewSprite = display.newSprite()
		parent:addChild(self.viewSprite)
	end
	if self.spriteName then
		self.viewSprite:setSpriteFrame(display.newSpriteFrame(string.format("%s.png",self.spriteName)))
	end
	if self.spriteFrameName then
		self.viewSprite:setSpriteFrame(display.newSpriteFrame(string.format("#%s.png",self.spriteFrameName)))
	end
end
function M:updateSpriteName( target,spriteName )
	if self.spriteName == spriteName then return end
	self.spriteName=spriteName
	self.viewSprite:setSpriteFrame(display.newSpriteFrame(string.format("%s.png",self.spriteName)))
end

function M:updateView(  )
	if self.object then
		local spr = ComponentUtil.getData(self.object)
		self.target:updateSpriteName(spr)
	end
end
function M:getView(  )
	return self.viewSprite
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
	target:bindMethod(self,"getView")
end
return M