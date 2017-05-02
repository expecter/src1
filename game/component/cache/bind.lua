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
	-- self.cacheName = params.cacheName or ""
	-- self.tlCacheName = params.tlCacheName --同时监听多个
	-- self.tlCaches = params.caches
end

function M:bindOne(  )
	
end
--绑定参数为component
function M:bindCaches( target,cacheName,component )
	GameObj[cacheName].bind(component,{
		onAdd = function ( cmdX )
			if component.onAdd then
				component:onAdd(cmdX)
			end					
		end,
		onUpdate = function ( cmdX )
			if component.onUpdate then
				component:onUpdate(cmdX)
			end					
		end,
		onDelete = function ( cmdX )					
		if component.onDelete then
				component:onDelete(cmdX)
			end
		end
	})
end

function M:enterView( target )
	-- self.target:bind(self,"ObjArmy")
	-- for i,cache in ipairs(self.tlCaches) do
	-- 	self:bind(cache.cacheName,cache.tlComponent)
	-- end
end

function M:bindFunc( target )
	target:bindOnceMethod(self,"bindCaches")
end
return M