--
-- Author: Your Name
-- Date: 2016-09-08 00:21:26
--
local M = class(..., GameNode)

function M:ctor(  )
	self.owner = CCBReader.load("ccbi_capital.ccbi")
	-- self:setContentSize(self.viewSprite:getContentSize())
	-- self.viewSprite:setPosition(cc.p(self:getCenterPosition()))
	M.super.ctor(self,{ScrollViewComponent = {viewsize = cc.size(display.width,display.height),viewNode = self.owner}})
end
function M:setData(  )
	
end

function M:initView(  )
end

return M