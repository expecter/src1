--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class(...,componentBase)
function M:ctor( params)
	M.super.ctor(self,params)
	self.spriteName = params.spriteName
	-- self.contentSize = params.contentsize or cc.size(0,0)
end
function M:setData(params )
end
function M:initView( parent )
	local sp = display.newScale9Sprite(string.format("%s.png",self.spriteName))
	sp:setAnchorPoint(cc.p(0,0))
	-- sp:setPosition(cc.p(self.width/2, self.height/2))
	sp:setContentSize(parent:getContentSize())
	parent:addChild(sp)
	self.target:setView(sp)
end
-- function M:updateView( target )
	
-- end
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