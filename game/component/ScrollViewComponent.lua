--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("eventComponent")
function M:ctor( target ,params)
	self.target = target
	self:setData(params)
end
function M:setData(params )
	self.tlData = params.tlData
	self.childNode = nil
end
-- function M:cellMode( cmdX )
	
-- end
--exportFunc
function M:initView( target )
	-- self.viewlist = UICommon.createViewList(target,self.isMovable)	
end
function M:updateView( target )
	if not self.viewlist and self.childNode then
		self.ccScrollView = cc.ScrollView:create(target:getContentSize(),self.childNode)	
		self.ccScrollView:setAnchorPoint(cc.p(0.5, 0.5))
	    self.ccScrollView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	    target:addChild(self.ccScrollView)
	end	
end
function M:setViewCallback( target,callback )
	self.callback_ = callback
end
function M:bindFunc( target )
	target:bindMethod(self,"updateView")
	target:bindMethod(self,"initView")
	target:bindOnceMethod(self,"setViewCallback")
end
return M