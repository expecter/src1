--
-- Author: Your Name
-- Date: 2017-05-24 15:18:02
--按钮点击事件拆解
local M = {}

function M.onEventHandler( params )
	for i,v in ipairs(params) do
		if M[params.eventName] then
			M[params.eventName](params)
		end
	end
end

function M.callfunc( params )
	
end

function M.switchto( params )

end

function M.click( params )
	
end

function M.request( params )
	
end

return M