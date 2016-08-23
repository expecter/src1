--------------------------------------------------------------------------------
-- 信息提示
-- @author 钟亮
-- @copyright 蜂鸟工作室
-- @release AlertTips.lua, 2013/9/5
--------------------------------------------------------------------------------
local AlertTips = class(..., function()
    return display.newLayer()
end)

local MOVE_TIME = 0.25

--------------------------------------------------------------------------------
-- 显示提示信息
-- @param tipsText提示文字
-- @param showTime显示时间，不填默认为2秒
-- startPoint={x=10,y=10}  moveToPoint={x=10,y=10}
function AlertTips.showTips(tipsText, showTime,color,startPoint,moveToPoint)



    local owner = CCBReader.load("ccbi_tongyong_tip.ccbi")
    owner.animationManager:runAnimationsForSequenceNamed("kaishi")
    require("framework.scheduler").performWithDelayGlobal(function()
        owner.animationManager:runAnimationsForSequenceNamed("jieshu")
        require("framework.scheduler").performWithDelayGlobal(function()
            owner:removeFromParent()
        end,0.5)
    end,1)
    owner:setPosition(display.cx, display.cy)
    owner.ccLabelTip:setString(tipsText)
    local textSize=owner.ccLabelTip:getContentSize()

    owner.ccTextBg:setContentSize(cc.size(textSize.width+50,owner.ccTextBg:getContentSize().height))
    local scene = GameSceneMgr.getScene()
    scene:addChild(owner, GameSceneMgr.TipZOrder)
end
return AlertTips