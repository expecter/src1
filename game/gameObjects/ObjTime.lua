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
    local time = 0
    GameMessage:addEventListener(GameMessage.MessageName.time,function ( cmdX )
        -- print(os.time())
        -- print(os.date())
        -- dump(M.dailyEvent)
        time = time+1
        for k,v in pairs(M.dailyEvent) do
            -- print(k==os.time())
            print(time,k)
            if (time%k)==0 then --只能判定到点发送广播
                GameMessage:dispatchEvent{
                    name = v[1],
                }
            end
        end
    end)
end

function M.cleanUp(  )
	M.tmCallback = {}
end

function M.addTimeCallback( time,eventName )
	M.tmCallback[time] = eventName
end

function M.getTriggerTime( eventName )
    
end

function M.getCurTime(  )
	return os.time()
end



return M