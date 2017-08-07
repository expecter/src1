--
-- Author: Your Name
-- Date: 2017-07-27 20:37:47
--
local M = {}
cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()

GameMgr:addEventListener("loadingGame",function()
    M.init()
end)

GameMgr:addEventListener("exitGame",function()
    M.cleanUp()
end)
M.triggerEvent = {
    LevelUp = "LevelUp"
}
M.tmCallback = {}

function M.init(  )
	M.scheduler = require('framework.scheduler').scheduleUpdateGlobal(function ( dt )
        GameMessage:dispatchEvent{
            name = GameMessage.MessageName.update,
            data = dt,
        }
    end)
    M.Timescheduler = require('framework.scheduler').scheduleGlobal(function ( dt )
        GameMessage:dispatchEvent{
            name = GameMessage.MessageName.time,
            data = dt,
        }
    end,1)
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