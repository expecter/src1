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
	hero:setPosition(display.cx,display.cy)
	local map = target:getGameNode("map")
	local Joytick = target:getGameNode("Joytick")
	Joytick:setCbJoytick(function ( vec )
		-- if vec.x ==0 and vec.y == 0 then
	 --    	hero:setRotation(0)
	 --    	return
	 --    end
		-- local radians = math.atan2(0-vec.y,0-vec.x)
	 --    local rotate=-1 * radians*57.29577951-90
	 --    hero:setRotation(rotate)
	    -- local heroPos = cc.p(hero:getPosition())
	    -- local heroSize = hero:getContentSize()
	    -- local centerRect = cc.rect(display.cx-heroSize.width/2,display.cy-heroSize.height/2,heroSize.width,heroSize.height)
	    -- if not cc.rectContainsPoint(centerRect,heroPos) then
	    -- 	hero:setPosition(heroPos.x+vec.x*self.velotiy,heroPos.y+vec.y*self.velotiy)
	    -- 	return
	    -- end
	    -- if heroPos<0 then
	    -- 	--todo
	    -- end
	    -- map:movebyPoints(vec.x*self.velotiy,vec.y*self.velotiy)
	    -- local pos = map:getContentOffset()
	    -- local viewNodeSize = map:getViewNode():getContentSize()
	    -- if pos.x>=0 or -pos.x>=viewNodeSize.width-display.width then
	    -- 	local orgX = hero:getPositionX()
	    -- 	hero:setPositionX(orgX+vec.x*self.velotiy)
	    -- 	if hero:getPositionX()<=0 then
	    -- 		hero:setPositionX(0)
	    -- 	end
	    -- 	if hero:getPositionX()>=display.width  then
	    -- 		hero:setPositionX(display.width)
	    -- 	end
	    -- end
	    -- if pos.y>=0 or -pos.y>=viewNodeSize.height-display.height then
	    -- 	local orgY = hero:getPositionY()
	    -- 	hero:setPositionY(orgY+vec.y*self.velotiy)
	    -- 	if hero:getPositionY()<=0 then
	    -- 		hero:setPositionY(0)
	    -- 	end
	    -- 	if hero:getPositionY()>=display.height  then
	    -- 		hero:setPositionY(display.height)
	    -- 	end
	    -- end
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