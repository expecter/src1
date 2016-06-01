-----------------------------------------------------------------------------------------------  
-- @description 游戏loading 
-- @author  liuyao
-- @coryright  蜂鸟工作室
-- @release  2015/06/15
--------------------------------------------------------------------------------------------
local M = class(...)


M.state = "start"               -- 进度条状态

--[[
require("game.gameMgr"):addEventListener("EXITGAME", function(event)
    
    --
    printInfo("GameLoading exitGame~~~~~~~~~~~~~~~~~~~")

    if tolua.isnull(M.layer) then
        return
    end

    if M.layer:getParent() == nil then
        return
    end

    M.layer:removeFromParent()

end)
--]]

function M.start()
    if tolua.isnull(M.layer) then
        M.layer = M.createLayer()
        M.layer:retain()
    end
    GameSceneMgr.getScene():addChild(M.layer, GameSceneMgr.GameLoading)

end

function M.stop()
    M.layer:removeFromParent()
end

--创建界面
function M.createLayer()
    local layer = display.newLayer()
    layer:addTouchEventListener(function(event,x,y) return true end, false, true)
    layer:setTouchEnabled(true)
    return layer
end

function M.setPercentage(number, total)
end




return M
