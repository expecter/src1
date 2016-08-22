-----------------------------------------------------------------------------------------------  
-- @description LuaTableView缝扎un个
-- @author  宁榆
-- @coryright  蜂鸟工作室
-- @release  2015/7/15

--[[ 
    例子
 local ViewTable = require("game.gameScenes.commonview.ViewTable")

    local viewTable = ViewTable.new{
        size = cc.size(100,200),
        dir = "v",
        unit = 2,
        unitLength = 30,
        unitUpdateEvent = function(viewTableUnit, unitData, unitIndex)
            if not viewTableUnit.ccNode then
                iewTableUnit.ccNode = CCBREader.load()
                viewTableUnit.label = display.newTTFLabel()
                local size = viewTableUnit:getContentSize()
                viewTableUnit.label:setPosition(size.width*0.5, size.height*0.5)
                viewTableUnit:addChild(viewTableUnit.label)
            end

            viewTableUnit.label:setString(tostring(unitData))
        end
    }
    local tlUnitData = {
        1,
        2,
        3,
        4,
        5,
    }

    viewTable:setTlUnitData(tlUnitData)
--]]

--------------------------------------------------------------------------------------------

local M = class(..., function(params)
    return cc.TableView:create(params.size)
end)

--创建一个unit, 一个unit对应 一组unitData
function M:_createViewTableUnit(cellSize, unitIndex)
    
    local viewTableUnit = display.newNode()
    local unit = self.unit

    if self.dir == "h" then
         local y = cellSize.height * (unit-unitIndex) / unit
         viewTableUnit:setContentSize( cc.size( cellSize.width, cellSize.height/unit ) )
         viewTableUnit:setAnchorPoint(cc.p(0,0))
         viewTableUnit:setPosition(0,y)
    else
        local x = cellSize.width * unitIndex/unit
        viewTableUnit:setContentSize( cc.size( cellSize.width/unit, cellSize.height ) )
        viewTableUnit:setAnchorPoint( cc.p(1,0) )
        viewTableUnit:setPosition( x,0 )
    end

    return viewTableUnit

end

