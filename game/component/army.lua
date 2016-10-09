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
	self:setData(params)
end
function M:setData(params )
end
function M:initView( target )
	self.target:setContentSize(self.contentSize)
	self.target:setAnchorPoint(self.anchPos)
	self.target:setPosition(self.pos)
end
function M:playStandbAnimate(  )
	
end
function M:playRunAnimate(  )
	
end
function M:playAttAnimate(  )
	
end
function M:playHitAnimate(  )
	
end
function M:updateView( target )
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