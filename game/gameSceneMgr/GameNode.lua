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
	self.TlChildren = {}
	self._name = params._name or ""
	if params._data then
		self:setData(params._data)
	end
	if params._children then
		self:createChildren(params._children)
	end		
end
--设置节点携带的可变更数据
-- function M:setData( data )
-- 	self._data = data
-- end
-- function M:getData(  )
-- 	return self._data
-- end
function M:getName(  )
	return self._name
end
function M:onExit(  )
	for k,com in ipairs(self.components) do
		com = nil
	end
end
function M:update( dt )
	for k,com in ipairs(self.components) do
		if com.update then
			com:update(dt)
		end		
	end
	for i,v in ipairs(self.TlChildren) do
		v:update()
	end
end
function M:initView(  )
	-- self:getFuncByCmdX("initView")
	for k,com in ipairs(self.components) do
		if com.initView then
			com:initView()
		end		
	end
	for i,v in ipairs(self.TlChildren) do
		v:initView()
	end
end
function M:updateView( )
	self:getFuncByCmdX("updateView")
end
function M:enterView(  ) --对应onenter
	self:getFuncByCmdX("enterView")
end
function M:exitView(  ) --对应onexit
	self:getFuncByCmdX("exitView")
end
function M:releaseView(  )
	self:getFuncByCmdX("releaseView")
end
function M:getFuncByCmdX( cmd )
	for k,com in ipairs(self.components) do
		if com[cmd] then
			com[cmd](com)
		end		
	end
	for i,v in ipairs(self.TlChildren) do
		v[cmd](v)
	end
end
function M:addAllComponents( _components )
	if _components then
		for i,comp in ipairs(_components) do
			if ComponentFactory.hasComponent(comp._type) then
				self:addComponent(comp)
			end
		end
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
function M:getAllChildren(  )
	return self.TlChildren
end

function M:createChildren( _children )
	for k,child in pairs(_children) do
		local node = GameSceneMgr.createGameNode(child)
		self:addChild(node)
		table.insert(self.TlChildren,node)
	end
end

function M:getComponentByName( componentName )
	return self.TlComName[componentName]
end
function M:getAllComponentByName(  )
	return self.TlComName
end
function M:getAllComponent(  )
	return self.components
end
-- function M:setAllGameNode( tlNode )
-- 	self.AllgameObject = tlNode
-- end
--根据name获取gamenode
-- function M:getGameNode( name )
-- 	for i,node in ipairs(self.AllgameObject) do
-- 		if name == node:getName() then
-- 			return node
-- 		end
-- 	end
-- 	return nil
-- end
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