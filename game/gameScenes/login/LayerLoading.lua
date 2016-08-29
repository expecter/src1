-----------------------------------------------------------------------------------------------
-- @description Loading界面
-- @author  LittleWhite
-- @coryright  蜂鸟工作室
-- @release  2015/12/1
--------------------------------------------------------------------------------------------

local scheduler = require("framework.scheduler")
local M = class(..., require("game.gameSceneMgr.GameLayer"))

function M:ctor(fCallback)
    self.super.ctor(self)
	self.fCallback = fCallback
	self:initView()
end

function M:initCCMember()
    local label = display.newTTFLabel{
            text = "loading...",
            size = 30,
        }
    label:setPosition(display.cx,display.cy)
    self:addChild(label)
end

function M:initView()
    self:initCCMember()
    self:preLoadGameData()
end

function M:onEnterTransitionFinish()
    self:preLoadGameData()
end

function M:preLoadGameData()
    
    local funcList = {}

    funcList[#funcList+1] = function() 
        printInfo("加载流程：预加载纹理")
        local cor = coroutine.running()
        self:performWithDelay(function()
            display.addSpriteFrames("uimap/world/img/plist_world_map_groud1.plist", "uimap/world/img/plist_world_map_groud1.png")
            display.addSpriteFrames("uimap/world/img/plist_world_map_groud2.plist", "uimap/world/img/plist_world_map_groud2.png")
            display.addSpriteFrames("uimap/world/img/plist_world_map_surface.plist", "uimap/world/img/plist_world_map_surface.png")
            display.addSpriteFrames("uimap/world/img/plist_world_map_edge.plist", "uimap/world/img/plist_world_map_edge.png")
            display.addSpriteFrames("uires/effect/ui/worldTree/plist_ui_effect_worldTree.plist", "uires/effect/ui/worldTree/plist_ui_effect_worldTree.png")
            display.addSpriteFrames("uires/effect/ui/worldTree2/plist_ui_effect_worldTree2.plist", "uires/effect/ui/worldTree2/plist_ui_effect_worldTree2.png")
            display.addSpriteFrames("uires/effect/ui/clouds/plist_ui_effect_clouds.plist","uires/effect/ui/clouds/plist_ui_effect_clouds.png")
            coroutine.resume(cor)
        end,0)
        coroutine.yield()
    end

    funcList[#funcList+1] = function() 
        printInfo("加载流程： 地图数据")
        local cor = coroutine.running()
        self:performWithDelay(function()
            require("game.gameScenes.world.MapLoader").getInstance()
            coroutine.resume(cor)
        end,0)
        coroutine.yield()
    end

    local cor 
    cor = coroutine.create(function()
        --各个加载步骤
        for index, func in ipairs(funcList) do
            func()
        end

        --加载结束，进入游戏
        if self.fCallback then
            self.fCallback()
        end
    end)
    coroutine.resume(cor)
end

return M