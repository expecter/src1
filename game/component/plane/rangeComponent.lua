--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( target ,params)
	self.width = 300
	self:setData(params)
end
function M:setData(params )
end
function M:initView( target )
	local map = self.target:getGameNode("map")
	local config = {
		_type = "GameNode",
		_component = {
			{
				_type = "cc_node",
				contentsize = {width = 600,height = 600},
				pos = {x =-300,y = -300},
				AnchPos = {x = 0,y = 0},
			},
			{
				_type = "cc_DrawComponent",
			},
			{_type = "plane_inrange"}
		},
	}
	local node = GameSceneMgr.createGameNode(config)
	node:addObserver(self,"inRange",function ( other )
		print(other:getName(),"in range of",target:getName())
	end)
	target:addChild(node)
	map:addObject(node)
end
function M:update( dt )
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