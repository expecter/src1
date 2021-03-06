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
	self._node = params._ccNode
	self:setData(params)
end
function M:setData(params )
end
function M:initView( parent )
	if not self._node then
		self._node = display.newNode()
		if parent then
			parent:addChild(self._node)
		end		
	end
	local node = self._node
	node:setContentSize(self.contentSize)
	node:setAnchorPoint(self.anchPos)
	node:setPosition(self.pos)
	node:setScale(self.scale)
	node:setVisible(self.visible)
end

function M:getView(  )
	return self._node
end

function M:updateView(  )
end
function M:getView(  )
	return self._node
end
function M:bindFunc( target )
	target:bindMethod(self,"getView")
end
return M