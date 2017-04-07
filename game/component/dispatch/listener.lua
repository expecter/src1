--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( target ,params)
	self.target = target
end
function M:addEventListener( target,listenName,callback )
	ObjMessage:addEventListener(listenName,function(cmdX)
		if callback then
			callback(cmdX)
		end
	end)
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"addEventListener")
end
return M