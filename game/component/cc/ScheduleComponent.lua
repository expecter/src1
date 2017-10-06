--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("ScheduleComponent")
local scheduler = require('framework.scheduler')
function M:ctor(params)
	self:setData(params)
end
function M:setData(params )
end
function M:initView( target )
	self.scheduler = scheduler.scheduleUpdateGlobal(function ( dt )
		if self.target == nil or tolua.isnull(self.target) then
			scheduler.unscheduleGlobal(self.scheduler)
			return
		end
		self.target:dispatch("scheduler_update",dt)
	end)
end
-- function M:startScheduler( target,callback )	
	
-- end
function M:endScheduler( target )
	scheduler.unscheduleGlobal(self.scheduler)
end
function M:bindFunc( target )
	target:bindOnceMethod(self, "startScheduler")
	target:bindOnceMethod(self, "endScheduler")
end
return M