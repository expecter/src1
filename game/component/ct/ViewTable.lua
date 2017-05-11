--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("eventComponent")
function M:ctor( target ,params)
	self.target = target
	self.cellMode = params.cellMode or function ( params )
		return GameSceneMgr.createGameNode(require("game.config.gameCell"))
	end
	self.isTapMenu = DEFAULT_TRUE(params.isTapMenu)
	self.defaultIndex = params.defaultIndex or 1
    self.SelectFilter = params.SelectFilter or function( ) return true end
	self:setData(params)
end
function M:setData(params )
	self.tlData = CommonUtil.getData(params.tlData)
end
-- function M:cellMode( cmdX )
	
-- end
--exportFunc
function M:initView( target )
	self.viewtable = UICommon.initTableTabMenu(self.target,"h",160,1,handler(self,self.onClick),self.cellMode,true)
	self.viewtable = view.ViewTable.new{
		size = parent:getContentSize(),
        dir = self.dir,
        unit = self.unit,
        unitLength = self.unitLength,
        unitUpdateEvent = function ( viewTableUnit, unitData, unitIndex )
            if self.cellMode then
                if not viewTableUnit.ccNode then
                    viewTableUnit.ccNode = self.cellMode(unitData)
                    viewTableUnit:addChild(viewTableUnit.ccNode)
                    if unitIndex == self.defaultIndex then
                        orgNode = viewTableUnit.ccNode
                    end
                end
                if viewTableUnit.ccNode.updateView then
                    viewTableUnit.ccNode:updateView(unitData)
                end
                
                if self.isTapMenu and self.SelectFilter(unitData) then
                    if unitIndex == self.defaultIndex then
                        if viewTableUnit.ccNode and viewTableUnit.ccNode.hightlight then
                            viewTableUnit.ccNode:hightlight(unitData)
                        end
						if orgindexEvent then
							orgindexEvent(viewTableUnit, unitData, unitIndex)
						end
                    else
                        if viewTableUnit.ccNode and viewTableUnit.ccNode.normal then
                            viewTableUnit.ccNode:normal(unitData)
                        end
                    end
                end
            end

        end,
        unitClickedEvent = function ( viewTableUnit, unitData, unitIndex, x, y )
            if self.onClick then
                if self.isTapMenu and unitIndex == self.defaultIndex then
                    return
                end
                self.onClick(viewTableUnit, unitData, unitIndex, x, y)
                if self.isTapMenu and self.SelectFilter(unitData) then
                     if orgNode and orgNode.normal then
                        orgNode:normal(unitData)
                    end                
                    self.defaultIndex = unitIndex
                    orgNode = viewTableUnit.ccNode
                    if orgNode and orgNode.hightlight then
                        orgNode:hightlight(unitData)
                    end
                end               
            end            
        end,
	}
	self.viewtable:setAnchorPoint(cc.p(0,0))
    self.target:addChild(self.viewtable)
	self:updateView()	
end

function M:switchToIndex( index )	
	self.defaultIndex = index
    self.viewtable:refresh()
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