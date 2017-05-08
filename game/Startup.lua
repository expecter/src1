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
component = require("game.component.component")
ComponentFactory = component.ComponentFactory
GameObj = require("game.gameObjects.GameObj")
GameStateManager = require("utils.GameStateManager").new()
GameMessage = require("game.gameSceneMgr.GameMessage")
GameSceneMgr = require("game.gameSceneMgr.GameSceneMgr").new()
-- GameCacheMgr = require("gameCaches.GameCacheMgr")
GameNode = require("game.gameSceneMgr.GameNode")
GameLayer = require("game.gameSceneMgr.GameLayer")

-- GameNode = require("game.gameSceneMgr.GameNode")
component = require("game.component.component")
--游戏管理器
GameMgr = require("game.GameMgr")
require("game.gameObjects.ObjArmy")
ref = require("game.ref.json.ref")
require("game.GameGlobalConfig")
Helper = require("utils.Helper")
AlertTips = require("utils.AlertTips")
view = require("game.view.view")
dataUtil = require("utils.dataUtil")
UICommon = require("game.view.UICommon")
net = {}
net.Socket = require("net.SocketTCP")
--场景管理器

display.replaceScene(GameSceneMgr)
DEFAULT_TRUE = function ( a ) return a~= false end
DEFAULT_FALSE = function ( a ) return a == true end
return M