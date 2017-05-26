-----------------------------------------------------------------------------------------------  
-- @description 场景管理
-- @author  ny
-- @coryright  蜂鸟工作室
-- @release  2015/4/4
--全局唯一，切换和弹出都可自己监听
------------------------------------------------------------------------------------------
local GamePanelMgr = import(".GamePanelMgr")
local M = class(..., function()
    return display.newScene()
end)

local event = require("framework.cc.components.behavior.EventProtocol").new()
event:bind_(cc(M))
event:exportMethods() 



--创建GameLayerWrap， 一个wrap由一个GameLayer 和 一个gameUI,一个GamePanelMgr 及 topPanelMgr 构成 
local function createGameLayerWrap(gameLayer)
    
    local gameLayerWrap = display.newNode()

    --加入gameLayer
    gameLayerWrap:addChild(gameLayer)
    gameLayerWrap.gameLayer = gameLayer

    --gameView
    local gameUI = display.newNode()
    gameLayerWrap:addChild(gameUI)
    gameLayerWrap.gameUI = gameUI

    --创建一个PanelMgr并加入
    local gamePanelMgr = GamePanelMgr.new()
    gameLayerWrap:addChild(gamePanelMgr)
    gameLayerWrap.gamePanelMgr = gamePanelMgr

    return gameLayerWrap
end

local instance = nil

local tlGameNode = {} --当前界面所有运行着的节点 2017.05.10添加

local curRunningLayer = nil --当前界面名

--屏蔽
M.MaskZOrdr = 1

--引导层ZOrder
M.GuideZOrder = 2

--重连
M.GameLoading = 5

--提示
M.TipZOrder = 8

--上层管理框的ZOrder
M.TopZOrder = 9

