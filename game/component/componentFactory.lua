--
-- Author: Your Name
-- Date: 2016-08-19 23:17:12
--
local component = require("game.component.component")
local M = {}

function M.createComponent(componentName,target,params)
    local class = component[componentName]
    assert(class ~= nil, string.format("ComponentFactory.createComponent() - Invalid behavior name \"%s\"", tostring(componentName)))
    return class.new(target,params)
end
function M.hasComponent( componentName )
	if component[componentName] then
		return true
	end
	return false
end
return M