-----------------------------------------------------------------------------------------------  
-- @description 世界地图
-- @author  郑泽森
-- @coryright  蜂鸟工作室
-- @release  2016/4/1
--------------------------------------------------------------------------------------------
local M = class(...,require("game.gameSceneMgr.GameLayer"))
local M_ZORDER_MENU = 4
local M_ZORDER_EFF = 3
local M_ZORDER_WORLD = 2
local M_ZORDER_GESTURE = 1
local _mapLoader = import(".MapLoader").getInstance()
local ComponentJoytick = import(".ComponentJoytick")

function M:ctor(params)
    -- display.addSpriteFrames("uires/public/world/plist_world_map_groud1.plist", "uires/public/world/plist_world_map_groud1.png")
    -- display.addSpriteFrames("uires/public/world/plist_world_map_groud2.plist", "uires/public/world/plist_world_map_groud2.png")
    display.addSpriteFrames("uires/public/world/plist_world_map_surface.plist", "uires/public/world/plist_world_map_surface.png")
    display.addSpriteFrames("uires/public/world/plist_world_map_resource.plist", "uires/public/world/plist_world_map_resource.png")
    display.addSpriteFrames("uires/public/world/plist_world_map_edge.plist", "uires/public/world/plist_world_map_edge.png")
    display.addSpriteFrames("uires/effect/ui/worldTree/plist_ui_effect_worldTree.plist", "uires/effect/ui/worldTree/plist_ui_effect_worldTree.png")
    display.addSpriteFrames("uires/effect/ui/worldTree2/plist_ui_effect_worldTree2.plist", "uires/effect/ui/worldTree2/plist_ui_effect_worldTree2.png")
    -- display.addSpriteFrames("uires/effect/ui/worldTree2/plist_ui_effect_worldTree3.plist", "uires/effect/ui/worldTree2/plist_ui_effect_worldTree3.png")
    -- display.addSpriteFrames("uires/effect/ui/worldTree2/plist_ui_effect_worldTree4.plist", "uires/effect/ui/worldTree2/plist_ui_effect_worldTree4.png")
    -- display.addSpriteFrames("uires/effect/ui/worldTree2/plist_ui_effect_worldTree5.plist", "uires/effect/ui/worldTree2/plist_ui_effect_worldTree5.png")
    display.addSpriteFrames("uires/effect/ui/clouds/plist_ui_effect_clouds.plist","uires/effect/ui/clouds/plist_ui_effect_clouds.png")
    display.addSpriteFrames("uires/public/world/plist_ui_plist_world.plist", "uires/public/world/plist_ui_plist_world.png")
    -- M.super.ctor(self)
    -- self:initData(params)
end

function M:initData(params)
    self.viewWorld = nil
    self.viewDistanceMark=nil
end

function M:getTlInitView()
    local ret={
        function()
            -- 世界地图
            self.viewWorld = require("game.gameScenes.world.ViewWorld").new()
            self.ccScrollView = cc.ScrollView:create(display.size,self.viewWorld )
            self.ccScrollView:setAnchorPoint(cc.p(0.5, 0.5))
            self.ccScrollView:setScale(1)
            self.ccScrollView:setMaxScale(1)
            self.ccScrollView:setMinScale(0.7)
            self:addChild(self.ccScrollView,M_ZORDER_WORLD)
            self.ccScrollView:setZoomScaleInDuration(0.7,0.5)
            -- 设置弹回false
            self.ccScrollView:setBounceable(true)
            self.ccScrollView:setDelegate()
            -- self.ccScrollView:setMovable(false)
            -- 监听滚动事件
            self.ccScrollView:registerScriptHandler(
                function(view)
                    self:onScroll(view)
                end
                , cc.SCROLLVIEW_SCRIPT_SCROLL)
            
            ScriptHandlerMgr:getInstance():registerScriptHandler(self.ccScrollView,
                function() 
                    -- self.viewWorld:reqGridCity()
                end,
                cc.Handler.CALLFUNC)
            -- self:onScroll(self.ccScrollView)
        end,
    }
    return ret
end
function M:getTlOnEnter(  )
    return {
    function (  )
        self:moveToCenterByRC(340,300)
    end
}
    
end

function M:onScroll(view)
    self.viewWorld:updateWorld()
    
    local center_pos = self.viewWorld:convertToNodeSpace(cc.p(display.width*0.5,display.height*0.5))
    local r,c = _mapLoader:pointToRC(center_pos.x,center_pos.y)

    if _mapLoader:isOutside(r,c) then
        r = math.max(r,0)
        r = math.min(r,_mapLoader.mw-1)
        c = math.max(c,0)
        c = math.min(c,_mapLoader.mh-1)
        self:moveToCenterByRC(r,c,false,0.3)
        self.ccScrollView:setMovable(false)
        self:performWithDelay(function()
            self.ccScrollView:setMovable(true)
        end,0.3)
    end
end

-- 移动到grid行，列锚点为中心点
function M:moveToCenterByRC(r,c)
    local x,y = _mapLoader:RCToCenterPoint(r, c)
    self:moveToCenterByPoint(x, y)
end

-- 移动到像素坐标为中心点
function M:moveToCenterByPoint(x,y)
    local offsetX = math.max(x-display.width/2,0)
    local offsetY = math.max(y-display.height/2,0)
    self.ccScrollView:setContentOffset(cc.p(-offsetX,-offsetY))
    -- self.viewWorld :reqGridCity()
end

-- 移动x,y个像素
function M:moveByOffset(offset_x,offset_y)
    local offset =  self.ccScrollView:getContentOffset()
    local x = offset.x - offset_x 
    local y = offset.y - offset_y 

    self.ccScrollView:setContentOffset(cc.p(x,y))
end

function M:getViewWorld()
    return self.viewWorld 
end

function M:onTouch(event,x,y)
    if event == "began" then
        self.touchBegan=cc.p(x,y)
        self.isTouchEnd=true
        return true
    elseif event=="moved" then
        if self.isTouchEnd then  
            local dist = cc.pGetDistance(self.touchBegan, {x=x,y=y})
            if dist >= 10 then
                self.isTouchEnd = false
            end            
        end
    elseif event=="ended" then
        if self.isTouchEnd then
            self.viewWorld:onClick(x, y)
        end
    end
end

return M