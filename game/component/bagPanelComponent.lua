--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( target ,params)
	self.target = target
	self:setData(params)
end
function M:setData(params )
end
function M:initView( target )
end
function M:updateView( target )
end
--对应onenter
function M:enterView(  )
	local switchMenu = GameSceneMgr.getGameNode("switchMenu")
	local switchNode = GameSceneMgr.getGameNode("switchNode")
	switchMenu:setViewCallback(function ( params,index )
		switchNode:switchTo(index)
	end)
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