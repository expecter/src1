--
-- Author: Your Name
-- Date: 2016-05-24 23:40:37
--
local M = class(...,require("game.gameCaches.GameCache"))
local ModelData = {
	playerId = 0,
	name = "jean",
	level = 1,
	health = 100,
	gold = 0,
	energyTime = 0,--体力恢复倒计时
}
function M:ctor(  )
	local params = {
		cacheName = "CmdPlayer"
	}
	M.super.ctor(self,params)
	
end
function M:firstInit( cmdX )
	if not cmdX then
		self.cache = ref.getRef({refName = "userinit",Once = true})
		self:updateByProto(self.cache)
	end
	self.cache = cmdX
end
function M:cleanup(  )
	self.cache = {}
end
--请求命令
function M:updateNum( params )
	local data = params
	--TODO
	local num = self.caches.num
	self:updateByProto(self.cache)
end

function M:levelup(  )
	self:updateByProto(self.cache)
end

return M