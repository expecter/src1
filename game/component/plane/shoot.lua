--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( params)
	self.time_ = 0
	self.lastSecond_ = 0
	self:setData(params)
end
function M:setData(params )
end
function M:initView( target )
end
function M:update( dt )
	self.time_ = self.time_ + dt
	local secondsDelta =  self.time_ - self.lastSecond_
	if secondsDelta>=1 then
		self.lastSecond_ = self.lastSecond_ + secondsDelta
		self:secondsCall(self.lastSecond_)
	end
end
function M:secondsCall( time )
	local map = self.target:getGameNode("map")
	local config = {
		_type = "GameNode",
		_name = "bullet",
		_component = {
			{
				_type = "cc_node",
				contentsize = {width = 60,height = 60},
				pos = {x =578,y = 50},
				AnchPos = {x = 0,y = 0},
			},
			{
				_type = "cc_sprite",
				spriteFrameName = "bullet1",
				isEnough = true,
			},
			{
				_type = "plane_move",dir = "down",
			},
		},
	}
	local node = GameSceneMgr.createGameNode(config)
	map:addChild(node)
	map:addObject(node)
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