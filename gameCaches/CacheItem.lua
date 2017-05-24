--
-- Author: Your Name
-- Date: 2016-05-24 23:40:37
--
local M = class(...,require("gameCaches.GameCache"))
local dataModel = {
	refId = 1,
	id = 1,
	num = 1,
}
function M:ctor(  )
	local params = {
		cacheName = "CmdItem",
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
	-- self.cache = ref.getRef({refName = "refarmy"})
	self:updateByProto({})
end
function M:cleanup(  )
	self.cache = {}
end
--请求命令
function M:test( params )
	local data = params
	
	self:updateByProto(self.cache)
end
--分解成技能
function M:newItem( params )
	table.insert({id = 1,refId = 1})
	self:updateByProto(self.cache)
end
return M