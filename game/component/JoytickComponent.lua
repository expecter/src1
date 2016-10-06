--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("JoytickComponent")

function M:ctor( target ,params)
	self.target = target
	self.vec = cc.p(0,0)
end
function M:getDepends(  )
	return {
		{
			_type = "cc_ClickComponent",
		},
		{
			_type = "cc_ScheduleComponent",
		},
	}
end
function M:initView( target )
	local sprite = target:getSprite()
	self.ditectSpr = display.newSprite("Direction_bt.png")
	self.ditectSpr:setPosition(target:getCenterPosition())
	target:addChild(self.ditectSpr)
	target:setTouchEvent(handler(self,self.touch))
	target:setVisible(false)
end
function M:touch( event,x,y )
	if event == "began" then
		local pos = cc.p(x,y)
		self.startPos = clone(pos)
		pos.x = pos.x-self.target:getContentSize().width/2
		pos.y = pos.y-self.target:getContentSize().height/2
		self.target:setPosition(pos)
		self:startJoytick()
	elseif event =="moved" then
		local pos = cc.p(0,0)
		pos.x = x-self.startPos.x+self.target:getContentSize().width/2
		-- if pos.x>self.target:getContentSize().width then
		-- 	pos.x=self.target:getContentSize().width
		-- end
		-- if pos.x<0 then
		-- 	pos.x=0
		-- end
		pos.y = y-self.startPos.y+self.target:getContentSize().height/2
		local centerPos = cc.p(self.target:getContentSize().width/2,self.target:getContentSize().height/2)
		local distance = cc.pGetDistance(pos,centerPos)
		local radius = self.target:getContentSize().width/2
		if radius<distance then
			local x = x-self.startPos.x
			local y = y-self.startPos.y
			local tempPos = cc.pNormalize(cc.p(x,y))
			pos = cc.p(tempPos.x*radius+self.target:getContentSize().width/2,tempPos.y*radius+self.target:getContentSize().height/2)
		end
		self.vec = cc.pNormalize(cc.p(pos.x-self.target:getContentSize().width/2,pos.y-self.target:getContentSize().height/2))
		self.ditectSpr:setPosition(pos)
		-- if pos.y>self.target:getContentSize().height then
		-- 	pos.y=self.target:getContentSize().height
		-- end
		-- if pos.y<0 then
		-- 	pos.y=0
		-- end

		
	elseif event == "ended" then
		self:endJoytick()
	end
end
function M:startJoytick(  )
	self.target:setVisible(true)
	self.ditectSpr:setPosition(self.target:getCenterPosition())
	self.vec = cc.p(0,0)
	self.target:startScheduler(handler(self,self.cbScheduler))
end
function M:cbScheduler( dt )
	if self.callback then
		self.callback(self.vec)
	end
end
function M:endJoytick(  )
	self.target:setVisible(false)
	self.target:endScheduler()
end
function M:updateView( target )

end
function M:setCbJoytick( target,callback )
	self.callback = callback
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"startJoytick")
	target:bindOnceMethod(self,"endJoytick")
	target:bindOnceMethod(self,"setCbJoytick")
end
return M