--
-- Author: Your Name
-- Date: 2016-09-06 23:51:18
--
local M = class(...,require("game.gameNode.GamePanelFloat"))
function M:ctor(  )
	M.super.ctor(self)
end
function M:initView(  )
	self.ccNode = CCBReader.load("ccbi_login_account.ccbi")
	self.ccNode:setPosition(display.cx,display.cy)
    self:addChild(self.ccNode)
end
function M:getFloatNode(  )
	return self.ccNode
end
return M