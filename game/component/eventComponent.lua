--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("eventComponent")
function M:ctor( target )
	self.target = target
end
--exportFunc
function M:initView( target )
	-- local function click(  )
		
	-- end
	-- target:addObserver(self,GameNode.NODE_CLICK,function ( params )
	-- 	if params.btnName then
			
	-- 	end
	-- end)
	-- target:getNode()
	target:getnode()
end
function M:bindFunc( target )    
end
return M