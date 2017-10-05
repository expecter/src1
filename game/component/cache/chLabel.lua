--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("cache_chLabel")
function M:ctor( target ,params)
	self.target = target
	-- self.object = params.object
	self.tlCacheName = params.tlCacheName or {}
	self.key = params.key
	self.field = params.field
	-- self:setData(params)
end
function M:getDepends(  )
	return {
		{
			_type = "cc_label",
		},
		{
			_type = "cache_bind",
			tlCacheName = self.tlCacheName,
		},			
	}
end
function M:setData(params )
end

function M:updateView( )
	local cache = GameCacheMgr.getGameCacheByName(self.cacheName):get(self.key)
	self.target:setText(cache[self.field])
end
function M:onUpdate( cmdX )
	self:updateView()
end
--对应onenter
function M:enterView(  )
	self.target:bind(self,self.cacheName)
end
--对应onexit
function M:exitView(  )
	self.target:unbind(self)
end
--对应release
function M:releaseView(  )
	
end
function M:bindFunc( target )
end
return M