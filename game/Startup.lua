--
-- Author: Your Name
-- Date: 2016-05-12 09:45:06
--
local M = {}
--debugging
------------------
require("game.debugging.debugging")
ModuleUtil = require("utils.ModuleUtil")
--view模块初始化, 一些公共视图, view.ViewTable 可以访问到相应的模块
-------------------
-- view = require("game.view.view")

-------------------
--ref模块初始化, 一些公共视图, view.ViewTable 可以访问到相应的模块
-------------------
-- ref = require("game.ref.ref")
static_Listener = {}
cc(static_Listener):addComponent("components.behavior.EventProtocol"):exportMethods()
-- Object = require("game.gameScenes.object.Object")
CCBReader = require("utils.CCBReader")
CCBReader.setDefaultCallback(function()
    -- require("game.gameScenes.sceneCommon.ViewAlertTips").show(G_W("提示"), G_W("功能暂未开启"))
    AlertTips.showTips("提示")
end)
Language = require("game.Language.Language")
--view
GameObj = require("game.gameObjects.GameObj")
GameStateManager = require("utils.GameStateManager").new()
GameMessage = require("game.gameSceneMgr.GameMessage")
GameSceneMgr = require("game.gameSceneMgr.GameSceneMgr").new()
-- GameCacheMgr = require("gameCaches.GameCacheMgr")
GameNode = require("game.gameSceneMgr.GameNode")
GameLayer = require("game.gameSceneMgr.GameLayer")

-- GameNode = require("game.gameSceneMgr.GameNode")
component = require("game.component.component")
ComponentFactory = require("game.component.componentFactory")
--游戏管理器
GameMgr = require("game.GameMgr")
CommonUtil = require("utils.CommonUtil")
ref = require("game.ref.json.ref")
require("game.GameGlobalConfig")
Helper = require("utils.Helper")
AlertTips = require("utils.AlertTips")
view = require("game.view.view")
UICommon = require("game.view.UICommon")
net = {}
net.Socket = require("net.SocketTCP")
--场景管理器

--data
GameCacheMgr = require("gameCaches.GameCacheMgr")
ClickEventScript = require("utils.ClickEventScript")
ObjScheduler = require("game.gameObjects.ObjScheduler")
-- CacheCard = require("gameCaches.CacheCard").new()
-- CacheHero = require("gameCaches.CacheHero").new()
-- CacheHeroUpgrade = require("gameCaches.CacheHeroUpgrade").new()
-- CachePlayer = require("gameCaches.CachePlayer").new()
display.replaceScene(GameSceneMgr)
DEFAULT_TRUE = function ( a ) return a~= false end
DEFAULT_FALSE = function ( a ) return a == true end
return M