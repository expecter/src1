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
                    if viewTableUnit.ccNode.initView then
                        viewTableUnit.ccNode:initView()
                    end
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
-- 创建sprite
function M.createSprite(node)
    if "cc.Sprite" ~= tolua.type(node) then
        return view.ViewSprite.new(node)
    else
        local sprite = display.newSprite()
        sprite:setSpriteFrame(node:getSpriteFrame())
        return sprite
    end
end
function M.createCCProgressTimer( parent, ccForeNode )
    ccForeNode = M.createSprite(ccForeNode)

    local ccProgressTimer = cc.ProgressTimer:create(ccForeNode)
    ccProgressTimer:setType(cc.PROGRESS_TIMER_TYPE_BAR)
    ccProgressTimer:setMidpoint(cc.p(0,0))

    ccProgressTimer:setBarChangeRate(cc.p(1,0))
    ccProgressTimer:setPercentage(0)
    ccProgressTimer:setAnchorPoint(cc.p(0,0))

    parent:addChild(ccProgressTimer)
    return ccProgressTimer
end
--创建slider
function M.createCCControlSlider(nodeParent, ccBgNode, ccForeNode, ccBtnNode, ccBtnSelectNode)

    ccBgNode = M.createSprite(ccBgNode)
    
    ccForeNode = M.createSprite(ccForeNode)

    ccBtnNode = M.createSprite(ccBtnNode)

    if not ccBtnSelectNode then
        ccBtnSelectNode = display.newSprite(ccBtnNode:getSpriteFrame())
        ccBtnSelectNode:setColor(cc.c3b(166,166,166))
    end

    local ccSlider = cc.ControlSlider:create(ccBgNode, ccForeNode, ccBtnNode,ccBtnSelectNode)
    ccSlider:setMinimumValue(0.0)
    ccSlider:setMaximumValue(100.0)
    ccSlider:setAnchorPoint(cc.p(0,0))

    ccSlider:registerControlEventHandler(function()
        if ccSlider.fChangedEvent then
            local value = ccSlider:getValue()
            ccSlider.fChangedEvent(value, ccSlider)
        end
    end, cc.CONTROL_EVENTTYPE_VALUE_CHANGED)

    --扩展setChangedEvent函数
    ccSlider.setChangedEvent = function(ccSlider, f)
        ccSlider.fChangedEvent = f
    end

    function ccSlider.getForeNode(ccSlider)
        return ccForeNode
    end

    function ccSlider.getBtnNode(ccSlider)
        return ccBtnNode
    end

    nodeParent:addChild(ccSlider)

    return ccSlider
end
function M.addViewListScrollBar( viewlist ,direction)
    local unitNum = #viewlist:getTlCcNode()
    if unitNum==0 then
        if viewlist.dragProgress then
            viewlist.dragProgress:setVisible(false)
        end
        return
    end
    local unitSize = viewlist:getTlCcNode()[1]:getContentSize()
    local scrollSize = {width = unitSize.width*unitNum,height = unitSize.height*unitNum}
    local viewSize = viewlist:getContentSize()
    local minShowNum = math.floor(viewSize.height/unitSize.height)
    if 'h' == direction then
        minShowNum = math.floor(viewSize.width/unitSize.width)
    end
    --少于最少显示个数不显示
    if minShowNum>=unitNum then
        if viewlist.dragProgress then
            viewlist.dragProgress:setVisible(false)
        end
        return
    end
    
    local barSize = cc.size(4,viewSize.height)
    if 'h' == direction then
        barSize = cc.size(viewSize.width,4)
    end
    local cellSize =  cc.size(4,viewSize.height/scrollSize.height*barSize.height)
    if 'h' == direction then
       cellSize = cc.size(viewSize.width/scrollSize.width*barSize.width,4)
    end
    local DragSpr = nil
    if not viewlist.dragProgress then
        viewlist.dragProgress = display.newScale9Sprite("img_scale9_jindu_gray.png")
        viewlist:addChild(viewlist.dragProgress)
        viewlist.DragSpr = display.newScale9Sprite("img_scale9_jindu_white.png")
        viewlist.dragProgress:addChild(viewlist.DragSpr)
        viewlist.dragProgress:setContentSize(barSize)
        viewlist.dragProgress:setAnchorPoint(cc.p(1,0.5))
        viewlist.dragProgress:setPosition(viewSize.width+8,viewSize.height*0.5)    
        viewlist.dragProgress:setVisible(true)       
        viewlist.DragSpr:setContentSize(cellSize)
        viewlist.DragSpr:setAnchorPoint(cc.p(0,1))
        viewlist.DragSpr:setPosition(0,viewlist.dragProgress:getContentSize().height)    
        if 'h' == direction then
            viewlist.dragProgress:setAnchorPoint(cc.p(0.5,1))
            viewlist.dragProgress:setPosition(viewSize.width*0.5,-2)
            viewlist.DragSpr:setAnchorPoint(cc.p(0,0))
            viewlist.DragSpr:setPosition(0,0)
        end
        local scrollViewDidScroll = function ( view )
            if 'h' == direction then
                local x = -viewlist:getScrollView():getContentOffset().x
                if x>=scrollSize.width-barSize.width then
                    x = scrollSize.width-barSize.width
                end
                if x<=0 then
                    x = 0
                end
                viewlist.DragSpr:setPositionX((barSize.width-cellSize.width)/(scrollSize.width-barSize.width)*x)
            else
                local y = -viewlist:getScrollView():getContentOffset().y
                if y>=scrollSize.height-barSize.height then
                    y = scrollSize.height-barSize.height
                end
                if y<=0 then
                    y = 0
                end
                viewlist.DragSpr:setPositionY((barSize.height-cellSize.height)/(scrollSize.height-barSize.height)*y+cellSize.height)
            end
            
        end
        viewlist:getScrollView():setDelegate()
        viewlist:getScrollView():registerScriptHandler(scrollViewDidScroll,cc.SCROLLVIEW_SCRIPT_SCROLL)
    else
        viewlist.dragProgress:setContentSize(barSize)
        viewlist.DragSpr:setContentSize(cellSize)
        viewlist.dragProgress:setVisible(true)  
    end        
