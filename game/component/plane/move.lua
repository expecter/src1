--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( target ,params)
	self.target = target
	self.dir = params.dir or "left"  --指示从哪边开始
	self.vec = params.vec or 5
	self:setData(params)
end
function M:setData(params )
end
function M:update( dt )
	local orgPos = cc.p(self.target:getPosition())
	
	if self.dir == "left" then
		self.target:setPosition(orgPos.x+self.vec,orgPos.y)
	elseif self.dir == "right" then
		self.target:setPosition(orgPos.x-self.vec,orgPos.y)
	elseif self.dir == "up" then
		self.target:setPosition(orgPos.x,orgPos.y-self.vec)
	elseif self.dir == "down" then
		self.target:setPosition(orgPos.x,orgPos.y+self.vec)
	end
end
-- function M:onTrigger( target,other )
-- 	if other:getName() == "hero1" then
-- 		-- print("attack hero1")
-- 		-- target:removeFromParent()
-- 		other:hurt()
-- 		GameSceneMgr.removeObject(target)
-- 		target = nil
-- 	end
-- end
function M:updateView( target )
end
--对应onenter
function M:enterView(  )
	
end
--对应onexit
function M:exitView(  )
	self.target:endScheduler()
end
--对应release
function M:releaseView(  )
	
end
function M:bindFunc( target )
	-- target:bindOnceMethod(self,"onTrigger")
end
return M