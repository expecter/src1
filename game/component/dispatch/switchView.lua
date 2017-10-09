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
	self.target:addListener("",function ( index )
		self.target:switchto(index)
	end)
end

function M:exitView(  )
	
end

function M:updateView(  )
end

return M