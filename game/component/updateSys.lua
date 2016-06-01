--
-- Author: Your Name
-- Date: 2016-05-12 14:48:25
--
local M = class("nodeComponent",component.componentBase)

function M:ctor(  )
	self.object_ = {}
end

function M:bind( object )
	object:bindMethod(self, "addObject", self.addObject)
	object:bindMethod(self, "update", self.update)
end
function M:addObject( object )
	table.insert(self.object_,object)
end
function M:update( object,dt )
	print("update")
	for i,object in ipairs(self.object_) do
		object:update1()
	end
end

return M