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
		{
			_type = "ui_mutiViewComponent",
		},
	}
end

function M:enterView(  )
	for i,v in ipairs(self.tlEventName) do
		self.target:addListener(v,function ( cmdX )
			-- if cmdX.data.name ~= self.btnName then
			-- 	return
			-- end
			local index = cmdX.data.index
			self.target:switchTo(index)
		end)
	end	
end

function M:exitView(  )
	
end

function M:updateView(  )
end

return M