local M = {}
cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()
--给每个缓存增加个更新次数index，方便界面判断数据有无更新，需不需要重载数据
function M:ctor( params )
    self.cacheName = params.cacheName
    self.isRepeat = params.isRepeat~=false --是否数组形式的缓存
    self.dataModel = self:createDataModel(params.dataModel)
    self.id = 0 --当前已创建的数据最大id
    --缓存数据
    self.tmCmdX = {}

    --通过bindOne绑定在次GameCache上的View
    self.tmView_bindOne = {}

    --通过bind绑定在次GameCache上的View
    self.tmView_bind = {}
    GameMgr:addEventListener("enterGame",function()
        for i,v in ipairs(GameStateManager:getDataByName(self.cacheName)) do
            self.tmCmdX[v.id] = v
        end
        self.id = self.tmCmdX[#self.tmCmdX].id
        self:init(cmdX)
    end)

    GameMgr:addEventListener("exitGame",function()
        GameStateManager:save({name = self.cacheName,data = M.cache})
        self:cleanup()
        self:clean()
    end)
end
function M:createDataModel( data )
    return data
end
function M:init( cmdX )
    
end
function M:cleanup(  )
    
end
--清空缓存数据
function M:clean()
    --缓存数据
    self.tmCmdX = {}

    --通过bindOne绑定在次GameCache上的View
    self.tmView_bindOne = {}

    --通过bind绑定在次GameCache上的View
    self.tmView_bind = {}
end

function M:hash( cmdX )
    return cmdX.id
end

function M:get( cmdX_Key )
    local hash = self:hash(cmdX_Key)
    return self.tmCmdX[hash]
end

--获取全部项
function M:getAll()
    return self.tmCmdX
end
function M:delete( tlId )
    if tlId then
        for _, id in ipairs(tlId) do
            self:deleteOne(id)
        end
    end
end
function M:deleteOne( id )
    local hash = self:hash(cmd_Key)
    local cmdX = self.tmCmdX[hash]
    if cmdX then
        self.tmCmdX[hash] = nil
        --分发删除删除事件
        self:dispatchDeleteEvent(cmdX, hash)
    end
end
function M:update( tlCmdX )
    if tlCmdX then
        for _, cmdX in ipairs(tlCmdX) do
            self:updateOne(cmdX)
        end
    end
end
function M:updateOne( cmdX )
    local hash = self:hash(cmdX)

    local cmdX_old = self.tmCmdX[hash]
    if cmdX_old then
        for k,v in pairs(cmdX) do
            local old = cmdX_old[k]
            cmdX_old[k] = v
        end
        --分发事件
        self:dispatchUpdateEvent(cmdX_old, hash)
    else
        self.tmCmdX[hash] = cmdX
        --分发事件
        self:dispatchAddEvent(cmdX_new)
    end
end
------------------------
--派发事件
------------------------
function M:dispatchAddEvent(cmdX)
    --清除已经过期的view
    self:cleanUsedView()

    for view, tmCallback in pairs(self.tmView_bind) do
        local onAdd = tmCallback.onAdd
        if onAdd then
            onAdd(cmdX)
        end
    end

    self:dispatchEvent({
        name = M.EVENT_CACHE_ADD,
        data =  { cacheName = self.cacheName,
                  gameCache = self,
                  cmdX = cmdX }
    })
end


function M:dispatchUpdateEvent(cmdX, hash)
    
    --清除已经过期的view
    self:cleanUsedView()

    for view, _ in pairs(self.tmView_bindOne) do
        local tmCallback = self:getTmCallback_bindOne(view)
        local fCallback = tmCallback[hash]
        if fCallback then
            fCallback(cmdX)
        end
    end
    for view, tmCallback in pairs(self.tmView_bind) do
        local onUpdate = tmCallback.onUpdate
        if onUpdate then
            onUpdate(cmdX)
        end
    end

    self:dispatchEvent({
        name = M.EVENT_CACHE_UPDATE,
        data =  { cacheName = self.cacheName,
                  gameCache = self,
                  cmdX = cmdX }
    })
end

function M:dispatchDeleteEvent(cmdX, hash)
    
    --清除已经过期的view
    self:cleanUsedView()

    for view, _ in pairs(self.tmView_bindOne) do
        local tmCallback = self:getTmCallback_bindOne(view)
        local fCallback = tmCallback[hash]
        if fCallback then
            --回调空值, 代表删除
            fCallback()
        end
    end

    for view, tmCallback in pairs(self.tmView_bind) do
        local onDelete = tmCallback.onDelete
        if onDelete then
            onDelete(cmdX)
        end
    end

    --事件分发后, 关联了cmdX的 bindOne
    for view, _ in pairs(self.tmView_bindOne) do
        local tmCallback = self:getTmCallback_bindOne(view)
        tmCallback[hash] = nil
    end

    self:dispatchEvent({
        name = M.EVENT_CACHE_DELETE,
        data =  { cacheName = self.cacheName,
                  cmdX = cmdX,
                  gameCache = self }
        })
end
------------------------
--清理无效的view
------------------------
function M:cleanUsedView()
     for view, tmCallback in pairs(self.tmView_bind) do
        if type(view) == "userdata" and tolua.isnull(view) then
            self.tmView_bind[view] = nil --清理
        end
    end
    for view, _ in pairs(self.tmView_bindOne) do
        if type(view) == "userdata" and tolua.isnull(view) then
            self.tmView_bindOne[view] = nil --清理
        end
    end
end


------------------------
-- 绑定事件
------------------------

--绑定
function M:bind(view, tmCallback)
    
    self:cleanUsedView()

    self.tmView_bind[view] = tmCallback
end

function M:unbind(view)
    self.tmView_bind[view] = nil
end

------------------------
-- 绑定一项
------------------------

--绑定一项
function M:bindOne( view, cmdX, fCallback)

    self:cleanUsedView()

    local hash = self:hash(cmdX)

    self.tmView_bindOne[view] = view

    self:setCallback_bindOne(view, hash, fCallback)

    --第一次绑定直接回调一次
    fCallback(cmdX)
end

--解除绑定
function M:unbindOne( view, cmdX )
    local hash = self:hash(cmdX)
    self:setCallback_bindOne(view, hash, nil)
end

--解除某个view上的所有bindOne
function M:unbindOneAll( view )
    self:cleanTmCallback_bindOne(view)
    self.tmView_bindOne[view] = nil
end

return M
