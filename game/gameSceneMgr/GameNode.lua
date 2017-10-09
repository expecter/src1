--
-- Author: Your Name
-- Date: 2016-08-19 21:21:36
--


local M = class("GameNode")
function M:ctor( params )
	self:init(params)
end

function M:init( params )
	self.components = {}
	self.TlComName = {}
	self.TlChildren = {}
	self._name = params._name or ""	
	self._view = params._view	
	self:addAllComponents(params._component)
	if params._children then
		self:createChildren(params._children)
	end
end

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
function M:initView( parent )
	if type(self._view) == "table" then
		self._view = ccNodeUtil.initNode(self._view)
		if parent then
			parent:addChild(self._view)
		end		
	end
	for k,com in ipairs(self.components) do
		if com.initView then
			com:initView(parent)
		end		
	end
	for i,v in ipairs(self.TlChildren) do
		v:initView(self:getView())
	end
end

function M:getView(  )
	return self._view
end

--各个component自己调用
function M:updateView( )
	self:getFuncByCmdX("updateView")
end
function M:enterView(  ) --对应onenter
	self:getFuncByCmdX("enterView")
end
function M:exitView(  ) --对应onexit
	self:getFuncByCmdX("exitView")
	
end

function M:removeView(  )	
	self:releaseView()
	self:exitView()
	self._view:removeFromParent(true)
	self._view = nil
end

function M:releaseView(  )
	self:getFuncByCmdX("releaseView")
	GameMessage:dispatchEvent{
        name = GameMessage.MessageName.releaseNode,
        data = {name = self._name},
    }
end
function M:getFuncByCmdX( cmd )
	for k,com in ipairs(self.components) do
		if com[cmd] then
			com[cmd](com,self)
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
	if (type(self._view) == "table" and self._view._type == "node") or tolua.type(self._view) == "cc.Node" then
		if not self.TlComName["ui_node"] then
			self:addComponent({_type = "ui_node"})
		end
	end
	if (type(self._view) == "table" and self._view._type == "label") or tolua.type(self._view) == "cc.label" then
		if not self.TlComName["ui_label"] then
			self:addComponent({_type = "ui_label"})
		end
	end
	if (type(self._view) == "table" and self._view._type == "sprite") or tolua.type(self._view) == "cc.Sprite" then
		if not self.TlComName["ui_sprite"] then
			self:addComponent({_type = "ui_sprite"})
		end
	end
	if (type(self._view) == "table" and self._view._type == "ccreader") or tolua.type(self._view) == "cc.BReader" then
		
		if not self.TlComName["ui_ccReader"] then
			self:addComponent({_type = "ui_ccReader"})
		end
	end
end

function M:addComponent( params )
	local comName = params._type or ""
	local contidion = DEFAULT_TRUE(params.contidion)
	if not contidion then --不满足添加条件则不添加该组件
		return
	end
	local component = ComponentFactory.createComponent(comName,self,params)
	if component.getDepends then
		for i,depends in ipairs(component:getDepends()) do
			if not self:getComponentByName(depends._type) then
				self:addComponent(depends)
			else
				print("已有该组件")
			end			
		end
	end
	table.insert(self.components,component)
	self.TlComName[comName] = self.components[#self.components]
	if self.TlComName[comName].bindFunc then
		self.TlComName[comName]:bindFunc(self)
	end	
end

function M:removeComponent( _type )
	
end

--添加判断条件，方便组件复用
function M:addContidion(  )
	
end

function M:addNodeScript( _scripts )
	if _scripts then
		for i,params in ipairs(_scripts) do
			local script = require(params._path)
			self[params._func] = script[params._func]
		end
	end
end

function M:getAllChildren(  )
	return self.TlChildren
end
--由于组件是在该节点上继续addChild的，需要给命名子节点加上zorder1才保证渲染顺序
function M:createChildren( _children )
	for k,child in pairs(_children) do
		local node = GameSceneMgr.createGameNode(child)
		-- self:addChild(node,1) 
		table.insert(self.TlChildren,node)
	end
end

function M:addGameChild( child )
	table.insert(self.TlChildren,child)
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
function M:bindOnceMethod( component,methodName )
	if self[methodName] then
		dump("Object has Method "..methodName)
		return
	end
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