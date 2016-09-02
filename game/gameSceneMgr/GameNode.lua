--
-- Author: Your Name
-- Date: 2016-08-19 21:21:36
--

local InitComponent = {
	ObserveComponent = {},
}
local M = class(...,function (  )
	return display.newNode()
end)
M.NODE_SETDATA = "nodesetdata"
M.NODE_CLICK = "nodeclick"
function M:ctor( params )
	self.components = {}
	table.merge(InitComponent,params)
	for componentName,var in pairs(InitComponent) do
		if ComponentFactory.hasComponent(componentName) then
			self:addComponent(componentName,var)
		end
	end
	self:setData(params and params.owner or {})
	self:initView()
	--自动回调更新参数
	self:addObserver(self,M.NODE_SETDATA,function ( params )
		if params then
			if params.owner then
				self:setData(params.owner)
				self:updateView()
			end			
			for componentName,var in pairs(params) do			
				if self.components[componentName] then
					self.components[componentName]:setData(var)
					if DEFAULT_TRUE(var.isUpdate) then
						self.components[componentName]:updateView()
					end					
				end
			end
		end
	end)
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
function M:enterView(  )
	
end
function M:exitView(  )
	
end
function M:addComponent( componentName,params )
	if not self.components[componentName] then
		self.components[componentName] = ComponentFactory.createComponent(componentName,self,params)
		-- if self.components[componentName].setData then
		-- 	self.components[componentName]:setData(params)
		-- end		
		-- self:addInFunc(self.components[componentName])	
		if self.components[componentName].bindFunc then
			self.components[componentName]:bindFunc(self)
		end
	end
end
-- function M:updateData( params )
-- 	self:setData(params)
-- 	for componentName,var in pairs(params) do
-- 		if self.components[componentName] and self.components[componentName].setData then
-- 			self.components[componentName]:setData(var)
-- 		end		
-- 	end
-- end
--inLineFunc:initView updateView
-- function M:addInFunc( component )
-- 	local func = {"initView","updateView"}
-- 	for _,name in ipairs(func) do
-- 		if component[name] then
-- 			self:bindMethod(component,name)
-- 		end
-- 	end
-- end
function M:bindMethod( component,methodName )
	local originMethod = self[methodName]
    if not originMethod then
        self[methodName] = function ( ... )
        	return component[methodName](component,...)
        end
        return
    end
    local newMethod = function ( ... )    	
    	originMethod(...)
    	return component[methodName](component,...)
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
	-- self[methodName] = function ( target,... )
	-- 	return component[methodName](component,...)
	-- end
	self:bindMethod(component,methodName)
end
return M