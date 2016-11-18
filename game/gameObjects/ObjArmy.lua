--
-- Author: Your Name
-- Date: 2016-11-16 21:47:08
--
local M = {}
M.cache = {}
M.tmView_bindOne = {}
M.tmView_bind = {}
cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()
GameMgr:addEventListener("enterGame",function()
	M.cache = GameCache.new(GameStateManager:getDataByName("ObjArmy"))
end)

GameMgr:addEventListener("exitGame",function()
	GameStateManager:save({name = "ObjArmy",data = M.cache})
	M.cache = {}
end)

function M.dispatchAddEvent( cmdX )
	--清除已经过期的view
    M.cleanUsedView()
    for view, tmCallback in pairs(M.tmView_bind) do
        local onAdd = tmCallback.onAdd
        if onAdd then
            onAdd(cmdX)
        end
    end
end

function M.dispatchUpdateEvent( cmdX, hash, tmFieldChange )
	--清除已经过期的view
    M.cleanUsedView()

    -- for view, _ in pairs(M.tmView_bindOne) do
    --     local tmCallback = M.getTmCallback_bindOne(view)
    --     local fCallback = tmCallback[hash]
    --     if fCallback then
    --         fCallback(cmdX, tmFieldChange)
    --     end
    -- end
    for view, tmCallback in pairs(M.tmView_bind) do
        local onUpdate = tmCallback.onUpdate
        if onUpdate then
            onUpdate(cmdX, tmFieldChange)
        end
    end
end
function M.dispatchDeleteEvent( cmdX,hash )
	--清除已经过期的view
    M.cleanUsedView()

    -- for view, _ in pairs(M.tmView_bindOne) do
    --     local tmCallback = M.getTmCallback_bindOne(view)
    --     local fCallback = tmCallback[hash]
    --     if fCallback then
    --         --回调空值, 代表删除
    --         fCallback()
    --     end
    -- end

    for view, tmCallback in pairs(M.tmView_bind) do
        local onDelete = tmCallback.onDelete
        if onDelete then
            onDelete(cmdX)
        end
    end

    --事件分发后, 关联了cmdX的 bindOne
    -- for view, _ in pairs(M.tmView_bindOne) do
    --     local tmCallback = M.getTmCallback_bindOne(view)
    --     tmCallback[hash] = nil
    -- end
end

function M.cleanUsedView(  )
	for view, tmCallback in pairs(M.tmView_bind) do
        if type(view) == "userdata" and tolua.isnull(view) then
            M.tmView_bind[view] = nil --清理
        end
    end
    -- for view, _ in pairs(M.tmView_bindOne) do
    --     if type(view) == "userdata" and tolua.isnull(view) then
    --         M.tmView_bindOne[view] = nil --清理
    --     end
    -- end
end
function M.bind( view,tmCallback )
	M.cleanUsedView()

    M.tmView_bind[view] = tmCallback
end
function M:unbind(view)
    M.tmView_bind[view] = nil
end

--数据筛选层
function M.getCacheData(  )
	return M.cache
end

function M.getIndex(  )
	
end

--界面数据请求层

function M.newHero(  )	
	return CmdData.appendCmdX(clone(CmdCommon["CmdHero"]))
end
function M.createNewObject(  )
	local index = #M.getHeroCaches()+1
	M.request(M.className,M.newHero())
end
function M.request( className,data )
	static_Listener:dispatchEvent{
        name = "CmdAppend",
        data = data,
        className = className,
    }
end
return M