function M:ctor()
    M.instance = self
    
    --layer 存储
    local tlGameLayer = {}
    function tlGameLayer:push(layer)
        layer:retain()
        tlGameLayer[#tlGameLayer+1] = layer
    end
    
    function tlGameLayer:pop()
        local layer = tlGameLayer[#tlGameLayer]
        layer:release()
        tlGameLayer[#tlGameLayer] = nil
        return tlGameLayer[#tlGameLayer]
    end

    function tlGameLayer:top()
        return tlGameLayer[#tlGameLayer]
    end

    function tlGameLayer:clear(layer)
        for _, gameLayer in ipairs(tlGameLayer) do
            gameLayer:release()
        end
        local count = #tlGameLayer
        for i=1,count do
            tlGameLayer[i] = nil
        end
    end

    M.instance.tlGameLayerWrap = tlGameLayer

    --一个顶部的Panel管理器, 升级, 退出游戏, 充值到账, 等Panel的容器
    local topPanelMgr = GamePanelMgr.new()
    M.instance:addChild(topPanelMgr, M.TopZOrder)
    M.instance.topPanelMgr = topPanelMgr
    M.scheduler = require('framework.scheduler').scheduleUpdateGlobal(function ( dt )
        GameMessage:dispatchEvent{
            name = GameMessage.MessageName.update,
            data = dt,
        }
    end)
    M.Timescheduler = require('framework.scheduler').scheduleGlobal(function ( dt )
        GameMessage:dispatchEvent{
            name = GameMessage.MessageName.time,
            data = dt,
        }
    end,1)
    
end

function M.getScene()
    return M.instance
end

-- loading加载条
--仅gamelayer会使用
function M.loadingGameLayer(gameLayer,tlCmd)
    local tlFunc = {}

    for _, cmd in ipairs(tlCmd) do
        local tlFunc_temp = gameLayer[cmd](gameLayer)
        if tlFunc_temp then
            for _, func in ipairs(tlFunc_temp) do
                tlFunc[#tlFunc+1] = func
            end
        end
    end
    if #tlFunc > 0 then
        -- local GameLoading = require("game.gameSceneMgr.GameLoading")
        -- GameLoading.start()
        for index, func in ipairs(tlFunc) do
            func()
            -- GameLoading:setPercentage(index, #tlFunc)
        end
        -- GameLoading.stop()
    end
end
function M.coroutineCreate(f)
    coroutine.wrap(function()

        M.mask(true)

        --[[
        local status, result = pcall(f)
        if not status then
            printError("GameSceneMgr.coroutineCreate failed: %s", tostring(result))
        end
        ]]
        f()
        M.mask(false)

    end)()
end
-- function M.updateConfig( path,component )
--     local config = clone(require(path))
--     if config._component then
--         for i,comp in ipairs(config._component) do
--             if comp._type == component._type then
--                 config._component[i] = component
--                 return config
--             end
--         end
--     end
    
--     return config
-- end

--gameNode配置
function M.createGameNode( config )
    local localNode = { --预置基础节点
        GameNode = 0,
        GameLayer = 1,
        GamePanel = 2,
        GamePanelFloat = 3,
    }
    if localNode[config._super] then
        local node = require("game.gameSceneMgr."..config._super).new(config)
        if node:getName()~="" then
            tlGameNode[curRunningLayer][node:getName()] = node
        end
        return node
    else
        -- if not config._super then
            
        -- end
        local data = clone(require("game.config."..config._super))
        for k,v in pairs(config) do
            if k~="_super" then
                data[k] = v[k]
            end
        end
        return M.createGameNode(data)
    end
    return nil
end

function M.getGameNode( name )
    return tlGameNode[curRunningLayer][name]
end

function M.getAllGameNode(  )
    return tlGameNode
end

local index=1
--replace Layer
function M.replaceLayer(clsGameLayer, userdata, fCallback)
    
    local function helper()
        --清除全部layer
        M.clearLayer()
        --创建新的
        -- local gameLayer = require(clsGameLayer).new(userdata)
        -- dump(clsGameLayer)
        tlGameNode[clsGameLayer] = {}
        curRunningLayer = clsGameLayer
        local gameLayer = M.createGameNode(require(clsGameLayer))

        local gameLayerWrap = createGameLayerWrap(gameLayer)
        
        --缓存
        M.instance.tlGameLayerWrap:push(gameLayerWrap)
        print("replaceLayer")
        --加入
        M.instance:addChild(gameLayerWrap)

        --分发事件
        M:dispatchEvent{
            name = "prepare",
            data = {
                gameLayer = gameLayer,
                action = "replace",
            },
        }

        -- 处理加载
        local tlCmd = {"getTlInitView", "getTlOnEnter"}
        M.loadingGameLayer(gameLayer, tlCmd)
        -- for i,node in ipairs(tlNode) do
        --     GameSceneMgr.loadGameNode(node)
        -- end
        --分发事件
        M:dispatchEvent{
            name = "ready",
            data = {
                gameLayer = gameLayer,
                action = "replace",
            },
        }

        --回调
        if fCallback then
            fCallback(gameLayer)
        end
    end
    M.coroutineCreate(helper)
end
function M.replaceNormalLayer( clsGameLayer, userdata, fCallback )
   local function helper()
        --清除全部layer
        M.clearLayer()

        --创建新的
        local gameLayer = require(clsGameLayer).new(userdata)
        -- local gameLayer,tlNode = M.createGameNode(clsGameLayer,false)
        local gameLayerWrap = createGameLayerWrap(gameLayer)
        
        --缓存
        M.instance.tlGameLayerWrap:push(gameLayerWrap)
        print("replaceLayer")
        --加入
        M.instance:addChild(gameLayerWrap)

        --分发事件
        M:dispatchEvent{
            name = "prepare",
            data = {
                gameLayer = gameLayer,
                action = "replace",
            },
        }

        -- 处理加载
        local tlCmd = {"getTlInitView", "getTlOnEnter"}
        M.loadingGameLayer(gameLayer, tlCmd)
        --分发事件
        M:dispatchEvent{
            name = "ready",
            data = {
                gameLayer = gameLayer,
                action = "replace",
            },
        }

        --回调
        if fCallback then
            fCallback(gameLayer)
        end
    end
    M.coroutineCreate(helper) 
end
--push Layer
function M.pushLayer(clsGameLayer, userdata, fCallback)

    local function helper()
        --移除当前的Layer, 不执行cleanup
        local gameLayerWrap = M.getRunningGameLayerWrap()
        if gameLayerWrap then
            local tlOnExit = gameLayerWrap.gameLayer:getTlOnExit()
            for _, onExit in ipairs(tlOnExit) do
                onExit()
            end
            local parent = gameLayerWrap:getParent()
            if parent then
                parent:removeChild(gameLayerWrap)
            end
        end

        --创建新的
        local gameLayer = require(clsGameLayer).new(userdata)
        local gameLayerWrap = createGameLayerWrap(gameLayer)
        --加入
        M.instance:addChild(gameLayerWrap)
        --缓存
        M.instance.tlGameLayerWrap:push(gameLayerWrap)

        --分发事件
        M:dispatchEvent{
            name = "prepare",
            data = {
                gameLayer = gameLayer,
                action = "push",
            },
        }

        -- 处理加载
        local tlCmd = {"getTlInitView", "getTlOnEnter"}
        M.loadingGameLayer(gameLayer, tlCmd)

        --分发事件
        M:dispatchEvent{
            name = "ready",
            data = {
                gameLayer = gameLayer,
                action = "push",
            },
        }

        --回调
        if fCallback then
            fCallback(gameLayer)
        end
    end
    M.coroutineCreate(helper)
end

--popLayer
function M.popLayer(fcallback)
    if #M.instance.tlGameLayerWrap < 2 then return end

    local function helper()
        local gameLayerWrap_running = M.instance.tlGameLayerWrap:top()
        local gameLayerWrap = M.instance.tlGameLayerWrap:pop()
        if gameLayerWrap_running then
            local tlOnExit = gameLayerWrap_running.gameLayer:getTlOnExit()
            for _, onExit in ipairs(tlOnExit) do
                onExit()
            end
            local tlReleaseView = gameLayerWrap.gameLayer:getTlReleaseView()
            for _, releaseView in ipairs(tlReleaseView) do 
                releaseView()
            end
            gameLayerWrap_running:removeFromParent()
            --回收纹理
            cc.Director:getInstance():getTextureCache():removeUnusedTextures()
            --lua回收
            collectgarbage("collect")
        end
        
        --加入
        M.instance:addChild(gameLayerWrap)

        --分发事件
        M:dispatchEvent{
            name = "prepare",
            data = {
                --gameLayer = gameLayer,存在bug
                action = "pop",
            },
        }

        -- 加载loading
        local tlCmd = {"getTlOnEnter"}
        M.loadingGameLayer(gameLayerWrap.gameLayer, tlCmd)

        --分发事件
        M:dispatchEvent{
            name = "ready",
            data = {
                --gameLayer = gameLayer,存在bug
                action = "pop",
            },
        }

        if fcallback then
            fcallback()
        end
    end
    M.coroutineCreate(helper)
end

--clear Layer
function M.clearLayer()
    --清除当前的
    local gameLayerWrap = M.instance.tlGameLayerWrap:top()
    if gameLayerWrap then
        local tlOnExit = gameLayerWrap.gameLayer:getTlOnExit()
        for _, onEixt in ipairs(tlOnExit) do 
            onEixt()
        end
        local tlReleaseView = gameLayerWrap.gameLayer:getTlReleaseView()
        for _, releaseView in ipairs(tlReleaseView) do 
            releaseView()
        end
        gameLayerWrap:removeFromParent()
    end

    --清除堆栈
    M.instance.tlGameLayerWrap:clear()

    --回收纹理
    cc.Director:getInstance():getTextureCache():removeUnusedTextures()
    --lua回收
    collectgarbage("collect")
    tlGameNode = {}
end

--获取当前的GameLayer
function M.getRunningGameLayer()
    local gameLayerWrap = M.getRunningGameLayerWrap()
    if gameLayerWrap then
        return gameLayerWrap.gameLayer
    end
    return nil
end

--获取当前所有Layer
function M.getTlGameLayer()
    local tlGameLayerWrap = M.instance.tlGameLayerWrap
    local tlGameLayer = {}

    for _, gameLayerWrap in ipairs(tlGameLayerWrap) do
        tlGameLayer[#tlGameLayer+1] = gameLayerWrap.gameLayer
    end

    return tlGameLayer
end

--获取当前的GamePanelMgr
function M.getRunningGamePanelMgr()
    local gameLayerWrap = M.getRunningGameLayerWrap()
    if gameLayerWrap then
        return gameLayerWrap.gamePanelMgr
    end
    return nil
end

--获取当前的GameUI
function M.getRunningGameUI()
    local gameLayerWrap = M.getRunningGameLayerWrap()
    if gameLayerWrap then
        return gameLayerWrap.gameUI
    end
    return nil
end

--获取当前的TopPanelMgr
function M.getRunningTopPanelMgr()
    return M.instance.topPanelMgr
end

--获取当前的GameLayerWrap
function M.getRunningGameLayerWrap()
    return M.instance.tlGameLayerWrap:top()
end

--获取当前的GameLayer或者GamePanel
function M.getRunning()
    local gameLayerWrap = M.getRunningGameLayerWrap()
    if not gameLayerWrap then return nil end
    local gamePanel = gameLayerWrap.gamePanelMgr:getRunningPanel()
    if not gamePanel then
        return gameLayerWrap.gameLayer
    else
        return gamePanel
    end
end

--遮罩
local  maskCounts=1
function M.mask(ismask)
    local function createMaskLayer()
        local layer = display.newLayer()
        layer:setTouchEnabled(true)
        layer:addTouchEventListener(function() return true end, false, true)
        return layer
    end
    
    if ismask then
        maskCounts=maskCounts+1      
        if M.instance.maskLayer then return end
        M.instance.maskLayer = createMaskLayer()           
        M.instance:addChild(M.instance.maskLayer,M.MaskZOrdr)
        
    else
        maskCounts=maskCounts-1
    end
    print("maskCounts:"..tostring(maskCounts))
    if maskCounts==1 then 
        M.instance.maskLayer:removeFromParent()
        M.instance.maskLayer = nil    
    end 
end
function M:removeMaskLayer()
    if M.instance.maskLayer then
        maskCounts=1
        M.instance.maskLayer:removeFromParent()
        M.instance.maskLayer = nil 
    end
end


function M.viewGoto(view,nId)
    local class = require(GameGlobalConfig[view])
    if type(class.showPanel) == "function" then
        local ccPanel = class.new()
        ccPanel:showPanel()
        if ccPanel.gotoTab then
            ccPanel:gotoTab(nId or 1)
        end
    else
        M.replaceLayer(GameGlobalConfig[view])
    end
end

GameMessage:addEventListener(GameMessage.MessageName.replaceLayer,function ( cmdX )
    --TODO判断是否能进入界面
    local config = require("game.gameSceneMgr.GameLayerName")[cmdX.data.name].path
    GameSceneMgr.replaceLayer((config))
end)
GameMessage:addEventListener(GameMessage.MessageName.pushLayer,function ( cmdX )
    --TODO判断是否能进入界面
    local path = (cmdX.name).path
    local config = require("game.gameSceneMgr.GameLayerName")[cmdX.data.name].path
    GameSceneMgr.pushLayer((config))
end)
GameMessage:addEventListener(GameMessage.MessageName.showPanel,function ( cmdX )
    --TODO判断是否能进入界面
    local path = (cmdX.name).path
    local config = require("game.gameSceneMgr.GameLayerName")[cmdX.data.name].path
    local panel = M.createGameNode((config))
    panel:showPanel()
end)
GameMessage:addEventListener(GameMessage.MessageName.releaseNode,function ( cmdX )
    local nodeName = cmdX.name
    tlGameNode[nodeName] = nil
end)
return M
