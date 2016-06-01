--
-- Author: Your Name
-- Date: 2016-05-17 21:48:20
--
local componentFactory = {}
function componentFactory.createcomponent(componentName,data)
    local class = component[componentName]
    if class == nil then
    	print(string.format("componentFactory.createcomponent() - Invalid component name \"%s\"", tostring(componentName)))
    	return nil
    end
    return class.new(data)
end
return componentFactory