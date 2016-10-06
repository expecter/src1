--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("planeComponent")
function M:ctor( target ,params)
	self.target = target
	self.velotiy = 10
	self:setData(params)
end
function M:setData(params )
end
function M:initView( target )
	local hero = target:getGameNode("hero")
	hero:setPosition(display.cx,100)
	local map = target:getGameNode("map")
	local pos = cc.p(map:getPosition())
	local size =map:getContentSize()
	local mapRect = cc.rect(pos.x,pos.y,size.width,size.height)
	local Joytick = target:getGameNode("Joytick")
	Joytick:setCbJoytick(function ( vec )
		local heroPos = cc.p(hero:getPosition())
		hero:setPosition(heroPos.x+vec.x*self.velotiy,heroPos.y+vec.y*self.velotiy)
		if cc.rectContainsPoint(mapRect,heroPos) then
			--todo
		end
	end)
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