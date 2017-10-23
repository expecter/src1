--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class(...,componentBase)
function M:ctor(params)
	M.super.ctor(self,params)
	self:setData(params)
end
function M:setData(params )
	-- self.cacheName = params.cacheName or ""
	self.tlCacheName = params.tlCacheName or {} --同时监听多个
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
				-- local components = self.target:getAllComponent()
				-- for i,com in ipairs(components) do
				-- 	if com.onAdd then
				-- 		com:onAdd(cmdX)
				-- 	end					
				-- end
				self.target:updateView()			
			end,
			onUpdate = function ( cmdX )
				-- if self.target.onUpdate then
				-- 	self.target:onUpdate(cmdX)
				-- end
				-- local components = self.target:getAllComponent()
				-- for i,com in ipairs(components) do
				-- 	if com.onUpdate then
				-- 		com:onUpdate(cmdX)
				-- 	end
				-- end
				self.target:updateView()					
			end,
			onDelete = function ( cmdX )					
			-- if self.target.onDelete then
			-- 		self.target:onDelete(cmdX)
			-- 	end
			-- end
				-- local components = self.target:getAllComponent()
				-- for i,com in ipairs(components) do
				-- 	if com.onDelete then
				-- 		com:onDelete(cmdX)
				-- 	end
				-- end
				self.target:updateView()
			end
		})
end

function M:unbind( target,cacheName )
	GameCacheMgr.getGameCacheByName(cacheName):unbind(target)
end

function M:enterView(  )
	for _,cacheName in ipairs(self.tlCacheName) do
		self.target:bind(cacheName)
	end
end

function M:exitView(  )
	for _,cacheName in ipairs(self.tlCacheName) do
		self.target:unbind(cacheName)
	end
end

function M:bindFunc( target )
	target:bindOnceMethod(self,"bind")
	target:bindOnceMethod(self,"unbind")
end

return M