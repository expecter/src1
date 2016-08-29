--
-- Author: Your Name
-- Date: 2016-08-19 21:21:36
--
local init = {
	clicked = {},
	scheduler = {},

}
local M = class(...,function (  )
	return display.newNode()
end)

function M:ctor( params )
	self.components = {}
	for componentName,var in pairs(params) do
		if ComponentFactory.hasComponent(componentName) then
			self:addComponent(componentName,var)
		end
	end
	self:updateData(params)
	self:initView()
end
--componentFunc
function M:setData( params )
end
function M:binding(  )
end
function M:initView(  )
end
function M:updateView( params )
end

function M:addComponent( componentName,params )
	if not self.components[componentName] then
		self.components[componentName] = ComponentFactory.createComponent(componentName,self)
		if self.components[componentName].setData then
			self.components[componentName]:setData(params)
		end		
		self:addInFunc(self.components[componentName])	
		if self.components[componentName].bindFunc then
			self.components[componentName]:bindFunc(self)
		end
	end
end
function M:updateData( params )
	self:setData(params)
	for componentName,var in pairs(params) do
		if self.components[componentName] and self.components[componentName].setData then
			self.components[componentName]:setData(var)
		end		
	end
end
--inLineFunc:initView updateView
function M:addInFunc( component )
	local func = {"initView","updateView"}
	for _,name in ipairs(func) do
		if component[name] then
			self:bindMethod(component,name)
		end
	end
end
function M:bindMethod( component,methodName )
	local originMethod = self[methodName]
    if not originMethod then
        self[methodName] = function ( ... )
        	return component[methodName](component,...)
        end
        return
    end
    local newMethod = function ( ... )
    	component[methodName](component,...)
    	originMethod(...)
    end
    self[methodName] = newMethod
end
function M:getComponent( componentName )
	return self.components[componentName]
end
function M:bindOnceMethod( component,methodName )
	if self[methodName] then
		dump("Object has Method "..methodName)
		return
	end
	self[methodName] = function ( target,... )
		return component[methodName](component,...)
	end
end
return M