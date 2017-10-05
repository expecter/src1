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
	self.tlCacheName = params.tlCacheName --同时监听多个
	-- self.bindComponent = params.bindComponent
end

function M:bindOne(  )
	
end
--绑定参数为component
function M:bind( target,cacheName )
		GameCacheMgr.getGameCacheByName(cacheName):bind(target,{
			onAdd = function ( cmdX )
				-- if self.target.onAdd then
				-- 	self.target:onAdd(cmdX)
				-- end		
				local components = self.target:getAllComponent()
				for i,com in ipairs(components) do
					if com.onAdd then
						com:onAdd()
					end
					
				end			
			end,
			onUpdate = function ( cmdX )
				-- if self.target.onUpdate then
				-- 	self.target:onUpdate(cmdX)
				-- end
				local components = self.target:getAllComponent()
				for i,com in ipairs(components) do
					if com.onUpdate then
						com:onUpdate()
					end
				end					
			end,
			onDelete = function ( cmdX )					
			-- if self.target.onDelete then
			-- 		self.target:onDelete(cmdX)
			-- 	end
			-- end
				local components = self.target:getAllComponent()
				for i,com in ipairs(components) do
					if com.onDelete then
						com:onDelete()
					end
				end
			end
		})
end

function M:unbind( target,cacheName )
	GameCacheMgr.getGameCacheByName(cacheName):unbind(target)
end

function M:enterView(  )
	for _,cache in ipairs(self.tlCacheName) do		
		-- for i,v in ipairs(cache) do
		-- 	self.target:bind(v.name)
		-- end
		self.target:bind(cache)
	end
end

function M:exitView(  )
	for _,cache in ipairs(self.tlCacheName) do		
		-- for i,v in ipairs(cache) do
		-- 	self.target:unbind(v.name)
		-- end
		self.target:bind(cache)
	end
end

function M:bindFunc( target )
	target:bindOnceMethod(self,"bind")
	target:bindOnceMethod(self,"unbind")
end

return M