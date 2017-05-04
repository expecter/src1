--
-- Author: Your Name
-- Date: 2017-05-03 23:28:17
--
local M = class("componentBase")
function M:ctor( target ,params)
	self.target = target
	self:setData(params)
end

function M:setData(params )

end

function M:initView( target )
	print("AAAAAAAAAAAAAAAA")
end

function M:enterView( target )
end

return M