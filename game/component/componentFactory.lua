--
-- Author: Your Name
-- Date: 2016-08-19 23:17:12
--
local component = require("game.component.component")
local M = {}

function M.createComponent(componentName,target,params)
    local ok,class = pcall(function (  )
    	return component[componentName]
    end)
    if not ok then
    	return nil
    end
    assert(class ~= nil, string.format("ComponentFactory.createComponent() - Invalid behavior name \"%s\"", tostring(componentName)))
    local com = class.new(params)
    if not com.setTarget then
        print("componentName",componentName)
    end
    com:setTarget(target)
    com.name = componentName
    return com
end

function M.createByNode( componentName,target,node,params )
    local ok,class = pcall(function (  )
        return component[componentName]
    end)
    if not ok then
        return nil
    end
    assert(class ~= nil, string.format("ComponentFactory.createComponent() - Invalid behavior name \"%s\"", tostring(componentName)))
    local com = class.new(params)
    if not com.setTarget then
        print("componentName",componentName)
    end
    com:setTarget(target)
    com:initByNode(node)
    com.name = componentName
    return com
end

function M.hasComponent( componentName )
	local ok = pcall(function (  )
    	return component[componentName]
    end)
	return ok
end
return M