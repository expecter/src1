local M = {}

local function reloadChunk()

    local tlLoaded = {
        "game.gameScenes"
    }

    local tlNoLoaded = {

    }

    local function isreload(class)
    
        for _, noLoaded in ipairs(tlNoLoaded) do
            if string.sub( class, 1, string.len(noLoaded) ) == noLoaded then
                return false
            end
        end

        for _, loaded in ipairs(tlLoaded) do

            if string.sub( class, 1, string.len(loaded) ) == loaded then
                return true
            end

        end
        return false
    end

    for class, _  in pairs(package.loaded) do
        if isreload(class) then
            print(class)
            package.loaded[class] = nil
        end
    end

end

--刷新
function M.KEY_F6()
    reloadChunk()
end

--刷新并且重新进入主城()
function M.KEY_F7()
    reloadChunk()
    GameSceneMgr.replaceLayer("game.gameScenes.capital.LayerCapital")
    -- GameSceneMgr.mask(false)
end

function M.KEY_F9()
 local tlLoaded = {
        "game.gameScenes.fight",
        "game.view",
        "game.gameScenes.world",
        "game.gameScenes.capital",
        "game.gameScenes.activity",
        "game.gameScenes.chat",
        "game.gameScenes.task",
        "game.gameScenes.troop",
        "game.gameScenes.fuben",
        "utils.ShaderHSL",
    }

    local tlNoLoaded = {

    }

    local function isreload(class)
    
        for _, noLoaded in ipairs(tlNoLoaded) do
            if string.sub( class, 1, string.len(noLoaded) ) == noLoaded then
                return false
            end
        end

        for _, loaded in ipairs(tlLoaded) do

            if string.sub( class, 1, string.len(loaded) ) == loaded then
                return true
            end

        end
        return false
    end

    for class, _  in pairs(package.loaded) do

        if isreload(class) then
            print(class)
            package.loaded[class] = nil
        end
    

    end
    GameSceneMgr.replaceLayer("game.gameScenes.capital.LayerCapital")
    -- GameSceneMgr.mask(false)
end

function M.KEY_BREAK()
    GameMgr:dispatchEvent{
        name = "exitGame"
    }
    -- local panel = SceneCommon.PanelGameSimpleTips.new{
        
    -- }

    -- GameSceneMgr.getRunningTopPanelMgr():addPanel(panel)
    -- cc.Director:getInstance():endToLua()
end

-- GM窗
function M.KEY_F8()
    local panel = SceneCommon.PanelGameGMTips.new{
        
    }
    GameSceneMgr.getRunningTopPanelMgr():addPanel(panel)
end

function M.KEY_F10()
    GameObjectMgr.ObjWorld.setShowTilePos()
end

--监听键盘事件
if device.platform == "windows" or device.platform == "android" then
    local function onKeyReleased(keycode, event)
        local key = cc.KeyCodeKey[keycode]
        local func = M[key]
        if func then
            func()
        end
    end

    local eventDispatcher=cc.Director:getInstance():getEventDispatcher()

    local listener = cc.EventListenerKeyboard:create()

    listener:registerScriptHandler(onKeyReleased, cc.Handler.EVENT_KEYBOARD_RELEASED )


    eventDispatcher:addEventListenerWithFixedPriority(listener,1)

end

return M
