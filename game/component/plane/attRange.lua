--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( params)
	self.width = 300
	self.tlObject = {}
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
				pos = {x =200,y = 100},
				AnchPos = {x = 0,y = 0},
			},
			{
				_type = "cc_DrawComponent",
			}
		},
	}
	local node = GameSceneMgr.createGameNode(config)
	map:addChild(node)
	map:addObject(node)
	map:addObserver(self,"EVENT_COLLISION_BEGAN",function ( data )
		if "range" == data.objA:getName() and self.target:getName() ~= data.objB:getName() then
			self.tlObject[data.objB] = data.objB
		end
	end)
	map:addObserver(self,"EVENT_COLLISION_ENDED",function ( data )
		if "range" == data.objA:getName() and self.target:getName() ~= data.objB:getName() then
			self.tlObject[data.objB] = nil
		end
	end)
end
function M:update( dt )
	for k,obj in pairs(self.tlObject) do
		local posA = cc.p(self.target:getPosition())
		local posB = cc.p(obj:getPosition())
		local vec = cc.pNormalize(cc.p(posA.x-posB.x,posA.y-posB.y))
		local radians = math.atan2(vec.y,vec.x)
		local rotate=-1 * radians*57.29577951-90
		self.target:rotation(rotate)
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