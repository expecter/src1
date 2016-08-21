-----------------------------------------------------------------------------------------------  
-- @description 可滚动列表View
-- @author  ny
-- @coryright  蜂鸟工作室
-- @release  2015/4/14
--------------------------------------------------------------------------------------------
local ViewLinearLayout = import(".ViewLinearLayout")
local M = class(..., function()
    return display.newNode()
end)
--附加参数
function M:ctor(params)
    assert(params and params.size)
    
    --线性布局
    self.viewLinearLayout = ViewLinearLayout.new(params)
    self.viewLinearLayout:setAnchorPoint(cc.p(0,0))

    --scrollview
    local dir = self.viewLinearLayout:getDir()
    self.ccScrollView = cc.ScrollView:create(params.size, self.viewLinearLayout)
    if dir == "h" then
        self.ccScrollView:setDirection(cc.SCROLLVIEW_DIRECTION_HORIZONTAL)
    else
        self.ccScrollView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
        -- self.ccScrollView:setContentOffset(cc.p(0,params.size.height))
        self.ccScrollView:setContentOffset(cc.p(
            0,
            math.max(params.size.height-self.viewLinearLayout:getContentSize().height, 0)
        ))
    end

    self.dir = dir

    --自己
    self:setContentSize(params.size)
    self:setAnchorPoint(cc.p(0.5,0.5))
    self:addChild(self.ccScrollView,2)

    --点击层
    local layer = display.newLayer() 
    layer:addTouchEventListener( handler(self, self.onTouch), false, false)
    layer:setTouchEnabled(true)
    layer:setVisible(false)
    self:addChild(layer,1)
end
function M:setViewSize(size)
    self:setContentSize(size)
    self.ccScrollView:setViewSize(size)
end
function M:setScrollToNext(params)
    self.isScrollToNext_=true
    self.scrollIndex_=1
    self.ccScrollView:setBounceable(false)
    self.touchE=nil
    self.touchB=nil
    self.tlCcNodeCount=0
    self.scrollLenght=params.length
    self.getScrollIndex=params.callback
    self.ccScrollView:setDelegate()
    self.ccScrollView:setMovable(false)
end

function M:updateData( params )
    -- body
    self.viewLinearLayout:updateData(params)
end

function M:scorllToNextPage()
    local offset=self.ccScrollView:getContentOffset()
    self.ccScrollView:getContainer():stopAllActions()
    local time=0.5
    if self.dir=="h" then
        self.ccScrollView:setContentOffsetInDuration(cc.p(-(self.scrollIndex_-1)*self.scrollLenght,offset.y), time)
    else
        self.ccScrollView:setContentOffsetInDuration(cc.p(offset.x,-(self.scrollIndex_-1)*self.scrollLenght), time)
    end
    if self.getScrollIndex then
        self.getScrollIndex(self.scrollIndex_)
    end    

end

function M:scrollToPage( page )
    if page<1 or page>#self.viewLinearLayout:getTlCcNode() then
            return
        end
    self.scrollIndex_=page
    self:scorllToNextPage()
end
--逐个进入
function M:moveInOneByOne(moveTime,intervalTime)
    moveTime = moveTime or 0.2
    intervalTime = intervalTime or 0.1
    local nodeList = self:getTlCcNode()
    local posList = {}

    for k,v in pairs(nodeList) do
        local x,y = v:getPosition()
        local size = v:getContentSize()
        posList[k] = { x = x,y = y}
        v:setPosition(-1000,y)
    end
    local idx = 1
    local helper = function()
        local node = nodeList[idx]
        if tolua.isnull(node) then
            self:stopAction(self.scheduler_cd) 
            return
        end
        local sequence = transition.sequence({
            cc.MoveTo:create(moveTime, cc.p(posList[idx].x,posList[idx].y )),    
        })
        node:runAction(sequence)
        idx = idx + 1
    end
    if not self.scheduler_cd then
        self.scheduler_cd = self:schedule(helper,intervalTime)
    end
end
   

--获取滚动框
function M:getScrollView()
    return self.ccScrollView
end


--重设列表
function M:setTlCcNode(tlCcNode, noResetPos)
    self.viewLinearLayout:setTlCcNode(tlCcNode)
    self.scrollIndex_=1
    if not noResetPos then
        self:moveToTop()
    end
