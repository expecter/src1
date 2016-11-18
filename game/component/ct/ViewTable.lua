--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("eventComponent")
function M:ctor( target ,params)
	dump("eventComponent")
	self.target = target
	self.cellMode = params.cellMode or function ( params )
		return GameSceneMgr.createGameNode(require("game.config.gameCell"))
	end
	self.isTapMenu = DEFAULT_TRUE(params.isTapMenu)
	self.defaultIndex = params.defaultIndex or 1
	self:setData(params)
end
function M:setData(params )
	self.tlData = ref.getRef(params.tlData)
end
-- function M:cellMode( cmdX )
	
-- end
--exportFunc
function M:initView( target )
	self.viewtable = UICommon.initTableTabMenu(self.target,"h",160,1,handler(self,self.onClick),self.cellMode,true)
	self:updateView()	
end
function M:updateView( target )
	-- dump(self.tlData)
    self.viewtable:setTlUnitData(self.tlData)
end

--缓存使用方法
function M:onAdd( cmdX )
	-- local index = GameObj.ObjArmy.getIndex(self.tlData,cmdX)
	self.viewtable:setTlUnitData(self.tlData)
end

function M:onUpdate( cmdX )
	local index = GameObj.ObjArmy.getIndex(self.tlData,cmdX)
	self.viewtable:updateUnitData(index,self.tlData)
end

function M:onDelete( cmdX )
	local index = GameObj.ObjArmy.getIndex(self.tlData,cmdX)
	self.viewtable:removelUnitData(index)
end

function M:onClick( node,cmdX )
	self.callback_(cmdX)
end
function M:setViewCallback( target,callback )
	self.callback_ = callback
	self.callback_(self.tlData[self.defaultIndex],self.defaultIndex)
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"setViewCallback")
end
return M