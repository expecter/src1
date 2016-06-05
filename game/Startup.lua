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
ComponentFactory = require("game.component.componentFactory")
GameObj = require("game.gameObjects.GameObj")
GameCacheMgr = require("gameCaches.GameCacheMgr")
ref = require("game.ref.ref")
GameStateManager = require("utils.GameStateManager").new()
--场景管理器
GameSceneMgr = require("game.gameSceneMgr.GameSceneMgr").new()
display.replaceScene(GameSceneMgr)

return M