--
-- Author: Your Name
-- Date: 2016-08-23 23:56:31
--
local M =class(..., require("game.gameSceneMgr.GamePanelFloat"))

function M:ctor( params )
	M.super.ctor(self)
	-- self:setData(params) 
end
function M:initView(  )
	self.owner = CCBReader.load("ccbi_troop_view_floatPanel")
	self:addChild(self.owner)
end
function M:getFloatNode() 
	return self.owner.ccNodeFloat
end
return M