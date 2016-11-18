--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("ct_viewList")
function M:ctor( target ,params)
	self.target = target
	self.cellMode = params.cellMode or function ( params )
		-- local config = GameSceneMgr.updateConfig("game.config.gameCell",{
		-- 	_type = "cc_label",
		-- 	text = params.name
		-- })
		local config = clone(require("game.config.gameCell"))
		config._data = params
		return GameSceneMgr.createGameNode(config)
	end
	self.isMovable = params.isMovable
	self.isTapMenu = DEFAULT_TRUE(params.isTapMenu)
	self.defaultIndex = params.defaultIndex or 1
	self:setData(params)
end
function M:setData( params )
	local mtype = params.tlData._type
	if not mtype then
		self.tlData = params
		return
	end
	if mtype == "ref" then
		self.tlData = ref.getRef(params.tlData)
	end
	if mtype == "cache" then
		self.tlData = GameObj.ObjArmy.getCacheData()
	end
end
-- function M:cellMode( cmdX )
	
-- end
--exportFunc
function M:initView(  )
	self.viewlist = UICommon.createViewList(self.target,self.isMovable)
	self:updateView()
	GameSceneMgr:addEventListener("time",function (  )
		self:updateSecView()
	end)
end
function M:updateSecView( )
	for i,node in ipairs(self.viewlist:getTlCcNode()) do
		node:updateView()
	end
end
function M:updateView( target )
	local tlNode = {}
	for k,v in ipairs(self.tlData) do
		local node = self.cellMode(v)
        table.insert(tlNode,node)
    end
	self.viewlist:setTlCcNode(tlNode)
	if self.isTapMenu then
		local orgNode = nil
		local function switchEvent( index )
			ObjMessage:dispatchEvent{
	            name = "switch",
	            data = index,
	        }
	        if orgNode and orgNode.normal then
	            orgNode:normal()
	        end
	        orgNode = tlNode[index]
	        if orgNode and orgNode.hightlight then
	            orgNode:hightlight()
	        end
	        if self.callback_ then
	            self.callback_(self.tlData[index],index)
	        end     
	    end
	    self.viewlist:setClickedEvent(function ( node,index,x,y )
	        switchEvent(index)
	    end)
	    switchEvent(self.defaultIndex)
	else
		self.viewlist:setClickedEvent(function ( node,index,x,y )
	        ObjMessage:dispatchEvent{
	            name = ObjMessage.clickEvent.switch,
	            data = index,
	        }
	    end)
	end
end
--缓存使用方法
function M:onAdd( cmdX )
	local index = GameObj.ObjArmy.getIndex(self.tlData,cmdX)
	self.viewlist:insertCcNode(self.cellMode(cmdX),index)
end

function M:onUpdate( cmdX )
	local index = GameObj.ObjArmy.getIndex(self.tlData,cmdX)
	self.viewlist:getTlCcNode()[index]:updateView()
end

function M:onDelete( cmdX )
	local index = GameObj.ObjArmy.getIndex(self.tlData,cmdX)
	self.viewlist:removeNode(function(viewHospitalItem, i)
			return i == index
		end)
end

function M:setViewCallback( target,callback )
	self.callback_ = callback
	self.callback_(self.tlData[self.defaultIndex],self.defaultIndex)
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"setViewCallback")
end
return M