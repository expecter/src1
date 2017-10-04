--
-- Author: Your Name
-- Date: 2017-07-27 20:37:47
--
local M = {}
cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()

GameMgr:addEventListener("enterGame",function()
    M.init()
end)

GameMgr:addEventListener("exitGame",function()
    M.cleanUp()
end)
--日常任务，key为每日的时间点
M.dailyEvent = {
    [6] ={"work"},
}
--已分发过的时间点
M.DispatchEvent = {}
M.tmCallback = {}
local tmNodeEvents = {}

function M.init(  )
	-- M.scheduler = require('framework.scheduler').scheduleUpdateGlobal(function ( dt )
 --        GameMessage:dispatchEvent{
 --            name = GameMessage.MessageName.update,
 --            data = dt,
 --        }
 --    end)
 --    M.Timescheduler = require('framework.scheduler').scheduleGlobal(function ( dt )
 --        GameMessage:dispatchEvent{
 --            name = GameMessage.MessageName.time,
 --            data = dt,
 --        }
 --    end,1)
    -- local time = 0
    -- GameMessage:addEventListener(GameMessage.MessageName.time,function ( cmdX )
    --     -- print(os.time())
    --     -- print(os.date())
    --     -- dump(M.dailyEvent)
    --     time = time+1
    --     for k,v in pairs(M.dailyEvent) do
    --         -- print(time,k)
    --         if (time%k)==0 then --只能判定到点发送广播
    --             GameMessage:dispatchEvent{
    --                 name = v[1],
    --             }
    --         end
    --     end
    -- end)
    local scheduler = require('framework.scheduler')
    scheduler.scheduleGlobal(M.helperEvents,1)
end

function M.cleanUp(  )
    M.tmCallback = {}
end

function M.helperEvents(  )
    M.removeInvalidNodeEvent()
    for key,callbacks in pairs(tmNodeEvents) do
        for i=1,#callbacks do
            local callback=callbacks[i]
            callback(net.Client.getServerTime(),dt)
        end
    end
    --自身回调时间通知事件
    local curTime = M.getCurTime()
    local tlRemove = {}
    for time,tlFunc in pairs(M.tmCallback) do
        -- print(time,k)
        -- if (time%k)==0 then --只能判定到点发送广播
        --     GameMessage:dispatchEvent{
        --         name = v[1],
        --     }
        -- end
        if curTime>=time then
            for i,func in ipairs(tlFunc) do
                func(curTime)
            end
            M.tmCallback[time] = nil
        end
    end
end
--回调计时器
function M.addEvent(key,callback)
    if tmNodeEvents[key]==nil then
        tmNodeEvents[key]={}
    end
    table.insert(tmNodeEvents[key],callback)
end

function M.removeEvent(key)
    if tmNodeEvents[key] then
        tmNodeEvents[key]=nil
    end
end

--清除无效事件
function M.removeInvalidNodeEvent()
    local keys={}
    for key,callbacks in pairs(tmNodeEvents) do
        if tolua.isnull(key) then
            table.insert(keys,key)
        end
    end
    for i=1,#keys do
        local key=keys[i]
        tmNodeEvents[key]=nil
    end
end

--添加到点通知更新
function M.addTimeCallback( time,eventName )
	-- M.tmCallback[time] = eventName
    if not M.tmCallback[time] then
        M.tmCallback[time] = {}
    end
    table.insert(M.tmCallback[time],eventName)
end

function M.getTriggerTime( eventName )
    
end

function M.getCurTime(  )
	return os.time()
end



return M