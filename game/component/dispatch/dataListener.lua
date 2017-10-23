--
-- Author: Your Name
-- Date: 2017-10-09 11:52:27
--
local M = class(...,componentBase)
function M:ctor(params)
	M.super.ctor(self,params)
	self:setData(params)
end

function M:setData( params )
	self.object = params.object
	self.tlEventName = params.tlEventName or {}
	-- self.btnName = params.btnName or ""
end

function M:getDepends(  )
	return {
		{
			_type = "dispatch_listener",
		},
	}
end

function M:enterView(  )
	-- self.target:addListener(GameMessage.MessageName.updateData,function ( cmdX )
	-- 	if cmdX == object then
	-- 		--todo
	-- 	end
	-- end)	
end

function M:exitView(  )
	
end

function M:updateView(  )
end

return M