end

function M:asyncSetTlCcNode(createCellFunc,noResetPos)

    local callBack = function()
        if not noResetPos then
            self:moveToTop()
        end
    end
    self.viewLinearLayout:asyncSetTlCcNode(createCellFunc,callBack)
end
--重设列表
function M:setTlCcNodeWithoutMove(tlCcNode)
    self.viewLinearLayout:setTlCcNode(tlCcNode)
end

--获取列表
function M:getTlCcNode()
    return self.viewLinearLayout:getTlCcNode()
end

--添加一个节点
function M:addCcNode(ccNode, noLayout)
    if self.dir == "v" then
        local offset = self.ccScrollView:getContentOffset()
        local height_orig = self.viewLinearLayout:getContentSize().height
        self.viewLinearLayout:addCcNode(ccNode, noLayout)
        local height_now = self.viewLinearLayout:getContentSize().height
        local diff = height_now - height_orig
        offset.y = offset.y - diff
        self.ccScrollView:setContentOffset(offset)
    else
        self.viewLinearLayout:addCcNode(ccNode, noLayout)
    end
end

--
function M:sortCcNode(sortHandler)
    if self.dir == "v" then
        local offset = self.ccScrollView:getContentOffset()
        local height_orig = self.viewLinearLayout:getContentSize().height
        self.viewLinearLayout:sortCcNode(sortHandler)
        local height_now = self.viewLinearLayout:getContentSize().height
        local diff = height_now - height_orig
        offset.y = offset.y - diff
        self.ccScrollView:setContentOffset(offset)
    else
        self.viewLinearLayout:sortCcNode(sortHandler)
    end
end

--插入一个节点
function M:insertCcNode(ccNode,insertIndex,noLayout)
    if self.dir == "v" then
        local offset = self.ccScrollView:getContentOffset()
        local height_orig = self.viewLinearLayout:getContentSize().height
        self.viewLinearLayout:insertCcNode(ccNode,insertIndex,noLayout)
        local height_now = self.viewLinearLayout:getContentSize().height
        local diff = height_now - height_orig
        offset.y = offset.y - diff
        self.ccScrollView:setContentOffset(offset)
    else
        self.viewLinearLayout:insertCcNode(ccNode,insertIndex,noLayout)
    end
end

--移到一个节点 从index1 位置到 index2位置
function M:moveCcNodeTo(index1,index2,noLayout)
   if self.dir == "v" then
        local offset = self.ccScrollView:getContentOffset()
        local height_orig = self.viewLinearLayout:getContentSize().height
        self.viewLinearLayout:moveCcNodeTo(index1,index2,noLayout)
        local height_now = self.viewLinearLayout:getContentSize().height
        local diff = height_now - height_orig
        offset.y = offset.y - diff
        self.ccScrollView:setContentOffset(offset)
    else
        self.viewLinearLayout:moveCcNodeTo(index1,index2,noLayout)
    end
end

function M:removeNode(filterHandler,noLayout)
    
    self.viewLinearLayout:removeNode(filterHandler,noLayout)
    if not noLayout then
        self:fixContentOffset()
    end
end

--移动到最上 or 最左
function M:moveToTop(time)
    self:moveItemTo(nil,nil,time)
end

