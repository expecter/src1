--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( target ,params)
	self.target = target
	self.contentSize = params.contentsize or cc.size(0,0)
	self.anchPos = params.AnchPos or cc.p(0,0)
	self.pos = params.pos or cc.p(0,0)
	self.visible = params.visible~=false
	self.scale = params.scale or 1
	self:setData(params)
end
function M:setData(params )
end
function M:initView(  )
	self.target:setContentSize(self.contentSize)
	self.target:setAnchorPoint(self.anchPos)
	self.target:setPosition(self.pos)
	self.target:setScale(self.scale)
	self.target:setVisible(self.visible)
end
function M:updateView(  )
end
--对应onenter
function M:enterView(  )
	
end
--对应onexit
function M:exitView(  )
	
end
--对应release
function M:releaseView(  )
	
end
function M:bindFunc( target )
end
return M