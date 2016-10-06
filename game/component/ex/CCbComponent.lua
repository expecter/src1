--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("CCbComponent")
function M:ctor( target ,params)
	self.target = target
	self:setData(params)
end
function M:setData(params )
	self.ccbName = params.ccbName or "ccbi_capital.ccbi"
end
-- function M:cellMode( cmdX )
	
-- end
--exportFunc
function M:initView( target )
	self.owner = CCBReader.load(string.format("%s.ccbi",self.ccbName))
	target:addChild(self.owner)
	target:setContentSize(self.owner:getContentSize())
end
function M:getCCBOwner(  )
	return self.owner
end
function M:updateView( target )
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"getCCBOwner")
end
return M