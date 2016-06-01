--
-- Author: Your Name
-- Date: 2016-05-12 14:48:25
--
local M = class("...")

function M:ctor(  )
	
end

function M:bind( object )
	object:bindMethod(self, "initView", self.initView)
	object:bindMethod(self, "updateView", self.updateView)
end
function M:initView(  )
	
end
function M:updateView(  )
	
end

return M