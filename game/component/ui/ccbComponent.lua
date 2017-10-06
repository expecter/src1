--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class(...,componentBase)
function M:ctor(params)
	M.super.ctor(self,params)
	self:setData(params)
end
function M:setData(params )
	self.ccbName = params.ccbName or "ccbi_capital"
end
-- function M:cellMode( cmdX )
	
-- end
--exportFunc
function M:initView( )
	self.owner = CCBReader.load(string.format("%s.ccbi",self.ccbName))
	self.target:addChild(self.owner)
	self.target:setContentSize(self.owner:getContentSize())
end
function M:getOwner(  )
	return self.owner
end
function M:updateView( )
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"getCCBOwner")
end
return M