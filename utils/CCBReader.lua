local M = {}

cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()

M.EVENT_CCB_CLICKED = "event_ccb_clicked"

local M_DefaultCallback = function() end
function M.setDefaultCallback(callback)
    M_DefaultCallback = callback or  function() end
end

local M_DefaultClickSound = nil
function M.setDefaultClickSound(clickSound)
    M_DefaultClickSound = clickSound
end

function M.load(strFilePath,owner)
    owner = owner or {}
    local proxy =  cc.CCBProxy:create()

    local ccbReader = proxy:createCCBReader()
    local node      = ccbReader:load(strFilePath)

    local nodesWithAnimationManagers = ccbReader:getNodesWithAnimationManagers()
    local animationManagersForNodes  = ccbReader:getAnimationManagersForNodes()

    for i = 1 , table.getn(nodesWithAnimationManagers) do
        local innerNode = nodesWithAnimationManagers[i]
        local animationManager = animationManagersForNodes[i]
        local documentControllerName = animationManager:getDocumentControllerName()

        --AnimationManager
        innerNode.animationManager = animationManager

        --events
        local events = innerNode.events
        if not events then
            events = {}
            innerNode.events = events
        end
        local sounds = innerNode.sounds
        if not sounds then
            sounds = {}
            innerNode.sounds = sounds
        end

        --Callbacks
        local documentCallbackNames = animationManager:getDocumentCallbackNames()
        local documentCallbackNodes = animationManager:getDocumentCallbackNodes()
        local documentCallbackControlEvents = animationManager:getDocumentCallbackControlEvents()

        for i = 1,table.getn(documentCallbackNames) do
            local callbackName = documentCallbackNames[i]
            local callbackNode = documentCallbackNodes[i]
            local callbackControlEvent = documentCallbackControlEvents[i]
           
            proxy:setCallback(callbackNode, function(...)

                --音效
                local sound = sounds[callbackName]
                if type(sound) == "function" then
                    sound = sound()
                end
                if not sound then
                    sound = M_DefaultClickSound
                end
                if sound then
                    AudioUtil.playSound(sound)
                end

                --回调
                local callback = events[callbackName] or owner[callbackName]
                if callback then
                    callback(...)
                    M:dispatchEvent({
                            name = M.EVENT_CCB_CLICKED,
                            data = {
                                node = callbackNode
                            }
                        })
                else
                    M_DefaultCallback(...)
                end
            end, callbackControlEvent)

        end

        --Variables
        local documentOutletNames = animationManager:getDocumentOutletNames()
        local documentOutletNodes = animationManager:getDocumentOutletNodes()

        for i = 1, table.getn(documentOutletNames) do
            local outletName = documentOutletNames[i]
            local outletNode = documentOutletNodes[i]
            innerNode[outletName] = outletNode
        end

        --Setup timeline callbacks
        local keyframeCallbacks = animationManager:getKeyframeCallbacks()

        for i = 1 , table.getn(keyframeCallbacks) do
            local callbackCombine = keyframeCallbacks[i]
            local beignIndex,endIndex = string.find(callbackCombine,":")
            local callbackType    = tonumber(string.sub(callbackCombine,1,beignIndex - 1))
            local callbackName    = string.sub(callbackCombine,endIndex + 1, -1)
            --Document callback


            local callfunc = cc.CallFunc:create(function(...)
                local callback = events[callbackName] or owner[callbackName]
                if callback then
                    callback(...)
                end
            end)
            animationManager:setCallFuncForLuaCallbackNamed(callfunc, callbackCombine)

        end

        --start animation
        local autoPlaySeqId = animationManager:getAutoPlaySequenceId()
        if -1 ~= autoPlaySeqId then
            animationManager:runAnimationsForSequenceIdTweenDuration(autoPlaySeqId, 0)
        end
    end


    --
    -- loaded owner
    --
    --Callbacks
    local ownerCallbackNames = ccbReader:getOwnerCallbackNames() 
    local ownerCallbackNodes = ccbReader:getOwnerCallbackNodes()
    local ownerCallbackControlEvents = ccbReader:getOwnerCallbackControlEvents()
    
    local events = node.events
    if not events then
        events = {}
        node.events = events
    end

    local sounds = node.sounds
    if not sounds then
        sounds = {}
        node.sounds = sounds
    end

    local i = 1
    for i = 1,table.getn(ownerCallbackNames) do
        local callbackName =  ownerCallbackNames[i]
        local callbackNode =  ownerCallbackNodes[i]
        local callbackControlEvent = ownerCallbackControlEvents[i]

        proxy:setCallback(callbackNode, function(...)

            --音效
            local sound = sounds[callbackName]
            if type(sound) == "function" then
                sound = sound()
            end
            if not sound then
                sound = M_DefaultClickSound
            end
            if sound then
                AudioUtil.playSound(sound)
            end

            --回调
            local callback = events[callbackName] or owner[callbackName]
            if callback then
                callback(...)
                M:dispatchEvent({
                        name = M.EVENT_CCB_CLICKED,
                        data = {
                            node = callbackNode
                        }
                    })
            else
                M_DefaultCallback(...)
            end
        end, ownerCallbackControlEvents[i])
       

    end

    --Variables
    local ownerOutletNames = ccbReader:getOwnerOutletNames() 
    local ownerOutletNodes = ccbReader:getOwnerOutletNodes()

    for i = 1, table.getn(ownerOutletNames) do
        local outletName = ownerOutletNames[i]
        local outletNode = ownerOutletNodes[i]
        node[outletName] = outletNode
    end

    return node
end


return M