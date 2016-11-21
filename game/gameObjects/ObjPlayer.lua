--
-- Author: Your Name
-- Date: 2016-05-24 23:40:37
--
local M = class(...,require("game.gameObjects.ObjBase"))
local dataModel = {
	playerId = 0,
	level = 1,
	health = 2,
	food = 3,
}
function M:ctor(  )
	local params = {
		cacheName = "ObjPlayer"
	}
	M.super.ctor(self,params)
	
end
function M:init( cmdX )
	if not cmdX then
		self.cache = ref.getRef({refName = "refarmy"})
		self:initCmdX(self.cache)
	end
	self.cache = cmdX
end
function M:cleanup(  )
	self.cache = {}
end
--请求命令
function M:updateNum( params )
	local data = params
	
	self:updateByProto()
end
return M