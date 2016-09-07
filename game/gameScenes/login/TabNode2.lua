--
-- Author: Your Name
-- Date: 2016-09-08 00:21:26
--
local M = class(..., GameNode)

function M:ctor(  )
	M.super.ctor(self,{})
end
function M:setData(  )
	
end

function M:initView(  )
	self.viewSprite = display.newSprite("back_5.png")
	self.viewSprite:setPosition(cc.p(self:getCenterPosition()))
	self:setContentSize(self.viewSprite:getContentSize())
	self:addChild(self.viewSprite)
end

return M