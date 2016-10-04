--
-- Author: Your Name
-- Date: 2016-08-19 21:21:36
--


local M = class(...,function (  )
	return display.newNode()
end)
M.NODE_SETDATA = "nodesetdata"
M.NODE_CLICK = "nodeclick"
function M:ctor( params )
	self.components = {}
	self.TlComName = {}
	self._name = params._name or ""
	if params and params._component then
		for i,comp in ipairs(params._component) do
			if ComponentFactory.hasComponent(comp._type) then
				self:addComponent(comp)
			end
		end
	end
	
end
function M:getName(  )
	return self._name
end

function M:getTlInitView(  )
	return {
		function (  )
			self:initView()
		end	
	}
end
function M:getTlOnEnter(  )
	return {
		function (  )
			self:enterView()
		end	
	}
end
function M:getTlOnExit(  )
	return {
		function (  )
			self:exitView()
		end	
	}
end
function M:tlReleaseView(  )
	return {
		function (  )
			self:releaseView()
		end	
	}
end

function M:initView(  )
	for k,com in ipairs(self.components) do
		if com.initView then
			com:initView(self)
		end
	end
end
function M:updateView( )
	for k,com in ipairs(self.components) do
		if com.updateView then
			com:updateView(self)
		end		
	end
end
function M:enterView(  ) --对应onenter
	for k,com in ipairs(self.components) do
		if com.enterView then
			com:enterView(self)
		end		
	end
end
function M:exitView(  ) --对应onexit
	for k,com in ipairs(self.components) do
		if com.exitView then
			com:exitView(self)
		end
		
	end
end
function M:releaseView(  )
	for k,com in ipairs(self.components) do
		if com.releaseView then
			com:releaseView(self)
		end
	end
end
function M:addComponent( component )
	local comName = component._type or ""
	table.insert(self.components,ComponentFactory.createComponent(comName,self,component))
	self.TlComName[comName] = self.components[#self.components]
	self.TlComName[comName]:bindFunc(self)
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

function M:getComponent( componentName )
	return self.TlComName[componentName]
end
function M:getAllComponent(  )
	return self.TlComName
end
function M:setAllGameNode( tlNode )
	self.AllgameObject = tlNode
end
--根据name获取gamenode
function M:getGameNode( name )
	for i,node in ipairs(self.AllgameObject) do
		if name == node:getName() then
			return node
		end
	end
	return nil
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
return M