end
function M.addViewTableScrollBar(viewtable ,direction )
    local unitNum = math.floor(#viewtable.tlUnitData/viewtable.unit)
    if unitNum==0 then
        if viewtable.dragProgress then
            viewtable.dragProgress:setVisible(false)
        end
        return
    end
    local unitSize = viewtable.cellSize
    local scrollSize = {width = (unitSize.width*unitNum),height = (unitSize.height*unitNum)}
    local viewSize = viewtable.size
    local minShowNum = math.floor(viewSize.height/unitSize.height)
    if 'h' == direction then
        minShowNum = math.floor(viewSize.width/unitSize.width)
    end
    --少于最少显示个数不显示
    if minShowNum>=unitNum then
        if viewtable.dragProgress then
            viewtable.dragProgress:setVisible(false)
        end
        return
    end
    
    local barSize = cc.size(4,viewSize.height)
    if 'h' == direction then
        barSize = cc.size(viewSize.width,4)
    end
    local cellSize =  cc.size(4,math.floor(viewSize.height/scrollSize.height*barSize.height))
    if 'h' == direction then
       cellSize = cc.size(math.floor(viewSize.width/scrollSize.width*barSize.width),4)
    end
    if not viewtable.dragProgress then
        viewtable.dragProgress = display.newScale9Sprite("img_scale9_jindu_gray.png")
        viewtable:getParent():addChild(viewtable.dragProgress,3)
        viewtable.DragSpr = display.newScale9Sprite("img_scale9_jindu_white.png")
        viewtable.dragProgress:addChild(viewtable.DragSpr)
        viewtable.dragProgress:setContentSize(barSize)
        viewtable.DragSpr:setContentSize(cellSize)
        viewtable.dragProgress:setPosition(viewSize.width,viewSize.height*0.5)
        viewtable.DragSpr:setPosition(0,viewtable.dragProgress:getContentSize().height)
        viewtable.dragProgress:setAnchorPoint(cc.p(1,0.5))
         viewtable.DragSpr:setAnchorPoint(cc.p(0,1))
        if 'h' == direction then
            viewtable.dragProgress:setAnchorPoint(cc.p(0.5,1))
            viewtable.dragProgress:setPosition(viewSize.width*0.5,-2)
            viewtable.DragSpr:setAnchorPoint(cc.p(0,0))
            viewtable.DragSpr:setPosition(0,0)
        end
        local scrollViewDidScroll = function ( view )
            if 'h' == direction then
                local x = -viewtable:getContentOffset().x
                if x>=scrollSize.width-barSize.width then
                    x = scrollSize.width-barSize.width
                end
                if x<=0 then
                    x = 0
                end
                viewtable.DragSpr:setPositionX((barSize.width-cellSize.width)/(scrollSize.width-barSize.width)*x)
            else
                local y = -viewtable:getContentOffset().y
                if y>=scrollSize.height-barSize.height then
                    y = scrollSize.height-barSize.height
                end
                if y<=0 then
                    y = 0
                end
                viewtable.DragSpr:setPositionY((barSize.height-cellSize.height)/(scrollSize.height-barSize.height)*y+cellSize.height)
            end
            
        end
        viewtable:setScrollViewDidScroll(scrollViewDidScroll)
    else
        viewtable.dragProgress:setContentSize(barSize)
        viewtable.DragSpr:setContentSize(cellSize)
        viewtable.dragProgress:setVisible(true)
    end          
    
    
   
        
    
end
return M