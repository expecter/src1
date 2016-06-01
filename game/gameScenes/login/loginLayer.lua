local M = class(..., require("game.gameSceneMgr.GameLayer"))
function M:ctor()
	local object = Object.new()    
    object:bindComponent("model_enemy",{})
    object:bindComponent("model_npc",{})
    object:initView(self)
    -- object:startUpdate()
    -- local object1 = Object.new()
    -- object1:bindComponent("schedule")
    -- object:addObject(object1)
    -- GameStateManager:save({name = "tmPlayerInfo",data = {player = "jean"}})
    GameObj.ObjPlayer.createNewObject()
    CacheData.saveLocalData()
end

return M
