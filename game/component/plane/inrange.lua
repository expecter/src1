--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( params)
	self:setData(params)
end
function M:setData(params )
end
function M:initView( target )
end
function M:onTrigger( target,other )
	-- if other:getName() == "hero1" then
		self.target:dispatch("inRange",other)
	-- end
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
	target:bindOnceMethod(self,"onTrigger")
end
return M