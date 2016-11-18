--
-- Author: Your Name
-- Date: 2016-11-16 21:47:08
--
local M = class(...)
cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()
function M:ctor(  )
	M.cache = GameStateManager:getDataByName("ObjArmy")
end
function M:onexit(  )
	GameStateManager:save({name = "ObjArmy",data = M.cache})
end
--删除多个
function M:delete(tlCmdX_Key)
    if tlCmdX_Key then
        for _, cmdX_Key in ipairs(tlCmdX_Key) do
            self:deleteOne(cmdX_Key)
        end
    end
end

--删除一个
function M:deleteOne(cmd_Key)
    local hash = self:hash(cmd_Key)
    local cmdX = self.tmCmdX[hash]
    if cmdX then
        self.tmCmdX[hash] = nil
        --分发删除删除事件
        self:dispatchDeleteEvent(cmdX, hash)
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
        data =  { cacheName = self.proto.name,
                  gameCache = self,
                  cmdX = cmdX }
    })
end


function M:dispatchUpdateEvent(cmdX, hash, tmFieldChange)
    
    --清除已经过期的view
    self:cleanUsedView()

    for view, _ in pairs(self.tmView_bindOne) do
        local tmCallback = self:getTmCallback_bindOne(view)
        local fCallback = tmCallback[hash]
        if fCallback then
            fCallback(cmdX, tmFieldChange)
        end
    end
    for view, tmCallback in pairs(self.tmView_bind) do
        local onUpdate = tmCallback.onUpdate
        if onUpdate then
            onUpdate(cmdX, tmFieldChange)
        end
    end

    self:dispatchEvent({
        name = M.EVENT_CACHE_UPDATE,
        data =  { cacheName = self.proto.name,
                  gameCache = self,
                  cmdX = cmdX,
                  tmFieldChange = tmFieldChange }
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
        data =  { cacheName = self.proto.name,
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

--获取绑定在此view上的所有的bindOne回调
function M:getTmCallback_bindOne(view)
    local key = "__"..self.uniqueName.."bindOne__"
    local tmCallback = view[key]
    if not tmCallback then
        tmCallback = {}
        view[key] = tmCallback
    end
    return tmCallback
end

function M:cleanTmCallback_bindOne(view)
    local key = "__"..self.uniqueName.."bindOne__"
    view[key] = nil
end

--设置绑定在此view上的一个bindOne回调
function M:setCallback_bindOne(view, hash, fCallback)
    local tmCallback = self:getTmCallback_bindOne(view)
    tmCallback[hash] = fCallback
end

--获取绑定在此view上的一个bindOne回调
function M:getCallback_bindOne(view, hash)
    local tmCallback = self:getTmCallback_bindOne(view)
    return tmCallback[hash]
end
return M