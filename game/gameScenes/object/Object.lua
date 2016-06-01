--
-- Author: Your Name
-- Date: 2015-08-08 14:21:24
--
local ObjectBase = class("ObjectBase")


function ObjectBase:ctor( )
    self:bindComponent("cocos_node",{})
end

function ObjectBase:update( dt )
    
end

function ObjectBase:getCom( componentName )
    return self.componentObjects_[componentName]
end
function ObjectBase:hasCom(componentName)
    return self.componentObjects_ and self.componentObjects_[componentName] ~= nil
end

function ObjectBase:bindComponent(componentName,data)
    if not self.componentObjects_ then self.componentObjects_ = {} end
    if self.componentObjects_[componentName] then return end

    local component = ComponentFactory.createcomponent(componentName,data)
    if not component then return end
    for i, dependcomponentName in pairs(component:getDepends()) do
        local newData = {}
        if data and data[componentName] then
             newData =data[componentName]
         end 
        self:bindComponent(dependcomponentName,newData)
    end
    component:bind(self)
    self.componentObjects_[componentName] = component
end
-- function ObjectBase:bindMethod( component,methodName,method )
--     local originMethod = self[methodName]
--     -- if not originMethod then
--     --     self[methodName] = function ( ... )
--     --         return method(component,...)
--     --     end
--     --     return
--     -- end
     
-- end
function ObjectBase:bindMethod( component, methodName, method )
    local originMethod = self[methodName]
    if not originMethod then
        self[methodName] = function ( ... )
            return method(component,...)
        end
        return
    end
    if not self.bindingMethods_ then self.bindingMethods_ = {} end
    if not self.bindingMethods_[methodName] then self.bindingMethods_[methodName] = {} end
    local chain = {component, originMethod}
    local newMethod = function ( ... )
        local ret = originMethod(...)
        local args = {...}
        args[#args + 1] = ret 
		table.insert(args,1,component)
        return method(unpack(args))
    end
    self[methodName] = newMethod
    chain[3] = newMethod
    table.insert(self.bindingMethods_[methodName], chain)
end

return ObjectBase