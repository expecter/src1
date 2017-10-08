--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class(...,componentBase)
function M:ctor(params)
	M.super.ctor(self,params)
	self.contentSize = params.contentsize or cc.size(0,0)
	self.anchPos = params.AnchPos or cc.p(0,0)
	self.pos = params.pos or cc.p(0,0)
	self.visible = params.visible~=false
	self.scale = params.scale or 1
	self:setData(params)
end
function M:setData(params )
end
function M:initView( parent )
	local node = display.newNode()
	node:setContentSize(self.contentSize)
	node:setAnchorPoint(self.anchPos)
	node:setPosition(self.pos)
	node:setScale(self.scale)
	node:setVisible(self.visible)
	parent:addChild(node)
	self.target:setView(node)
end
-- function M:updateView(  )
-- end
--对应onenter
function M:getView(  )
	return self.node
end
--对应onexit
-- function M:exitView(  )
	
-- end
-- --对应release
-- function M:releaseView(  )
	
-- end
function M:bindFunc( target )
	-- target:bindOnceMethod(self,"getView")
end
return M