-----------------------------------------------------------------------------------------------  
-- @description 线性布局控件  
-- @author  ny
-- @coryright  蜂鸟工作室
-- @release  2014/9/18
--------------------------------------------------------------------------------------------


local M = class(..., function()
    return display.newNode()
end)

function M:ctor(params)
    self:setAnchorPoint(cc.p(0.5,0.5))
    self:initView()
    self:setData(params)
    self:updateView()
end

function M:setData(params)
    params = params or {}
    self.dir = params.dir or "h"
    self.tlCcNode = params.tlCcNode or {}
    for _, ccNode in ipairs(self.tlCcNode) do
        self:addChild(ccNode)
    end
    self.padding = params.padding or 0
    self.align = params.align or "center" -- up down left right

    self.unit = params.unit or 1
    self.unitPadding = params.unitPadding or 0
end

function M:updateData( params )
    -- body
    self.dir = params.dir or self.dir
    self.padding = params.padding or self.padding
    self.align = params.align or self.align
    self.unit = params.unit or self.unit
    self.unitPadding = params.unitPadding or self.unitPadding

    if params.tlCcNode then
        self:setTlCcNode(params.tlCcNode)
    else
        self:updateView()
    end
end

function M:initView()
end

function M:updateView()
    if self.dir == "h" then
        self:_updateViewH()
    else
        self:_updateViewV()
    end
end

function M:getDir()
    return self.dir
end

function M:setDir(dir, noLayout)
    self.dir = dir
    if noLayout then
        self:updateView()
    end
end

function M:getTlCcNode()
    return self.tlCcNode
end


function M:setTlCcNode(tlCcNode, noLayout)
    for _, ccNode in ipairs(self.tlCcNode) do
        ccNode:removeFromParent()
    end
    self.tlCcNode = tlCcNode or {}

    for _, ccNode in ipairs(self.tlCcNode) do
        self:addChild(ccNode)
    end

    if not noLayout then
        self:updateView()
    end
end

function M:asyncSetTlCcNode(createCellFunc,callBack)
    for _, ccNode in ipairs(self.tlCcNode) do
        ccNode:removeFromParent()
    end

    self.tlCcNode = {}
    if self.asyncLoad then
        self:stopAction(self.asyncLoad)
        self.asyncLoad = nil
    end
    local idx = 1

    self.asyncLoad = self:schedule(function()
        local cell = createCellFunc(idx)
        if not cell then     
            if callBack then
                callBack(idx)
            end          
            self:stopAction(self.asyncLoad)
            self.asyncLoad = nil
            return
        end
        table.insert(self.tlCcNode,cell)
        self:addChild(cell)
        self:updateView()
        if callBack then
            callBack(idx)
        end
        idx = idx + 1
    end,0)
end

function M:addCcNode(ccNode, noLayout) 
    table.insert(self.tlCcNode, ccNode)
    self:addChild(ccNode)
    if not noLayout then
        self:updateView()
    end
end

function M:insertCcNode(ccNode,insertIndex,noLayout)
    table.insert(self.tlCcNode,insertIndex,ccNode)
    self:addChild(ccNode)
    if not noLayout then
        self:updateView()
    end 
end

function M:moveCcNodeTo(index1,index2,noLayout)
    local ds = (index1<index2) and 1 or -1
    for i=index1,index2,ds do
        if i == index2 then
            break
        end
        local temp =self.tlCcNode[i]
        self.tlCcNode[i] = self.tlCcNode[i+ds]
        self.tlCcNode[i+ds]= temp
    end
    if not noLayout then
        self:updateView()
    end 

end

function M:sortCcNode(sortHandler)
    table.sort(self.tlCcNode,function(itemA,itemB)
       return  sortHandler(itemA,itemB)   
    end)
    self:updateView()
end

function M:removeNode(filterHandler,noLayout)
    local length=#self.tlCcNode
    for i=length,1,-1 do
        if filterHandler(self.tlCcNode[i], i) then                               
            self.tlCcNode[i]:removeFromParent()
            table.remove(self.tlCcNode,i)
        end
    end
    if not noLayout then
        self:updateView()
    end
end

--返回 tlTlCcNode, 根据self.unit分割Node
function M:split()
    local index = 0
    local tlTlCcNode = {}
    while true do
        local tlCcNode = {}
        for i=1,self.unit do
            index = index + 1
            if index > #self.tlCcNode then break end
            table.insert(tlCcNode, self.tlCcNode[index])
        end
        if #tlCcNode > 0 then
            table.insert( tlTlCcNode, tlCcNode )
        end
        if index > #self.tlCcNode then break end
    end
    return tlTlCcNode
end

