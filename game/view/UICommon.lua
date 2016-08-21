--
-- Author: Your Name
-- Date: 2016-08-17 23:05:29
--
local M = {}
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
function M.createViewTable( parent,dir,unit,unitLength,unitUpdateEvent,unitClickedEvent )
	local lstv = view.ViewTable.new{
		size = parent:getContentSize(),
		dir = dir,
		unit = unit,
		unitLength = unitLength,
		unitUpdateEvent = unitUpdateEvent,
		unitClickedEvent = unitClickedEvent,	
	}
	lstv:setAnchorPoint(cc.p(0,0))
	parent:addChild(lstv)
	return lstv
end
function M.createSwitchList( tlNode,defaultIndex,callback )
	local defaultIndex = 1
	local orgNode = nil
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
	for i,node in ipairs(tlNode) do
		local orgEvent =node:getClickedEvent()
		node:setClickedEvent(function ( node,x,y)
			switchEvent(i)
			orgEvent(node,x,y)
		end)
	end
	switchEvent(defaultIndex)
end
return M