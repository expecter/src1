--
-- Author: Your Name
-- Date: 2016-05-24 23:40:37
--
local M = class(...,require("gameCaches.GameCache"))
local dataModel = {
	id = 0,
	heroId = 0,
	level = 1,
	exp = 2,
	li = 1,
	zhi = 1,
	su = 1,
	refId = 0,
}
function M:ctor(  )
	local params = {
		cacheName = "CmdHero",
		isRepeat = true,
		dataModel = dataModel,
	}
	M.super.ctor(self,params)
	
end
--首次初始化
function M:firstInit( cmdX )
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
function M:test( params )
	local data = params
	
	self:updateByProto(self.cache)
end
function M:deleteOne( params )
	self:updateByProto(self.cache)
end
--创建新的英雄
function M:newHero(  )
	local data = dataModel
	self:updateByProto(data)
end
--武将升级
--optional
function M:levelup(  )
	
end
--分解
function M:breakout(  )
	
end
return M