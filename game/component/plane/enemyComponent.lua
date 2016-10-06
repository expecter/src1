--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("enemyComponent")
function M:ctor( target ,params)
	self.target = target
	self.relayTime = 10
	self.time_ = 0
	self.lastSecond_ = 0
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
	target:startScheduler(function ( dt )
		self.time_ = self.time_ + dt
		local secondsDelta =  self.time_ - self.lastSecond_
		if secondsDelta>=1 then
			self.lastSecond_ = self.lastSecond_ + secondsDelta
			self:secondsCall(self.lastSecond_)
		end
	end)
end
function M:secondsCall( time )
	if time>= self.relayTime then
		self.relayTime = self.relayTime+10
		local map = self.target:getGameNode("map")
		local config = {
			_type = "GameNode",
			_component = {
				{
					_type = "cc_node",
					contentsize = {width = 60,height = 60},
					pos = {x =360,y = 360},
					AnchPos = {x = 0,y = 0},
				},
				{
					_type = "cc_sprite",
					spriteFrameName = "enemy1_down1",
					isEnough = true,
				},
			},
		}
		local panel = GameSceneMgr.createGameNode(config)
	end
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