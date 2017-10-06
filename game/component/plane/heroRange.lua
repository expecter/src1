--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("plane_planeComponent")
function M:ctor( params)
	self.velotiy = 10
	self:setData(params)
end
function M:setData(params )
end
function M:initView( target )
	local map = self.target:getGameNode("map")
	map:addObserver(self,"EVENT_COLLISION_BEGAN",function ( data )
		if data.objA:getName() == "bullet" and  data.objB:getName() == "hero1" then
			print("bullet hit hero1")
		end
	end)
	local label = self.target:getGameNode("planeLabel")
	map:addObserver(self,"trigger",function ( data )
		if data.objA:getName() == "hero1" and  data.objB:getName() == "range" then
			label:setText("in Range "..data.objA:getName())
		end
		
	end)
end
function M:updateView( target )
end
--对应onenter
function M:enterView( target )

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