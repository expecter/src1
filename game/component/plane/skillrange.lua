--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( params)
	self.width = 300
	self:setData(params)
end
function M:setData(params )
end
function M:initView( target )
	local map = self.target:getGameNode("map")
	local config = {
		_type = "GameNode",
		_name = "range",
		_component = {
			{
				_type = "cc_node",
				contentsize = {width = 600,height = 600},
				pos = {x =-300,y = -300},
				AnchPos = {x = 0,y = 0},
			},
			{
				_type = "cc_DrawComponent",
			}
		},
	}
	local node = GameSceneMgr.createGameNode(config)
	target:addChild(node)
	map:addObject(node)
	-- map:addObserver(self,"EVENT_COLLISION_BEGAN",function ( data )
	-- 	print(data.objA:getName(),"start collision",data.objB:getName())
	-- end)
	-- map:addObserver(self,"EVENT_COLLISION_ENDED",function ( data )
	-- 	print(data.objA:getName(),"ended collision",data.objB:getName())
	-- end)
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