-----------------------------------------------------------------------------------------------  
-- @description 当有请求的时候,转圈圈
-- @author  ny
-- @coryright  蜂鸟工作室
-- @release  2015/11/30
--------------------------------------------------------------------------------------------

local M = {}

function M.start()
    M.handle1 = net.Client:addEventListener("request",function(event)
        local request = event.data.request
        M.onRequest(request)
    end)

    M.handle2 = net.Client:addEventListener("receive",function(event)
        local request = event.data.request
        M.onReceive(request)
    end)

    M.handle3 = net.Client:addEventListener("close",function(event)
        M.onClose()
    end)

    M.handle4 = net.Client:addEventListener("error",function(event)
        local request = event.data.request
        local cmdError = event.data.cmdX

        M.onError(request, cmdError)
    end)

    M.handle5 = GameMgr:addEventListener("exitGame", function(event)
        M.onClose()
    end)
end

function M.stop()

    net.Client:removeEventListener(M.handle1)

    net.Client:removeEventListener(M.handle2)

    net.Client:removeEventListener(M.handle3)

    net.Client:removeEventListener(M.handle4)

    GameMgr:removeEventListener(M.handle5)
end

function M.onRequest(request)
    if not request.free then
        M.addmask()
    end
end

function M.onReceive(request)
    if request then
        if not request.free then
            M.releasemask()
        end
    end
end

function M.onError(request, cmdError)
    if cmdError.tips then
        AlertTips.showTips(cmdError.tips)
    end
    if request then
        if not request.free then
            M.releasemask()
        end
    end
end

function M.onClose(request)
    M.releasemaskAll()
end

function M.createMaskLayer()
    local layer = display.newLayer()

    layer:addTouchEventListener(function()
        return true
    end, false, true)
    layer:setTouchEnabled(true)

    M.createLoadingTips(layer)

    local scene = GameSceneMgr.getScene()
    scene:addChild(layer, 9999999)
    return layer
end

function M.createLoadingTips(parentNode)
     local function helper()
        local ccLoadingSpr = display.newSprite("loading.png")
        ccLoadingSpr:setPosition(display.cx, display.cy)
        ccLoadingSpr:setScale(1.2)
        
        ccLoadingSpr:setBlendFunc(gl.SRC_ALPHA, gl.ONE)
        parentNode:addChild(ccLoadingSpr)

        ccLoadingSpr:runAction(cc.RepeatForever:create(
            cc.RotateBy:create(1, -360)
        ))

        -- local particle = cc.ParticleSystemQuad:create("loadingPar.plist")
        -- particle:setPosition(display.cx, display.cy)
        -- particle:setScale(0.7)
        -- parentNode:addChild(particle)
    end
    
    parentNode:performWithDelay(function()
        helper()
    end, 0.5)
end

M.maskCount = 0
M.maskLayer = nil
function M.addmask()
    M.maskCount = M.maskCount + 1
    if not M.maskLayer then
        M.maskLayer = M.createMaskLayer()
    end
end

function M.releasemask()
    M.maskCount = M.maskCount - 1
    if M.maskCount == 0 then
        M.releasemaskAll()
    end
end

function M.releasemaskAll()
    if M.maskLayer then
        M.maskLayer:removeFromParent()
        M.maskLayer = nil
        M.maskCount = 0
    end
end



return M
