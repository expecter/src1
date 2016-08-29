--
-- Author: Your Name
-- Date: 2016-08-19 23:17:12
--
local component = require("game.component.component")
local M = {}
local compList = {
	ClickComponent=1,
	DrawComponent=2,
}

function M.createComponent(componentName,target,params)
    local ok,class = pcall(function (  )
    	return component[componentName]
    end)
    if not ok then
    	return nil
    end
    assert(class ~= nil, string.format("ComponentFactory.createComponent() - Invalid behavior name \"%s\"", tostring(componentName)))
    return class.new(target,params)
end
function M.hasComponent( componentName )
	local ok = pcall(function (  )
    	return component[componentName]
    end)
	return ok
end
return M