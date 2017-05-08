--
-- Author: Your Name
-- Date: 2016-05-24 23:40:37
--
local M = class(...,require("game.gameCaches.GameCache"))
local dataModel = {
	id = 0,
	heroId = 0,
	level = 1,
	exp = 2,
}
function M:ctor(  )
	local params = {
		cacheName = "ObjHero",
		isRepeat = true,
		dataModel = dataModel,
	}
	M.super.ctor(self,params)
	
end
function M:init( cmdX )
	-- if not cmdX then
	-- 	self.cache = ref.getRef({refName = "refarmy"})
	-- 	self:updateByProto(self.cache)
	-- end
	-- self.cache = cmdX
	self.cache = ref.getRef({refName = "refarmy"})
	self:updateByProto(self.cache)
end
function M:cleanup(  )
	self.cache = {}
end
--请求命令
function M:updateNum( params )
	local data = params
	
	self:updateByProto(self.cache)
end
function M:deleteOne( params )
	self:updateByProto(self.cache)
end
return M