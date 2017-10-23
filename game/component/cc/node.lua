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
	self._ccNode = params._ccNode
end
function M:setData(params )
end
function M:initView( parent )
	if not self._ccNode then
		self._ccNode = display.newNode()
		if parent then
			parent:addChild(self._ccNode)
		end		
	end
end

function M:updateView(  )
	local node = self:getView()
	node:setContentSize(self.contentSize)
	node:setAnchorPoint(self.anchPos)
	node:setPosition(self.pos)
	node:setScale(self.scale)
	node:setVisible(self.visible)
end

function M:setContentSize( target,contentSize )
	if contentSize then
		--todo
	end
	self:getView():setContentSize(self.contentSize)
end

function M:setAnchorPoint( target,anchPos )
	self:getView():setAnchorPoint(self.anchPos)
end

function M:setPosition( target,pos )
	self:getView():setPosition(self.pos)
end

function M:setScale( target,scale )
	if scale then
		--todo
	end
	self:getView():setScale(self.scale)
end

function M:setVisible( target,visible )
	if visible == self.visible then	return end
	self.visible = visible
	self:getView():setVisible(self.visible)
end

function M:getView(  )
	return self._ccNode
end

function M:bindFunc( target )
	target:bindMethod(self,"getView")
	target:bindOnceMethod(self,"setContentSize")
	target:bindOnceMethod(self,"setAnchorPoint")
	target:bindOnceMethod(self,"setPosition")
	target:bindOnceMethod(self,"setScale")
	target:bindOnceMethod(self,"setVisible")
end
return M