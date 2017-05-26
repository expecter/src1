--
-- Author: Your Name
-- Date: 2016-05-24 23:40:37
--
local M = class(...,require("gameCaches.GameCache"))
local dataModel = {
	taskId = 1,
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
--完成任务
function M:activeTask( params )
	--TODO
	self:updateByProto({})
end
return M