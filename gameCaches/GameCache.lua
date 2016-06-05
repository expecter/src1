local M = class(...)


cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()

M.EVENT_CACHE_ADD = "event_cache_add"
M.EVENT_CACHE_UPDATE = "event_cache_update"
M.EVENT_CACHE_DELETE = "event_cache_delete"

--构建缓存, 声明 
function M:ctor(protoName, protoName_key, protoName_update)
end

--[[

--构建一个 cache, 如果第二个参数传空, 则 这个cache是一张普通的表, 
local gameCache_cmdHero = M.new("CmdHero", "CmdHero_Key")

--整体更新
gameCache_cmdHero:update(cmdHero_Update)

--更新一个
gameCache_cmdHero:updateOne(cmdHero)

--用特定的数据结构做部分更新
gameCache_cmdHero:updateOne(cmdHero_Part, "CmdHero_Part")

--删除多个
gameCache_cmdHero:delete(tlCmdHero_Key)

--删除一个
gameCache_cmdHero:deleteOne(cmdHero_Key)

--获取一个
gameCache_cmdHero:get(cmdHero_Key)

--绑定一个view, 当cmdHero发生变化的时候, 会触发回调函数, 当view释放时, 自动解除绑定, 
-- 回调函数参数:
        cmdHero: 变化后的cmdHero, 当cmdHero被删除时, 为nil
        tmFieldChange: 发生变化的域,以及变化前后的值 例如, tmFieldChange = { 
            heroLevel = {org=1,new=2}, 
            heroState = {org="die", new="live"}, 
        }
gameCache_cmdHero:bind(view, {
    onUpdate = function(cmdHero, tmFieldChange)
    end,
    onAdd = function(cmdHero)
    end,
    onDelete = function(cmdHero)
    end,
})

--解除某个view的绑定
gameCache_cmdHero:unbind(view)

--绑定一个view, 当第一次绑定或者cmdHero发生变化的时候, 会触发回调函数, 当view释放时, 自动解除绑定
-- 回调函数参数:
        cmdHero: 变化后的cmdHero, 当cmdHero被删除时, 为nil
        tmFieldChange: 发生变化的域,以及变化前后的值 例如, tmFieldChange = { 
            heroLevel = {org=1,new=2}, 
            heroState = {org="die", new="live"}, 
        }
gameCache_cmdHero:bindOne(view, cmdHero, function(cmdHero, tmFieldChange)
    
end)

--解除某个view 和 cmdHero的绑定
gameCache_cmdHero:unbindOne(view, cmdHero)



--]]

local M_index = 1

--protoName   -- 缓存数据的protoName
--protoName_Update  -- 缓存数据的更新数据的 protoName
--protoName_Key   -- 缓存数据的删除Key的protoName
function M:ctor(tmCmdX)
    -- dump(self.proto)
    -- dump(self.proto_Update)
    -- assert(self.proto~=nil and self.proto_Update~=nil)

    --缓存数据
    self.tmCmdX = tmCmdX or {}

    --通过bindOne绑定在次GameCache上的View
    self.tmView_bindOne = {}

    --通过bind绑定在次GameCache上的View
    self.tmView_bind = {}

    --唯一名字
    self.uniqueName = protoName..tostring(M_index)
    M_index = M_index+1
    self:updateByProto(self.tmCmdX)
end

--是否有主键
function M:hasCmdX_Key()
    return self.proto_Key ~= nil
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

