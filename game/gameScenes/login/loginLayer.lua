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
    
    local videwList = UICommon.createViewList(self, true, "h",10)
    -- videwList:setPosition(cc.p(100,10))
    UICommon.createSwitchList(tlNode)
    videwList:setTlCcNode(tlNode)
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
