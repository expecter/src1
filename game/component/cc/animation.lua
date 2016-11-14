--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("cc_animation")
function M:ctor( target ,params)
	self.target = target
	self:setData(params)
end
function M:setData(params )
end
function M:initView(  )
	local tlSpriteFrame = {}
	for i=1,9 do
		local name = string.format("img_npc_1_att1_0%d",i)
		local spriteFrame = display.newSpriteFrame(name..".png")
        tlSpriteFrame[#tlSpriteFrame + 1] = spriteFrame
        -- target:getSprite():setSpriteFrame(spriteFrame)
	end
	local animation = display.newAnimation(tlSpriteFrame, 0.1)
	local action=cc.RepeatForever:create(cc.Animate:create(animation))
	self.target:getSprite():runAction(action)
	-- target:getSprite():playAnimationOnce(animation)
end
function M:updateView( target )
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
end
return M