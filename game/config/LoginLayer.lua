--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("eventComponent")
function M:ctor( target )
	self.target = target
end
function M:initView( target )
	target.events.onClicked = function (  )
		
	end
	
end
function M:bindFunc( target )    
end
return M