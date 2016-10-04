--
-- Author: Your Name
-- Date: 2016-10-01 22:50:41
--
local M = {}

function M.createNode( params )
	local _opacity = params._opacity or 255
	local _color = params._color or cc.c3b(255,255,255)
	local node = display.newNode()
	function node:updateView(  )
		
		self:setOpacity(_opacity)
	end
	node:updateView()
	return node
end

return M