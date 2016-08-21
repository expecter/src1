--
-- Author: Your Name
-- Date: 2016-05-12 09:45:06
--
local M = {}
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
Object = require("game.gameScenes.object.Object")
component = require("game.component.component")
ComponentFactory = component.ComponentFactory
GameObj = require("game.gameObjects.GameObj")
CmdData = require("gameCaches.CmdData")
CmdCommon = require("gameCaches.caches.CmdCommon")
GameStateManager = require("utils.GameStateManager").new()
GameCacheMgr = require("gameCaches.GameCacheMgr")
GameNode = require("game.gameSceneMgr.GameNode")
GameCell = require("game.gameSceneMgr.GameCell")
ref = require("game.ref.ref")
require("game.GameGlobalConfig")
Helper = require("utils.Helper")
view = require("game.view.view")
UICommon = require("game.view.UICommon")

--场景管理器
GameSceneMgr = require("game.gameSceneMgr.GameSceneMgr").new()
display.replaceScene(GameSceneMgr)

return M