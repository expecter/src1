--
-- Author: Your Name
-- Date: 2016-05-12 14:48:25
--
local M = class("nodeComponent",component.componentBase)

function M:ctor( data )
end

function M:bind( object )
	object:bindMethod(self, "initView", self.initView)
	object:bindMethod(self, "getView", self.getView)
end
function M:initView( object,parent )
	self.node = display.newNode()
	parent:addChild(self.node)
end
function M:getView(  )
	return self.node
end
function M:updateView(  )
	
end

return M