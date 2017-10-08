--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( target ,params)
	-- self:setData(params)
end
function M:setTarget( target )
	self.target = target
end
-- function M:setData(params )
-- end
function M:getDepends(  )
	return {}
end
function M:setObject( object )
	self.object = object
end

function M:getObject(  )
	return ComponentUtil.getData(self.object)
end

function M:initView(  )
end

function M:updateView(  )
	
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