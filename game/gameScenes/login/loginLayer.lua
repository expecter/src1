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
    return {
        function (  )
        end,
    }
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
    self.loader = cc.FNMapLoader:create("pd_tilemap.tmx")

    self.loader:retain()
    self:addChild(self.loader)
end
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
