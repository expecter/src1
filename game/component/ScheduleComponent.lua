--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("ScheduleComponent")
local scheduler = require('framework.scheduler')
function M:ctor( target ,params)
	self.target = target
	self:setData(params)
end
function M:setData(params )
end
function M:initView( target )
end
function M:startScheduler( target,callback )
	self.scheduler = scheduler.scheduleUpdateGlobal(function ( dt )
		if callback then
			callback(dt)
		end
	end)
end
function M:endScheduler(  )
	scheduler.unscheduleGlobal(self.scheduler)
end
function M:bindFunc( target )
	target:bindOnceMethod(self, "startScheduler")
	target:bindOnceMethod(self, "endScheduler")
end
return M