--创建一行
function M:createObjRowH(tlNode, unitPadding)
    
    unitPadding = unitPadding or 0

    local objRow = {}

    local size = cc.size(0,0)
    
    for _, node in ipairs(tlNode) do
        local nodeSize = node:getContentSize()
        size.width = math.max(nodeSize.width, size.width)
        size.height = size.height + nodeSize.height
        if _ < #tlNode then
            size.height = size.height + unitPadding
        end
    end


    function objRow:getSize()
        return size
    end

    function objRow:layout(pos, anchor)
        --位置定位到 
        local pos_new = cc.p(0,0)
        pos_new.x = pos.x - size.width*anchor.x
        pos_new.y = pos.y - size.height*anchor.y
        pos_new.x = pos_new.x + size.width*0.5

        local width = 0

        for _, node in ipairs(tlNode) do
            node:ignoreAnchorPointForPosition(false)
            node:setAnchorPoint(cc.p(0,0.5))
            node:setPosition( width+pos_new.x, pos_new.y )
            width = width + node:getContentSize().width
        end

        local height = 0
        for i=#tlNode,1,-1 do
            local node = tlNode[i]
            node:ignoreAnchorPointForPosition(false)
            node:setAnchorPoint(cc.p(0.5,0))
            node:setPosition(pos_new.x, pos_new.y+height)
            height = height + node:getContentSize().height + unitPadding
        end
    end
    
    return objRow
end

--水平布局
function M:_updateViewH()

    local tlTlCcNode = self:split()

    local tlObjRow = table.map(tlTlCcNode, function(tlCcNode)
        return self:createObjRowH(tlCcNode, self.unitPadding)
    end)

    local contentwidth = 0
    local contentheight = 0
    for index, objRow in ipairs(tlObjRow) do
        local size = objRow:getSize()
        local width,height = size.width, size.height
        if height > contentheight then
            contentheight = height;
        end
        contentwidth = contentwidth + width
        if index < #self.tlCcNode then
            contentwidth = contentwidth + self.padding
        end
    end

    self:setContentSize(cc.size(contentwidth, contentheight))

    local tempPosX = 0
    for index, objRow in ipairs(tlObjRow) do
        local factor = 0.5
        if self.align == "left" or self.align == "down" then
            factor = 0
        elseif self.align == "right" or self.align == "up" then
            factor = 1
        end     

        --计算位置
        local width = objRow:getSize().width
        local anchor = cc.p(0,factor)
        local pos = cc.p(tempPosX, contentheight*factor)
        objRow:layout(pos,anchor)

        tempPosX = tempPosX + (width + self.padding);
    end
end

--创建一列
function M:createObjRowV(tlNode, unitPadding)
    
    unitPadding = unitPadding or 0

    local objRow = {}

    local size = cc.size(0,0)
    
    for _, node in ipairs(tlNode) do
        local nodeSize = node:getContentSize()
        size.height = math.max(nodeSize.height, size.height)
        size.width = size.width + nodeSize.width
        if _ < #tlNode then
            size.width = size.width + unitPadding
        end
    end


    function objRow:getSize()
        return size
    end

    function objRow:layout(pos, anchor)
        --位置定位到 
        local pos_new = cc.p(0,0)
        pos_new.x = pos.x - size.width*anchor.x
        pos_new.y = pos.y - size.height*anchor.y
        pos_new.y = pos_new.y + size.height*0.5

        local width = 0

        for _, node in ipairs(tlNode) do
            node:ignoreAnchorPointForPosition(false)
            node:setAnchorPoint(cc.p(0,0.5))
            node:setPosition( width+pos_new.x, pos_new.y )
            width = width + node:getContentSize().width + unitPadding
        end
    end
    
    return objRow
end

--垂直布局
function M:_updateViewV()
    
    local tlTlCcNode = self:split()

    local tlObjRow = table.map(tlTlCcNode, function(tlCcNode)
        return self:createObjRowV(tlCcNode, self.unitPadding)
    end)


    local contentwidth = 0
    local contentheight = 0
    for index, objRow in ipairs(tlObjRow) do
        local size = objRow:getSize()
        local width,height = size.width, size.height
        if width > contentwidth then
            contentwidth = width;
        end
        contentheight = contentheight + height
        if index < #self.tlCcNode then
            contentheight = contentheight + self.padding
        end
    end

    self:setContentSize(cc.size(contentwidth, contentheight))

    local tempPosY = contentheight;
    for index, objRow in ipairs(tlObjRow) do
        local factor = 0.5
        if self.align == "left" or self.align == "down" then
            factor = 0
        elseif self.align == "right" or self.align == "up" then
            factor = 1
        end
        --计算grid的位置
        local height = objRow:getSize().height      

        local anchor = cc.p(factor,1)
        local pos = cc.p(contentwidth*factor, tempPosY)
        objRow:layout(pos, anchor)

        tempPosY = tempPosY- (height + self.padding);
    end
end


return M
