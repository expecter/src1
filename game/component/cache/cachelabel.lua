--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( target ,params)
	self.target = target
	self.object = params.object
	self.time = 1
	self:setData(params)
end
function M:getDepends(  )
	return {
		{
			_type = "cacheComponent",
			caches = {
				{
					component = "cache_cachelabel",
				},
			},
		},
		{
			_type = "cc_label",
		},	
	}
end
function M:setData(params )
end
function M:getCacheText( )
	if not self.object then return nil end
	return GameObj.ObjArmy.getCacheData()[self.object.key][self.object.field]
end
function M:initView( target )
end
function M:updateView( )
	-- self.label:setString(self:getCacheText())
end
function M:onUpdate( cmdX )
	self.target:setText(self:getCacheText())
end
--对应onenter
function M:enterView(  )
	self.target:setText(self:getCacheText())
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