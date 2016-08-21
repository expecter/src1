--
-- Author: Your Name
-- Date: 2016-08-19 21:21:36
--
local init = {
	clicked = {},
	scheduler = {},

}
local ComponentFactory = component.ComponentFactory
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
	self:setData(params)
	self:initView()
end
function M:setData( params )
	self:runScript("setData",params)
end
function M:binding(  )
	self:runScript("binding")
end
function M:initView(  )	
  	self:runScript("initView")
  	self:updateView()
end

function M:updateView( params )
	if params then
		self:setData(params)
	end	
	self:runScript("updateView")	
end
function M:runScript( name,params )
	for componentName,component in pairs(self.components) do
		if component[name] then
			if params then
				component[name](component,params[componentName])
			else
				component[name](component)
			end			
		end
	end
end
function M:addComponent( componentName,params )
	if not self.components[componentName] then
		self.components[componentName] = ComponentFactory.createComponent(componentName,self,params)
		self.components[componentName]:bindFunc()
	end
end
function M:getComponent( componentName )
	return self.components[componentName]
end
function M:bindMethod( component,methodName )
	if self[methodName] then
		dump("Object has Method "..methodName)
		return
	end
	self[methodName] = function ( target,params )
		return component[methodName](component,params)
	end
end
return M