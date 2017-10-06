--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( params)
	self:setData(params)
	self.health = 100
end
function M:setData(params )
end
function M:initView( target )
	local ccForeNode = display.newSprite("img_public_delete_redLine.png")
	local ccProgressTimer = cc.ProgressTimer:create(ccForeNode)
    ccProgressTimer:setType(cc.PROGRESS_TIMER_TYPE_BAR)
    ccProgressTimer:setMidpoint(cc.p(0,0))

    ccProgressTimer:setBarChangeRate(cc.p(1,0))
    ccProgressTimer:setPercentage(0)
    ccProgressTimer:setAnchorPoint(cc.p(0,0))
    self.target:getContentSize()
    ccProgressTimer:setPosition(cc.p(0,self.target:getContentSize().height))
    self.target:addChild(ccProgressTimer)
    ccProgressTimer:setPercentage(self.health)
    self.ccProgressTimer = ccProgressTimer
end
function M:hurt( target )
	self.health = self.health-10
	self.ccProgressTimer:setPercentage(self.health)
end
function M:updateView( target )
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"hurt")
end
return M