--
-- Author: Your Name
-- Date: 2015-08-08 18:36:36
--
local componentBase = class("componentBase")

function componentBase:ctor( params)
	self.name_         = params.componentName or "name"
    self.depends_      = checktable(params.depends)
    self.priority_     = checkint(params.priority) -- 行为集合初始化时的优先级，越大越先初始化
    self.object_       = params.object
end

function componentBase:getName()
    return self.name_ or ""
end

function componentBase:getDepends()
    return self.depends_ or {}
end

function componentBase:getPriority()
    return self.priority_ or 0
end

return componentBase