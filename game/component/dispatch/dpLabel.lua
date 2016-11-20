--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("cache_chLabel")
function M:ctor( target ,params)
	self.target = target
	self.object = params.object
	self.cacheName = ""
	self:setData(params)
end
function M:getDepends(  )
	return {
		{
			_type = "cc_label",
		},
		{
			_type = "dispatch_listener",
		},			
	}
end
function M:setData(params )
end
function M:initView( target )
end
function M:updateView( )
	self.target:setText(self:getCacheText())
end
function M:onUpdate( cmdX )
	self.target:setText(self:getCacheText())
end
--对应onenter
function M:enterView(  )
	-- self.target:setText(self:getCacheText())
	self.target:bind("switch",function ( cmdX )
		self.target:setText(cmdX.data)
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