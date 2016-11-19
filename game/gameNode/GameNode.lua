--
-- Author: Your Name
-- Date: 2016-08-19 21:21:36
--


local M = class(...,function (  )
	return display.newNode()
end)
function M:ctor( params )
	self.components = {}
	self.TlComName = {}
	self._name = params._name or ""
	if params._data then
		self:setData(params._data)
	end
	--自带响应回调
	-- self:addComponent({_type = "cc_observer"})
	if params and params._component then
		for i,comp in ipairs(params._component) do
			if ComponentFactory.hasComponent(comp._type) then
				self:addComponent(comp)
			end
		end
	end	
end
--设置节点携带的可变更数据
function M:setData( data )
	self._data = data
end
function M:getData(  )
	return self._data
end
function M:getName(  )
	return self._name
end
function M:onExit(  )
	for k,com in ipairs(self.components) do
		com = nil
	end
end
function M:getTlInitView(  )
	local tlFunc = {}
	for k,com in ipairs(self.components) do
		if com.initView then
			table.insert(tlFunc,handler(com,com.initView))
		end
	end
	return tlFunc
end
function M:getTlOnEnter(  )
	local tlFunc = {}
	for k,com in ipairs(self.components) do
		if com.enterView then
			table.insert(tlFunc,handler(com,com.enterView))
		end
	end
	return tlFunc
end
function M:getTlOnExit(  )
	local tlFunc = {}
	for k,com in ipairs(self.components) do
		if com.exitView then
			table.insert(tlFunc,handler(com,com.exitView))
		end
	end
	return tlFunc
end
function M:getTlReleaseView(  )
	local tlFunc = {}
	for k,com in ipairs(self.components) do
		if com.releaseView then
			table.insert(tlFunc,handler(com,com.releaseView))
		end
	end
	return tlFunc
end

function M:initView(  )
	for index,func in ipairs(self:getTlInitView()) do
		func()
	end
	-- GameSceneMgr:addEventListener("update", function(event)
	-- 	if self then
	-- 		self:update(event.data)
	-- 	end		
	-- end)
end
function M:update( dt )
	for k,com in ipairs(self.components) do
		if com.update then
			com:update(dt)
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
	for index,func in ipairs(self:getTlOnEnter()) do
		func()
	end
end
function M:exitView(  ) --对应onexit
	for index,func in ipairs(self:getTlOnExit()) do
		func()
	end
end
function M:releaseView(  )
	for index,func in ipairs(self:getTlReleaseView()) do
		func()
	end
end
function M:addComponent( params )
	local comName = params._type or ""
	local component = ComponentFactory.createComponent(comName,self,params)
	if component.getDepends then
		for i,depends in ipairs(component:getDepends()) do
			if not self:getComponent(depends._type) then
				self:addComponent(depends)
			end			
		end
	end
	table.insert(self.components,component)
	self.TlComName[comName] = self.components[#self.components]
	if self.TlComName[comName].bindFunc then
		self.TlComName[comName]:bindFunc(self)
	end
	
end
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