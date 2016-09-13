--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("eventComponent")
function M:ctor( target ,params)
	self.target = target
	self.cellMode = params.cellMode or function ( params )
		return GameCell.new(params)
	end
	self.isTapMenu = DEFAULT_TRUE(params.isTapMenu)
	self.defaultIndex = params.defaultIndex or 1
	self:setData(params)
end
function M:setData(params )
	self.tlData = params.tlData
end
-- function M:cellMode( cmdX )
	
-- end
--exportFunc
function M:initView( target )
	-- self.viewlist = UICommon.createViewList(target,self.isMovable)	
end
function M:updateView( target )
	if not self.viewlist then
		self.viewlist = UICommon.createViewList(target,self.isMovable)
	end	
	self.viewtable = UICommon.initTableTabMenu(target,"h",2,70,handler(self,self.onClick),handler(self,self.createViewNode),true)
    viewtable:setTlUnitData(self.tlData)
end
function M:createViewNode( params )
	
	return GameCell.new(params)
end
function M:onClick( node,cmdX )
	self.callback_(cmdX)
end
function M:setViewCallback( target,callback )
	self.callback_ = callback
	self.callback_(self.tlData[self.defaultIndex],self.defaultIndex)
end
function M:bindFunc( target )
	target:bindMethod(self,"updateView")
	target:bindMethod(self,"initView")
	target:bindOnceMethod(self,"setViewCallback")
end
return M