local M = class(..., require("game.gameSceneMgr.GameLayer"))
local map = require("game.config.Login")
local socket = require "socket"
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
    -- local node = GameNode.new({DrawComponent = {}})
    -- node:setContentSize(320, 280)
    -- node:setAnchorPoint(cc.p(0.5,0.5))
    -- node:setPosition(cc.p(160,display.cy))
    -- node:updateView()
    -- self:addChild(node,2)
    dump(map)
    self:createLayer(map,self)
    -- node:dispatch("haha")
    -- local orgNode = nil
    -- local orgCmdX = nil
    -- local viewtable = UICommon.createViewTable(node,"v",2,70,function ( viewTableUnit, unitData, unitIndex )
    --     if not viewTableUnit.ccNode then
    --         viewTableUnit.ccNode = GameCell.new(unitData)
    --         viewTableUnit:addChild(viewTableUnit.ccNode)
    --         if not orgNode then
    --             viewTableUnit.ccNode:hightlight()
    --             orgNode = viewTableUnit.ccNode
    --             orgCmdX = unitData
    --             self:updateView(unitData)
    --         end
    --     end
    --     if orgCmdX~=unitData then
    --         viewTableUnit.ccNode:normal()
    --     else    
    --         viewTableUnit.ccNode:hightlight()
    --     end
    --     viewTableUnit.ccNode:updateData(unitData)
    --     viewTableUnit.ccNode:updateView()
    -- end,function ( viewTableUnit, unitData, unitIndex, x, y )
    --     if orgNode== viewTableUnit.ccNode then
    --         return
    --     end
    --     orgNode:normal()
    --     orgNode = viewTableUnit.ccNode
    --     orgCmdX = unitData
    --     viewTableUnit.ccNode:hightlight()
    --     self:updateView(unitData)
    --     local panel = require("game.panel.ViewfloatPanel").new()
    --     panel:showPanel()
    -- end)
    -- viewtable:setTlUnitData(ref.hero.getTlRef({}))
    -- self.ViewNode = GameNode.new({DrawComponent = {}})
    -- self.ViewNode:setContentSize(500, 280)
    -- self.ViewNode:setAnchorPoint(cc.p(0.5,0.5))
    -- self.ViewNode:setPosition(cc.p(500,display.cy))
    -- self.ViewNode:updateView()
    -- self:addChild(self.ViewNode,2)
end
function M:createLayer( config,parent )
    local owner = M.createNode(config.component)
    parent:addChild(owner)
    for i,con in ipairs(config.children) do
        local node = M.createNode(con.component)
        owner:addChild(node)
    end

end
function M.createNode( config )
    if config == "sprite" then
        local node = display.newSprite()
        return node
    end
    if config == "label" then
        local node =display.TTFLabel() 
        return node
    end
    local ok,class = pcall(function (  )
        return gameNode[config.ctor]
    end)
    if not ok then
        return nil
    end
    local node = class.new(config.component)
    M.extentCcNode(node,config.cc)
    -- M.extentConfig()
    return node
end
function M.extentCcNode( node,config )
    node:setContentSize(config.contentsize)
    node:setAnchorPoint(config.AnchPos)
    node:setPosition(cc.p(config.pos))
end
-- function M:connect(  )
--     self.tcp = socket.tcp()
--     self.tcp:settimeout(10)
--     local __succ, __status = self.tcp:connect("127.0.0.1",12701,"127.0.0.1",12701)
--     print(__succ,__status)
-- end
-- function M:testView(  )
--     print("AAAAAAAA")
--     local node = display.newRect(cc.rect(100, 100, 40, 40),
--         {fillColor = cc.c4f(0,0,0,1), borderColor = cc.c4f(1,1,1,1), borderWidth = 0.5})
--     self:addChild(node)
-- end
function M:updateView( params )
    -- self:setData(params)
    -- dump(params)
    -- local panel = require("game.panel.ViewfloatPanel").new()
    -- panel:showPanel()
end

return M
