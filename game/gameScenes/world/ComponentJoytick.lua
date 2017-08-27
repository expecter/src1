--
-- Author: Your Name
-- Date: 2017-08-27 12:07:13
--
local M = class(...,function (  )
	return display.newNode()
end)
local scheduler = require('framework.scheduler')
function M:ctor(  )
	self:initView()
end

function M:initView(  )
	self:setContentSize(cc.size(120,120))
	self.touchlayer = display.newLayer() 
    self.touchlayer:addTouchEventListener( handler(self,self.onTouch), false, false)
    self.touchlayer:setTouchEnabled(true)
    self.touchlayer:setVisible(false)
    self:addChild(self.touchlayer)
   	local bg = display.newSprite("Direction_bc.png")
   	bg:setPosition(self:getCenterPosition())
   	self:addChild(bg)
	self.ditectSpr = display.newSprite("Direction_bt.png")
	
	self.ditectSpr:setPosition(self:getCenterPosition())
	self:addChild(self.ditectSpr)
	self:setVisible(false)
	self.scheduler = scheduler.scheduleUpdateGlobal(function ( dt )		
		if self == nil or tolua.isnull(self) then
			scheduler.unscheduleGlobal(self.scheduler)
			return
		end
		if not self:isVisible() then
			return
		end
		if self.callback then
			self.callback(self.vec)
		end		
	end)
end

function M:MovedCallBack( callback )
	self.callback = callback
end

function M:onTouch( event,x,y )
	if event == "began" then
		local pos = cc.p(x,y)
		self.startPos = clone(pos)
		pos.x = pos.x-self:getContentSize().width/2
		pos.y = pos.y-self:getContentSize().height/2
		self:setPosition(pos)
		self:startJoytick()
	elseif event =="moved" then
		local pos = cc.p(0,0)
		pos.x = x-self.startPos.x+self:getContentSize().width/2
		-- if pos.x>self.target:getContentSize().width then
		-- 	pos.x=self.target:getContentSize().width
		-- endWW
		-- if pos.x<0 then
		-- 	pos.x=0
		-- end
		pos.y = y-self.startPos.y+self:getContentSize().height/2
		local centerPos = cc.p(self:getContentSize().width/2,self:getContentSize().height/2)
		local distance = cc.pGetDistance(pos,centerPos)
		local radius = self:getContentSize().width/2
		if radius<distance then
			local x = x-self.startPos.x
			local y = y-self.startPos.y
			local tempPos = cc.pNormalize(cc.p(x,y))
			pos = cc.p(tempPos.x*radius+self:getContentSize().width/2,tempPos.y*radius+self:getContentSize().height/2)
		end
		self.vec = cc.pNormalize(cc.p(pos.x-self:getContentSize().width/2,pos.y-self:getContentSize().height/2))
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
	return true
end
function M:startJoytick(  )
	self:setVisible(true)
	self.ditectSpr:setPosition(self:getCenterPosition())
	self.vec = cc.p(0,0)
	-- self:startScheduler(handler(self,self.cbScheduler))
end
function M:endJoytick(  )
	self:setVisible(false)
	-- self:endScheduler()
end
return M
