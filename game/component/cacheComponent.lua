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
	self.caches = params.caches
end
function M:initView(  )	
end

function M:updateView(  )
end
--对应onenter
function M:enterView(  )
	for i,cache in ipairs(self.caches) do
		local gameCache = GameCacheMgr.getGameCacheByName(cache.name)
		local node = nil
		if cache.component then
			node = self.target:getComponent(cache.component)
		else
			node = cache.node
		end
		-- if onceCache then
		-- 	local cmdCache = gameCache:get()
		-- 	gameCache:bindOne(self.target,cmdCache,function ( cmdX )
		-- 		if node.onUpdate then
		-- 			node:onUpdate(cmdX)
		-- 		end
		-- 	end)
		-- else
			gameCache:bind(self.target,{
				onAdd = function ( cmdX )
					if node.onAdd then
						node:onAdd(cmdX)
					end					
				end,
				onUpdate = function ( cmdX )
					if node.onUpdate then
						node:onUpdate(cmdX)
					end					
				end,
				onDelete = function ( cmdX )					
				if node.onDelete then
						node:onDelete(cmdX)
					end
				end
				})
		-- end		
	end
end
--对应onexit
function M:exitView(  )
	for i,cache in ipairs(self.caches) do
		local gameCache = GameCacheMgr.getGameCacheByName(cache.name)
		local node = nil
		if cache.component then
			node = self.target:getComponent(cache.component)
		else
			node = cache.node
		end
		if onceCache then
			local cmdCache = gameCache:get()
			gameCache:unbindOne(self.target)
		else
			gameCache:unbind(self.target)
		end		
	end
end
--对应release
function M:releaseView(  )
	
end
function M:bindFunc( target )
end
return M