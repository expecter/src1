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
	local hero = target:getGameNode("hero")
	hero:setPosition(display.cx,100)
	local map = target:getGameNode("map")
	local pos = cc.p(map:getPosition())
	local size =map:getContentSize()
	local mapRect = cc.rect(pos.x,pos.y,size.width,size.height)
	target:getGameNode("Joytick"):addObserver(self,"joytickScheduler",function ( vec )
		local heroPos = cc.p(hero:getPosition())
		hero:setPosition(heroPos.x+vec.x*self.velotiy,heroPos.y+vec.y*self.velotiy)
		if cc.rectContainsPoint(mapRect,heroPos) then
			--todo
		end
	end)
	-- local panel =GameSceneMgr.createGameNode(require("game.config.gamePanel")):showPanel()
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