--利用proto_Key去hash数据
function M:hash(cmdX)

    --没有 key的时候, hash 都是返回1
    if not self.proto_Key then
        return 1
    end

    if not self.tlField_Key then
        self.tlField = {}
        for fieldName, field in pairs(self.proto_Key.tmField) do
            self.tlField[#self.tlField+1] = field
        end
        assert(#self.tlField > 0)
    end

    --获取cmdX 每个作为主键的字段的值
    local tlValue = table.map(self.tlField, function(field, index)
        local value = cmdX[field.name]
        assert(value ~= nil)
        return tostring( value )
    end)

    --连接这几个字段
    return table.concat(tlValue, ".")
end

--获取某一项
function M:get(cmdX_Key)
    local hash = self:hash(cmdX_Key)
    return self.tmCmdX[hash]
end

--获取全部项
function M:getAll()
    return self.tmCmdX
end

--更新整个缓存
function M:updateByProto(cmdX_Update)
    local proto_Update = self.proto_Update
    -- dump(cmdX_Update,"cmdX_Update:")
    -- dump(proto_Update,"proto_Update:")

    if not self.tlField_Update then
        self.tlField_Update = {}

        for _, field in pairs(proto_Update.tmField) do
            self.tlField_Update[#self.tlField_Update+1] = field
        end

        table.sort(self.tlField_Update, function(field1, field2)
            local function helper(field)
                
                --如果是 CmdX_Key 则代表删除, 删除的排在前面
                if self.proto_Key and field.type == self.proto_Key.name then
                    return 0
                end

                --如果是 CmdX
                if field.type == self.proto.name then
                    return 1
                end

                return 2
            end
            return helper(field1) < helper(field2)
        end)
        -- return self.tlField_Update
    end

   -- dump(self.tlField_Update,"self.tlField_Update:")

    local function delete(field)
        if field.prefix == "repeated" then
            local tlCmdX_Key = cmdX_Update[field.name]
            self:delete(tlCmdX_Key)
        else
            local cmdX_Key = cmdX_Update[field.name]
            self:deleteOne(cmdX_Key)
        end
    end

    local function update(field)
        --dump(field,"filed:")
        if field.prefix == "repeated" then
            -- 数组更新
            local tlCmdX_Key = cmdX_Update[field.name]
            self:update(tlCmdX_Key, field.type)
        else
            -- 单项更新
            local cmdX_Key = cmdX_Update[field.name]
            if cmdX_Key then
                self:updateOne(cmdX_Key, field.type)
            end
        end
    end

    local function updateCmdCacheUpdateByField(field)
        local tlCmdCacheUpdateByField = nil
        if field.prefix == "repeated" then
            tlCmdCacheUpdateByField = cmdX_Update[field.name]
        else
            tlCmdCacheUpdateByField = {
                cmdX_Update[field.name]
            }   
        end
        for _, cmdCacheUpdateByField in ipairs(tlCmdCacheUpdateByField or {}) do
            self:updateOneCmdCacheUpdateByField(cmdCacheUpdateByField)
        end
    end
-- 
    --遍历更新字段
    for _, field in ipairs(self.tlField_Update) do
        --删除操作
        if self.proto_Key and field.type == self.proto_Key.name then
            delete(field)
        --逐个字段更新
        elseif field.type == "CmdCacheUpdateByField" then
            updateCmdCacheUpdateByField(field)
        --更新操作
        else
            update(field)
        end
    end

end

function M:update(tlCmdX, protoName)
    protoName = protoName or self.proto.name

    if tlCmdX then
        for _, cmdX in ipairs(tlCmdX) do
            self:updateOne(cmdX, protoName)
        end
    end
end

--利用某个数据结构来更新缓存的某一项
function M:updateOne(cmdX, protoName)
    protoName = protoName or self.proto.name


    local proto = net.Proto.getProto(protoName)
    local hash = self:hash(cmdX)

    local cmdX_old = self.tmCmdX[hash]
    if cmdX_old then
       
        --旧的存在, 更新旧的
        local tmFieldChange = {}
        for _, field in pairs(proto.tmField) do
            if field.prefix == "repeated" then
                -- local fieldname = field.name
                cmdX_old[field.name] = cmdX[field.name]
                tmFieldChange[field.name] = true 
            else
                local fieldname = field.name
                local old = cmdX_old[fieldname]
                local new = cmdX[fieldname]
                if field.ismessage then
                    if new == nil or old == nil then
                        cmdX_old[fieldname] = new
                        if new ~= old then
                            tmFieldChange[field.name] = true 
                        end
                    else
                        local tmFieldChange_sub = net.Proto.updateProto( field.type, old, new, true )
                        tmFieldChange[field.name] = tmFieldChange_sub
                    end
                    
                else
                    cmdX_old[field.name] = new
                    if old ~= new then
                        tmFieldChange[field.name] = true
                    end
                end
            end       

        end
        --分发事件
        self:dispatchUpdateEvent(cmdX_old, hash, tmFieldChange)
    else
        --不存在则添加
        if proto.name ~= self.proto.name then
            print("GameCache update with [%s] except [%s]", proto.name , self.proto.name)
            return
        end
        local cmdX_new = {}
        for _, field in pairs(proto.tmField) do
            cmdX_new[field.name] = cmdX[field.name]
        end
        self.tmCmdX[hash] = cmdX_new

        --分发事件
        self:dispatchAddEvent(cmdX_new)
    end
end

--把data转换为新的字段数据
local function dataToNew(field, data)
    local tm = {}

    function tm.message()
        if data == "" or data == nil then
            return nil
        else
            return net.Proto.decode(field.type, data)
        end
    end

    function tm.enum()
        assert(data ~= "" and data ~= nil)
        return data
    end

    function tm.string()
        return data
    end

    function tm.bool()
        local _, v = string.unpack(data, "c")
        return v ~= 0
    end

    function tm.number()
        local tmFmt = {
            double = "=d",
            float = "=f",
            int32 = "=i",
            unint32 = "=I",
            --int64 = "=i=i",
            --uint64 = "=i=i"
        }
        local fmt = tmFmt[field.type]
        local _, v = string.unpack(data, fmt)
        return v
    end

    local new = nil
    if field.ismessage then
        new = tm.message()
    elseif field.isenum then
        new = tm.enum()
    elseif field.type == "string" or field.type == "bytes" then
        new = tm.string()
    elseif field.type == "bool" then
        new = tm.bool()
    else
        new = tm.number()
    end
    return new
end

--利用cmdCacheFieldUpdate 来更新
function M:updateOneCmdCacheUpdateByField(cmdCacheUpdateByField)

    local cmdX_Key = cmdCacheUpdateByField.cmdX_Key
    if cmdX_Key and self.proto_Key ~= nil then
        cmdX_Key = net.Proto.decode(self.proto_Key.name, cmdX_Key)
    end

    --旧数据
    local hash = self:hash(cmdX_Key)
    local cmdX_old = self.tmCmdX[hash]
    assert(cmdX_old ~= nil) --利用字段来更新, 必须有原数据

    --更新属性转换为map
    local tlCmdCacheUpdateField = cmdCacheUpdateByField.tlCmdCacheUpdateField or {}
    local tmCmdCacheUpdateField = {}
    for _, cmdCacheUpdateField in ipairs(tlCmdCacheUpdateField) do
        tmCmdCacheUpdateField[cmdCacheUpdateField.fieldNumber] = cmdCacheUpdateField
    end

    --逐个字段更新
    local tmFieldChange = {}
    local proto = net.Proto.getProto(self.proto.name)
    for _, field in pairs(proto.tmField) do
        local cmdCacheUpdateField = tmCmdCacheUpdateField[field.fieldNumber]
        if cmdCacheUpdateField then
            local fieldname = field.name
            local old = cmdX_old[fieldname]
            local new = dataToNew(field, cmdCacheUpdateField.data)
            if field.ismessage then
                if new == nil or old == nil then
                    cmdX_old[fieldname] = new
                    if new ~= old then
                        tmFieldChange[field.name] = true 
                    end
                else
                    local tmFieldChange_sub = net.Proto.updateProto( field.type, old, new, true )
                    tmFieldChange[field.name] = tmFieldChange_sub
                end
                
            else
                cmdX_old[field.name] = new
                if old ~= new then
                    tmFieldChange[field.name] = true
                end
            end

            tmFieldChange[field.name] = true 
        end
    end
    --分发事件
    self:dispatchUpdateEvent(cmdX_old, hash, tmFieldChange)
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