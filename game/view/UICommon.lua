--
-- Author: Your Name
-- Date: 2016-08-17 23:05:29
--
local M = {}

function M.createViewTable( parent,dir,unit,unitLength,unitUpdateEvent,unitClickedEvent )
	local lstv = view.ViewTable.new{
		size = parent:getContentSize(),
		dir = dir,
		unit = unit,
		unitLength = unitLength,
		unitUpdateEvent = function ( viewTableUnit, unitData, unitIndex )
			if unitUpdateEvent then
				unitUpdateEvent(viewTableUnit, unitData, unitIndex)
			end			
		end,
		unitClickedEvent = function ( viewTableUnit, unitData, unitIndex, x, y )
		if unitClickedEvent then
			unitClickedEvent(viewTableUnit, unitData, unitIndex, x, y)
		end
			
		end,	
	}
	lstv:setAnchorPoint(cc.p(0,0))
	parent:addChild(lstv)
	return lstv
end
function M.initTableTabMenu( parent,dir,unitLength,unit,unitClickedEvent ,unitUpdateEvent,isSelect,SelectFilter,orgindex)
    isSelect = isSelect == true
    orgindex = orgindex or 1
    SelectFilter = SelectFilter or function( ) return true end
    local orgNode = nil
    local lstv = view.ViewTable.new{
        size = parent:getContentSize(),
        dir = dir,
        unit = unit,
        unitLength = unitLength,
        unitUpdateEvent = function ( viewTableUnit, unitData, unitIndex )
            if unitUpdateEvent then
                if not viewTableUnit.ccNode then
                    viewTableUnit.ccNode = unitUpdateEvent(unitData)
                    viewTableUnit:addChild(viewTableUnit.ccNode)
                    if unitIndex == orgindex then
                        orgNode = viewTableUnit.ccNode
                    end
                end
                viewTableUnit.ccNode:updateView(unitData)
                if isSelect and SelectFilter(unitData) then
                    if unitIndex == orgindex then
                        if viewTableUnit.ccNode.hightlight then
                            viewTableUnit.ccNode:hightlight(unitData)
                        end                        
                    else
                        if viewTableUnit.ccNode.normal then
                            viewTableUnit.ccNode:normal(unitData)
                        end
                    end
                end
            end

        end,
        unitClickedEvent = function ( viewTableUnit, unitData, unitIndex, x, y )
            if unitClickedEvent then
                if unitIndex == orgindex then
                    return
                end
                unitClickedEvent(viewTableUnit, unitData, unitIndex, x, y)
                if isSelect and SelectFilter(unitData) then
                     if orgNode and orgNode.normal then
                        orgNode:normal(unitData)
                    end                
                    orgindex = unitIndex
                    orgNode = viewTableUnit.ccNode
                    if orgNode.hightlight then
                        orgNode:hightlight(unitData)
                    end
                end               
            end            
        end,    
    }
    lstv:setAnchorPoint(cc.p(0,0))
    parent:addChild(lstv)
    return lstv
end
function M.createSwitchList( viewList,callback ,defaultIndex)
    local defaultIndex = 1
    local orgNode = nil
    local tlNode = viewList:getTlCcNode()
    local function switchEvent( index )
        if orgNode and orgNode.normal then
            orgNode:normal()
        end
        orgNode = tlNode[index]
        if orgNode and orgNode.hightlight then
            orgNode:hightlight()
        end
        if callback then
            callback(index)
        end     
    end
    viewList:setClickedEvent(function ( node,index,x,y )
        switchEvent(index)
    end)
    switchEvent(defaultIndex)
end
-- 创建线性列表或滚动列表
function M.createViewList(parent, isMovable, dir, padding, unit, unitPadding, align)
    isMovable = isMovable~=false --默认true
    local cls = view.ViewList
    
    local size = parent:getContentSize()
    local lstv = cls.new{
        size = size,
        dir = dir,
        padding = padding,
        unit = unit,
        unitPadding = unitPadding,
        align = align,
    }
    lstv:setAnchorPoint(cc.p(0,0))
    lstv.ccScrollView:setMovable(isMovable)
    parent:addChild(lstv)
    return lstv
end
return M