--移动到最底 or 最右
function M:moveToBottom(time)
    self:moveItemTo(#self.viewLinearLayout:getTlCcNode(), 1, time)
end

--移动某一item到列表的某一位置, ratio == 0 则为最左(上), ratio = 1 则为最右(下)
function M:moveItemTo(itemIndex, ratio, time)
    itemIndex = math.floor(tonumber(itemIndex or 1))
    ratio = tonumber(ratio or 0)
    -- 处理参数
    if ratio < 0 or ratio > 1 then ratio = 0 end
    local tlCcNode = self.viewLinearLayout:getTlCcNode()
    if not next(tlCcNode) then return end
    local ccNode = tlCcNode[itemIndex]
    if not ccNode then ccNode = tlCcNode[1] end

    -- 计算偏移量
    local viewSize = self.ccScrollView:getViewSize()
    local offset = self.ccScrollView:getContentOffset()
    local minOffset = self.ccScrollView:minContainerOffset()
    local maxOffset = self.ccScrollView:maxContainerOffset()
    -- local x,y = ccNode:getPosition()
    -- 以node的左上为基准
    local size = ccNode:getContentSize()
    local point = cc.pSub(cc.p(ccNode:getPosition()), ccNode:getAnchorPointInPoints())
    point = cc.pAdd(point,cc.p(0, size.height))
    

    if self.dir == "h" then -- 水平
        offset.x = (viewSize.width-size.width) * ratio - point.x
        offset.x = math.max(offset.x, minOffset.x)
        offset.x = math.min(offset.x, maxOffset.x)
    else -- 垂直
        --offset.y = (viewSize.height - (viewSize.height-size.height) * ratio) - math.abs(point.y)
        offset.y = viewSize.height - point.y - (viewSize.height-size.height) * ratio
        offset.y = math.min(offset.y, maxOffset.y)
        offset.y = math.max(offset.y, minOffset.y)
    end

    if time == nil or time == 0 then
        self.ccScrollView:setContentOffset(offset)
    else
        self.ccScrollView:setContentOffsetInDuration(offset, time)
    end
end

--修正位置
function M:fixContentOffset()
    
    local offset = self.ccScrollView:getContentOffset()

    local minOffset = self.ccScrollView:minContainerOffset()
    local maxOffset = self.ccScrollView:maxContainerOffset()

     if self.dir == "h" then -- 水平
        offset.x = math.max(offset.x, minOffset.x)
        offset.x = math.min(offset.x, maxOffset.x)
    else -- 垂直
        offset.y = math.min(offset.y, maxOffset.y)
        offset.y = math.max(offset.y, minOffset.y)
    end

    self.ccScrollView:setContentOffset(offset)
end

--设置点击回调
--回调参数 fClickeEvent(item, index)
function M:setClickedEvent(fClickedEvent)
    self.fClickeEvent = fClickedEvent
end

--更新列表
function M:updateView()
    self.viewLinearLayout:updateView() 
    self:fixContentOffset()
end
function M:onTouch(event, x, y)
    --不可见 直接返回
    local visiblehelper
    visiblehelper = function(node)
        if node == nil then return true end
        if not node:isVisible() then return false end
        local parent = node:getParent()
        return visiblehelper(parent)
    end
    if not visiblehelper(self) then return end

    --触摸分发
    if event == "began" then
        local pos = self:getParent():convertToNodeSpace({x=x,y=y})
        if not cc.rectContainsPoint(self:getBoundingBox(),pos) then return false end
        self.touchB={x=x,y=y}
        self._ccPosTouchBegin = {x=x,y=y}
        self._timeTouchBegin = os.time()
        return true
    elseif event =="moved" then
        if self._ccPosTouchBegin then
            local dist = cc.pGetDistance(self._ccPosTouchBegin, {x=x,y=y})
            if dist >= 10 then
                self._ccPosTouchBegin = nil
            end
        end
        local x,y = self.viewLinearLayout:getPosition()
    elseif event == "ended" then
        if self._ccPosTouchBegin and os.time() - self._timeTouchBegin <= 1 then
            self:onClick(x,y)
        end
        self.touchE={x=x,y=y}
        if self.isScrollToNext_ then
            if cc.pGetDistance(self.touchE, self.touchB)>10  then
                if self.touchE.x>self.touchB.x then
                    self.scrollIndex_=self.scrollIndex_-1
                else
                    self.scrollIndex_=self.scrollIndex_+1
                end
                if self.scrollIndex_<1 then
                    self.scrollIndex_=1
                end
                if self.scrollIndex_>#self.viewLinearLayout:getTlCcNode() then
                    self.scrollIndex_=#self.viewLinearLayout:getTlCcNode()
                end
            end
            self:scorllToNextPage()
        end
        self._ccPosTouchBegin = nil

        
    end
end


function M:onClick(x,y)
    local fClickeEvent = self.fClickeEvent

    if not fClickeEvent then return end

    local tlCcNode = self.viewLinearLayout:getTlCcNode()
    for index, ccNode in ipairs(tlCcNode) do
        local pos = ccNode:convertToNodeSpace(cc.p(x,y))
        local size = ccNode:getContentSize()
        
        if pos.x > 0 and pos.y > 0 and pos.x < size.width and pos.y < size.height then
            fClickeEvent(ccNode, index, x, y)

            break
        end
    end

end


return M
