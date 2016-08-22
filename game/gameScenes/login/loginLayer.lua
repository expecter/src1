local M = class(..., require("game.gameSceneMgr.GameLayer"))
function M:ctor()
    
    local tbview = {}
    self:setData(tbview)
    -- self:updateView()
    M.super.ctor(self)
end
function M:setData( params )
    if params then
        self.cmdData = params
    end
end

function M:initView( params )
    self.label = display.newTTFLabel{text="哈哈",size=30}
    self:addChild(self.label,1)
    self.label:setPosition(cc.p(display.cx,display.cy))
    self.label:enableShadow(cc.c4b(0,100,0,255),cc.size(2,2))
    self.label:enableOutline(cc.c4b(0,100,0,255),5)
    local tlNode = {}
    for i=1,5 do
        local GameNode = GameCell.new({})
        GameNode:updateView()
        table.insert(tlNode,GameNode)
    end
    
    -- local videwList = UICommon.createViewList(self, true, "h",10)
    -- -- videwList:setPosition(cc.p(100,10))
    -- UICommon.createSwitchList(tlNode)
    -- videwList:setTlCcNode(tlNode)
    -- -- dump(ref.hero.getTlRef({}))
    local node = GameNode.new({DrawComponent = {}})
    node:setContentSize(500, 280)
    node:setAnchorPoint(cc.p(0.5,0.5))
    node:setPosition(cc.p(display.cx,display.cy))
    node:updateView()
    self:addChild(node,2)
    local orgNode = nil
    local orgCmdX = nil
    local viewtable = UICommon.createViewTable(node,"v",3,70,function ( viewTableUnit, unitData, unitIndex )
        if not viewTableUnit.ccNode then
            viewTableUnit.ccNode = GameCell.new(unitData)
            viewTableUnit:addChild(viewTableUnit.ccNode)
            if not orgNode then
                viewTableUnit.ccNode:hightlight()
                orgNode = viewTableUnit.ccNode
                orgCmdX = unitData
            end
        end
        if orgCmdX~=unitData then
            viewTableUnit.ccNode:normal()
        else    
            viewTableUnit.ccNode:hightlight()
        end
        viewTableUnit.ccNode:updateData(unitData)
        viewTableUnit.ccNode:updateView()
    end,function ( viewTableUnit, unitData, unitIndex, x, y )
        if orgNode== viewTableUnit.ccNode then
            return
        end
        orgNode:normal()
        orgNode = viewTableUnit.ccNode
        orgCmdX = unitData
        viewTableUnit.ccNode:hightlight()
    end)
    viewtable:setTlUnitData(ref.hero.getTlRef({}))

end
-- function M:testView(  )
--     print("AAAAAAAA")
--     local node = display.newRect(cc.rect(100, 100, 40, 40),
--         {fillColor = cc.c4f(0,0,0,1), borderColor = cc.c4f(1,1,1,1), borderWidth = 0.5})
--     self:addChild(node)
-- end
function M:updateView( params )
    -- self:setData(params)
end

return M
