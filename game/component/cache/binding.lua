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
	-- self.componentType = params.componentType
	self.caches = params.caches
end

function M:bindOne(  )
	
end
--可添加缓存的要提供onAdd，onUpdate，onDelete接口
function M:bind( cacheName,tlComponent )
	local caches = GameCacheMgr.getGameCacheByName(cacheName)	
	for i,componentName in ipairs(tlComponent) do
		local component = target:getComponentByName(componentName)
		caches:bind(component,{
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
end

function M:onEnter(  )	
	for _,cache in ipairs(self.caches) do		
		for i,v in ipairs(cache) do
			self:bind(v.name,v.component)
		end
	end
end

function M:onExit(  )
	local caches = GameCacheMgr.getGameCacheByName(self.cacheName)
	-- self:unbind()
end

return M