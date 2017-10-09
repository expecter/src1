--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class(...,componentBase)
function M:ctor(params)
	M.super.ctor(self,params)
	self:setData(params)
end
function M:setData( params )
	-- self.tlData = CommonUtil.getData(params.tlData)
	self.cellMode = params.cellMode or function ( params ,index)
		local config = clone(require("game.config.gameCell"))
		table.insert(config._component,{
					_type = "cc_label",
					text = params.name,
				})
		return GameSceneMgr.createGameNode(config)
	end
	if type(params.cellMode) == "table" then
		self.cellMode = function (  )
			return GameSceneMgr.createGameNode(params.cellMode)
		end
	end
	self.isMovable = params.isMovable
	self.isTapMenu = DEFAULT_TRUE(params.isTapMenu)
	self.defaultIndex = params.defaultIndex or 1
	self.dir = params.dir or "h"
	self.unit = params.unit or 1
	self.object = params.object
	self.tlData = params.tlData or {}
	if self.object then
		self.tlData = ComponentUtil.getData(self.object)
	end
	self.callback_ = ComponentUtil.getCallFunc(params.clickedEvent)
end
--exportFunc
function M:initView(  )
	self.viewlist = UICommon.createViewList(self.target:getView(),self.isMovable,self.dir,2,self.unit,2,"left")
	-- self:updateView()
end

function M:enterView(  )
	self:updateView()
end

function M:setTlData( target,tlData )
	self.tlData = tlData
end

function M:updateView( target )
	if self.object then
		self.tlData = ComponentUtil.getData(self.object)
	end
	local tlNode = {}
	local tlGameNode = {}
	for k,v in ipairs(self.tlData) do
		local node = self.cellMode(v,k)
		node:initView()
        table.insert(tlNode,node:getView())
        table.insert(tlGameNode,node)
    end
	self.viewlist:setTlCcNode(tlNode)
	if self.isTapMenu then --切换标签，有高亮和正常显示
		local orgNode = nil
		local function switchEvent( index )
	        if orgNode and orgNode.normal then
	            orgNode:normal()
	        end
	        orgNode = tlGameNode[index]
	        if orgNode and orgNode.hightlight then
	            orgNode:hightlight()
	        end
	        if self.callback_ then
	            self.callback_({cmdX = self.tlData[index],index = index})
	        end
	        if orgNode then
	        	orgNode:updateView()
	        end	        
	    end
	    self.viewlist:setClickedEvent(function ( node,index,x,y )
	        switchEvent(index)
	    end)
	    switchEvent(self.defaultIndex)
	else
		self.viewlist:setClickedEvent(function ( node,index,x,y )
	    end)
	end
end
function M:getViewList(  )
	return self.viewlist
end
--isFirst表示是否第一次回调
function M:setViewCallback( target,callback,isFirst )
	self.callback_ = callback
	if isFirst then
		self.callback_({cmdX = self.tlData[self.defaultIndex],index = self.defaultIndex})
	end	
end
--cache更新调用
function M:onUpdate( )
	-- if self.object then
	-- 	self.tlData = ComponentUtil.getData(self.object)
	-- 	self:updateView()
	-- end
	self:updateView()	
end

function M:onAdd( )
	-- if self.object then
	-- 	self.tlData = ComponentUtil.getData(self.object)
	-- 	self:updateView()
	-- end
	self:updateView()
end

function M:onDelete(  )
	-- if self.object then
	-- 	self.tlData = ComponentUtil.getData(self.object)
	-- 	self:updateView()
	-- end
	self:updateView()
end

function M:bindFunc( target )
	target:bindOnceMethod(self,"setViewCallback")
	target:bindOnceMethod(self,"getViewList")
	
	target:bindOnceMethod(self,"setTlData")
end
return M