--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
local scheduler = require('framework.scheduler')
function M:ctor( target ,params)
	self.target = target
	self:setData(params)
	self.time = 0
end
function M:setData(params )
end
function M:initView( target )
	self.scheduler = scheduler.scheduleGlobal(function ( index )
		self.time = self.time+1
		if self.callback then self.callback(self.time) end		
	end,1)
end
function M:updateView( target )
end
function M:setScheduleCallback( target,callback )
	self.callback = callback
end
function M:bindFunc( target )
	target:bindOnceMethod(self, "setScheduleCallback")
end
return M