--创建一个Cell, 一个cell包含多个unit
function M:_createViewTableCell()
    
    local viewTableCell = cc.TableViewCell:new()

    local tlViewTableUnit  = {}

    local unit = self.unit
    
    --竖直
    local cellSize = nil
    if self.dir == "h" then
        cellSize = cc.size(self.unitLength, self.size.height)
    else
        cellSize = cc.size(self.size.width, self.unitLength)
    end

     for i=1,unit do
         local viewTableUnit = self:_createViewTableUnit(cellSize, i)
         viewTableUnit.viewTableCell = viewTableCell
         viewTableCell:addChild(viewTableUnit)
         tlViewTableUnit[#tlViewTableUnit+1] = viewTableUnit
     end

     function viewTableCell:getTlViewTableUnit()
        return tlViewTableUnit
     end

     return viewTableCell
end

function M:_tableCellAtIndex(table, cellIndex)
    local viewTableCell = table:dequeueCell()
    if nil == viewTableCell then
        viewTableCell = self:_createViewTableCell()
    end

    --更新viewTableCell 的 cellIndex 字段
    viewTableCell.cellIndex = cellIndex

    --更新每个单元
    local unitUpdateEvent = self.unitUpdateEvent
    if unitUpdateEvent then
        local tlViewTableUnit = viewTableCell:getTlViewTableUnit()
        
        for unitIndex_local, viewTableUnit in ipairs(tlViewTableUnit) do
            local unitIndex = cellIndex*self.unit + unitIndex_local
            local unitData = self.tlUnitData[ unitIndex ]
            if unitData then
                viewTableUnit:setVisible(true)
                unitUpdateEvent(viewTableUnit, unitData, unitIndex)
            else
                viewTableUnit:setVisible(false)
            end
        end
    end
    return viewTableCell
end

function M:_numberOfCellsInTableView(table)
    local number = math.ceil(#self.tlUnitData/self.unit)

    return number
end

function M:_cellSizeForTable(table,idx) 
    return self.cellSize.width, self.cellSize.height
end

function M:_tableCellTouched(table,viewTableCell)
    --print(string.format("cell touched at index: %d %d %d" , cell:getIdx(), self._curPos.x, self._curPos.y))
    local cellIndex = viewTableCell.cellIndex
    local tlViewTableUnit = viewTableCell:getTlViewTableUnit()
    
    local pos = viewTableCell:convertToNodeSpace(self._curPos)
    for unitIndex_local, viewTableUnit in ipairs(tlViewTableUnit) do
        if cc.rectContainsPoint( viewTableUnit:getBoundingBox(), pos) then
            if self.unitClickedEvent then
                local unitIndex = cellIndex * self.unit + unitIndex_local
                local unitData = self.tlUnitData[unitIndex]
                if unitData then
					-- AudioUtil.playMusic("audio/sound/sound_click.mp3")
                    self.unitClickedEvent(viewTableUnit, unitData, unitIndex, self._curPos.x, self._curPos.y)
                    break
                end
            end
        end
    end
end

--构造函数
function M:ctor(params)
    assert(params.size, "size 不能为空")
    assert(params.unitLength, "unitLength 不能为空")
    self.size = params.size
    self.dir = params.dir or "h"
    --self.align = params.align or "center" -- up down left right
    self.unit = params.unit or 1
    self.unitLength = params.unitLength   --每个单元的长度, 当dir==h时 代表 width, 当 dir==v时, 代表 height
    self.unitUpdateEvent = params.unitUpdateEvent --更新某一单元的回调
    self.unitClickedEvent = params.unitClickedEvent --点击某单元的回调
    self.tlUnitData = params.tlUnitData or {}
    
    if self.dir == "h" then
        self.cellSize = cc.size(self.unitLength, self.size.height)
    else
        self.cellSize = cc.size(self.size.width, self.unitLength)
    end

    --
    self:ignoreAnchorPointForPosition(false)

    --注册事件
    self:setDelegate()
    if self.dir == "h" then
        self:setDirection(cc.SCROLLVIEW_DIRECTION_HORIZONTAL)
    else
        self:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
        self:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)
    end

    --self:setBounceable(true)

    --注册事件
    self:registerScriptHandler(function(...)
        return self:_tableCellTouched(...)
    end,cc.TABLECELL_TOUCHED)
    self:registerScriptHandler(function(...) 
        return self:_cellSizeForTable(...)
    end,cc.TABLECELL_SIZE_FOR_INDEX)
    self:registerScriptHandler(function(...)
        return self:_tableCellAtIndex(...)
    end, cc.TABLECELL_SIZE_AT_INDEX)
    self:registerScriptHandler(function(...)
        return self:_numberOfCellsInTableView(...)
    end,cc.NUMBER_OF_CELLS_IN_TABLEVIEW)

    --滚动事件
    if params.scrollViewDidScroll then
        self:registerScriptHandler(params.scrollViewDidScroll,cc.SCROLLVIEW_SCRIPT_SCROLL)
    end

    --重新加载数据
    self:reloadData()


    --触摸帮助层, 帮助获取当前点击的坐标点
    self._curPos = {x=0,y=0,}
    local node = display.newLayer() 
    node:setTouchEnabled(true)
    local touchEventId = node:addTouchEventListener(function(event, x, y) 
            self._curPos.x = x or 0
            self._curPos.y = y or 0
            if event == "began" then
                return false
            end
    end, false, false)
    node:setContentSize(self.size)
    node:setAnchorPoint(cc.p(0,0))
    node:setNodeEventEnabled(true)
    node:setTouchEnabled(true)
    self:addChild(node,100)

    
end

--设置数据
function M:setTlUnitData(tlUnitData, ref)
    if ref then
        self.tlUnitData = tlUnitData or {}
    else
        self.tlUnitData = table.map(tlUnitData or {}, function(unitData,index)
            return unitData
        end)
    end
    --重新加载数据
    self:reloadData()

    self:moveUnitTo(1, 0)
end

function M:setTlUnitDataWithoutMove(tlUnitData, ref)
    
    local pos = self:getContentOffset()

    if ref then
        self.tlUnitData = tlUnitData or {}
    else
        self.tlUnitData = table.map(tlUnitData or {}, function(unitData,index)
            return unitData
        end)
    end
    --重新加载数据
    self:reloadData()

    --pos
    self:setContentOffset(pos)

    self:fixContentOffset()
end

--刷新
function M:refresh()
    for unitIndex, unitData in ipairs(self.tlUnitData) do
        self:updateUnitData(unitIndex, unitData)
    end
end

--更新某一项的数据
function M:updateUnitData(unitIndex, unitData)
    
    if not self.tlUnitData[unitIndex] then return end

    self.tlUnitData[unitIndex] = unitData

    local proxyViewTableUnit = self:getProxyViewTableUnit(unitIndex)
    if proxyViewTableUnit.viewTabelUnit then
        if self.unitUpdateEvent then
            self.unitUpdateEvent(proxyViewTableUnit.viewTabelUnit, unitData, unitIndex)
        end
    end
end

--删除数据
function M:removelUnitData(unitIndex)
    table.remove(self.tlUnitData,unitIndex)
    self:reloadData()
end

--获取 ViewTableUnit的代理
-- 返回一个tabel
--   字段 viewTabelCell  viewTableUnit  unitData  unitIndex
function M:getProxyViewTableUnit(unitIndex)
    local unitData = self.tlUnitData[unitIndex]
    local cellIndex = math.ceil(unitIndex/self.unit) - 1
    local unitIndex_local = unitIndex%self.unit
    if unitIndex_local == 0 then unitIndex_local = self.unit end

    local viewTabelCell = self:cellAtIndex(cellIndex)

    local viewTableUnit = nil

    if viewTabelCell then
        local tlViewTableUnit = viewTabelCell:getTlViewTableUnit()
        viewTableUnit = tlViewTableUnit[unitIndex_local]
    end

    return {
        unitData = unitData,
        cellIndex = cellIndex,
        viewTabelCell = viewTabelCell,
        viewTabelUnit = viewTableUnit
    }
end

--修正位置
function M:fixContentOffset(offset)
    
    local offset = self:getContentOffset()

    local minOffset = self:minContainerOffset()
    local maxOffset = self:maxContainerOffset()

     if self.dir == "h" then -- 水平
        offset.x = math.max(offset.x, minOffset.x)
        offset.x = math.min(offset.x, maxOffset.x)
    else -- 垂直
        offset.y = math.min(offset.y, maxOffset.y)
        offset.y = math.max(offset.y, minOffset.y)
    end

    self:setContentOffset(offset)
end

--修正offset的位置
function M:getFixContentOffset(offset)
    local minOffset = self:minContainerOffset()
    local maxOffset = self:maxContainerOffset()

    local fixOffset = cc.p(offset.x,offset.y)
     if self.dir == "h" then -- 水平
        fixOffset.x = math.max(offset.x, minOffset.x)
        fixOffset.x = math.min(offset.x, maxOffset.x)
    else -- 垂直
        fixOffset.y = math.min(offset.y, maxOffset.y)
        fixOffset.y = math.max(offset.y, minOffset.y)
    end
    return fixOffset
end

--是否顶端
function M:isTop()
    
end

--是否底部
function M:isBottom()
end

--移动某一unit到列表的某一位置, ratio == 0 则为最左(上), ratio = 1 则为最右(下)
function M:moveUnitTo(unitIndex, ratio, time)
    
    local unitData = self.tlUnitData[unitIndex]
    local cellIndex = math.ceil(unitIndex/self.unit) - 1
    local unitIndex_local = unitIndex%self.unit
    if unitIndex_local == 0 then unitIndex_local = self.unit end

    local minOffset = self:minContainerOffset()
    local maxOffset = self:maxContainerOffset()

    local offset = self:getContentOffset()

    if self.dir == "h" then
        --unitIndex右端的位置
        local x = cellIndex*self.cellSize.width 
        offset.x = (self.size.width-self.cellSize.width) * ratio - x
    else
        --unitIndex上端的位置
        local containerSize = self:getContainer():getContentSize()
        local y = containerSize.height - cellIndex*self.cellSize.height  --(cellIndex+1)*self.cellSize.height
        offset.y = self.size.height - y - (self.size.height-self.cellSize.height) * ratio
    end

    local offset = self:getFixContentOffset(offset)
    if time == nil or time == 0 then
        self:setContentOffset(offset)
    else
        self:setContentOffsetInDuration(offset, time)
    end
end

--获取一些坐标
function M:getCellIndex(unitIndex)
    local unitData = self.tlUnitData[unitIndex]
    local cellIndex = math.ceil(unitIndex/self.unit) - 1
    local unitIndex_local = unitIndex%self.unit
    if unitIndex_local == 0 then unitIndex_local = self.unit end
    return cellIndex, unitIndex_local
end

function M:setViewSize(size)
    cc.ScrollView.setViewSize(self,size)
    self.size = size
end
function M:setSize(size)
    self:setViewSize(size)
end
return M