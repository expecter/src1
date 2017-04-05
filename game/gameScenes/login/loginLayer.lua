local M = class(..., GameLayer)
local ANI_TYPE={
    att="att",
    run="run",
    hit="hit",
    stanby="stanby",
}
function M:ctor()
    
    -- local tbview = {}
    -- self:setData(tbview)
    M.super.ctor(self)
end
function M:setData( params )
    if params then
        self.cmdData = params
    end
end
function M:getTlInitView(  )
    return {
    function (  )
        self:initView()
    end,
}
end
function M:getTlOnEnter(  )
    
end
function M:initView( params )
    self.owner = {}
    -- self:createLayer(map,self)
    -- self.owner.child1:setViewCallback(function ( data )
    --     self.owner.login:switchTo(data.node)
    -- end)
    
    -- self:createGameNode(map)
    local label = display.newTTFLabel{
            text = "loading...",
            size = 30,
        }
        print("initView")
    label:setPosition(display.cx,display.cy)
    self:addChild(label)
end

-- function M:createGameNode( config )
--     local nodeOwner = {}
--     local comOwner = {}
--     local function createNode( data )
--         local node = display.newNode()
--         return node
--     end
--     nodeOwner[config[1].__id__] = createNode(config[1])
--     table.remove(config,1)
--     for i,con in ipairs(config) do
--         local object = nil
--         if con.__type__ == "cc_node" then
--             local node = createNode(con)
--             nodeOwner[con.__id__] = node
--         end        
--     end
-- end
function M:createLayer( config,parent )
    local owner = M.createNode(config)
    if config.name then
        self.owner[config.name] = owner
    end
    parent:addChild(owner)
    -- if config.children then
        for i,con in ipairs(config.children or {}) do
            self:createLayer(con,owner)
        end
    -- end
end
function M.createNode( config )
    if config.ctor == "sprite" then
        local node = display.newSprite("star.png")
        M.extentCcNode(node,config.cc)
        return node
    end
    if config.ctor == "label" then
        local node =display.newTTFLabel({text = "loading...",
            size = 30,})
        M.extentCcNode(node,config.cc)
        return node
    end
    local ok,class = pcall(function (  )
        return node[config.ctor]
    end)
    if not ok then
        return nil
    end
    local node = class.new(config.component)
    M.extentCcNode(node,config.cc)
    GameSceneMgr.loadGameNode(node)
    return node
end
function M.extentCcNode( node,config )
    node:setContentSize(config.contentsize)
    node:setAnchorPoint(config.AnchPos)
    node:setPosition(cc.p(config.pos))
end
function M:createModelList(  )
    local tlData = {{name = "步兵",tag = 10001},{name = "弓兵",tag = 10101},{name = "骑兵",tag = 10201},{name = "器械",tag = 10302}}
    local tlNode = {}
    for k,v in pairs(tlData) do
        table.insert(tlNode,GameCell.new({owner = v}))
    end
    local viewlist = UICommon.createViewList(self)
    viewlist:setTlCcNode(tlNode)
    viewlist:setPosition(60,550)
    UICommon.createSwitchList(viewlist,function ( index )
        self.armyData_ = ref.army.getRef{refId=tlData[index].tag}
        FightMgr.initFightNpcPlist(self.armyData_.ani)        
        if not self.soldiersSprite then
            local fileName=FightAnimationMgr.getSoldiersSpriteFile(self.armyData_.ani,ANI_TYPE.stanby)
            self.soldiersSprite=display.newSprite("#"..fileName)
            self.soldiersSprite:setAnchorPoint(cc.p(0.5,0))
            self.soldiersSprite:setPosition(display.cx,200)
            self:addChild(self.soldiersSprite)
        end
        self:playStandbAnimate()
    end,1)
end
function M:createActionList(  )    
    local tlData = {{name = "站立",tag = "playStandbAnimate"},{name = "跑动",tag = "playRunAnimate"},{name = "攻击",tag = "playAttAnimate"},{name = "受伤",tag = "playHitAnimate"}}
    local tlNode = {}
    for k,v in pairs(tlData) do
        table.insert(tlNode,GameCell.new({owner = v}))
    end
    local viewlist = UICommon.createViewList(self)
    viewlist:setTlCcNode(tlNode)
    viewlist:setPosition(60,480)
    UICommon.createSwitchList(viewlist,function ( index )
        self[tlData[index].tag](self)
    end,1)
end
function M:playStandbAnimate( time )
    local callback=function ()
        self.soldiersSprite:stopAllActions()
        local animation=FightAnimationMgr.getSoldiersAni(self.armyData_.ani,ANI_TYPE.stanby,self.isAtt)
        local action=cc.RepeatForever:create(cc.Animate:create(animation))
        self.soldiersSprite:runAction(action)
    end
    local t=time or 0.01
    FightAnimationMgr.runCCCallFunc(callback,t,self)
end
function M:playAttAnimate(  )
    self.soldiersSprite:stopAllActions()
    local animation,time=FightAnimationMgr.getSoldiersAni(self.armyData_.ani,ANI_TYPE.att,self.isAtt)
    local action=cc.Animate:create(animation)
    self.soldiersSprite:runAction(action)
    print("playAttAnimate")
    self:playStandbAnimate(time)
end
function M:playRunAnimate(  )
    self.soldiersSprite:stopAllActions()
    local animation=FightAnimationMgr.getSoldiersAni(self.armyData_.ani,ANI_TYPE.run,self.isAtt)
    local action=cc.RepeatForever:create(cc.Animate:create(animation))
    self.soldiersSprite:runAction(action)
end
--播放受攻击动画
function M:playHitAnimate()
    FightAnimationMgr.setHitColor(self,self.soldiersSprite)
    return 0.01
end
function M:onTouch( event,x,y )
    -- print("AAAAAAAA",event,x,y)
    -- if event == "began" then
    --     return true
    -- elseif event =="moved" then
    -- elseif event =="ended" then
    -- end
    -- return false
    -- self.owner.login:setPosition(x,y)
    -- self.owner.login:updateView()
    
    return true
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
