--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("rollComponent")
function M:ctor( target ,params)
	self.target = target
	self.bgHeight = 450
	self:setData(params)
end
function M:getDepends(  )
	return {
		{_type = "cc_ScheduleComponent",}
	}
end
function M:setData(params )
end
function M:initView( target )
	self.sprite1 = display.newSprite("#background.png")
	self.sprite1:setPosition(cc.p(240,0))
	target:addChild(self.sprite1)
	self.sprite2 = display.newSprite("#background.png")
	self.sprite2:setPosition(cc.p(240,self.bgHeight-1))
	target:addChild(self.sprite2)
	self.target:startScheduler(handler(self,self.scrollBg))
end
function M:scrollBg(  )
	self.bgHeight = self.bgHeight-1
	if self.bgHeight<=0 then
		self.bgHeight = 450
	end
	self.sprite1:setPosition(cc.p(240,self.bgHeight-450))
	self.sprite2:setPosition(cc.p(240,self.bgHeight-1))
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