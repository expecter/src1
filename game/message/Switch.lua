--
-- Author: Your Name
-- Date: 2017-04-17 10:14:06
--
local M = {}
local Switch = {}
function Switch.Login ( params )
	GameSceneMgr.replaceLayer("", userData)
end
local Push = {}
function Push.Panel( params )
	GameSceneMgr.pushLayer("", userData)
end

M:addEventListener("Switch",function ( cmdX )
    Switch[cmdX.name](cmdX)
end)
M:addEventListener("Push",function ( cmdX )
    Push[cmdX.name](cmdX)
end)
return M