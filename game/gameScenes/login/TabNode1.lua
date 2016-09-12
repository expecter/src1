--
-- Author: Your Name
-- Date: 2016-09-08 00:21:26
--
local M = class(..., GameNode)

function M:ctor(  )
	self.viewSprite = display.newSprite("back_1.png")
	self.viewSprite:setAnchorPoint(cc.p(0,0))
	self:setContentSize(self.viewSprite:getContentSize())
	dump(self.viewSprite:getContentSize())
	-- self.viewSprite:setPosition(cc.p(self:getCenterPosition()))
	M.super.ctor(self,{ScrollViewComponent = {viewsize = self.viewSprite:getContentSize(),viewNode = self.viewSprite}})
end
function M:setData(  )
	
end

function M:initView(  )
end

return M