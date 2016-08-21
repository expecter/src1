--
-- Author: Your Name
-- Date: 2016-07-22 23:10:58
--
local M = class("")
M.events = {
	Touch1 = "Touch1",
}
function M:ctor(  )
	
end

function M:initView( params ,parent)
	self.view = display.newNode()

	self:updateView(params)
	self:binding()
	return self.view
end

function M:updateView(params )
	self:setData(params)
	self.view:setVisible()
end
function M:binding(  )
	-- gameListener:addListener(self,function ( params )
	-- 	self:updateView(params)
	-- end,message)
	M:dispatch(data)
	
end
function M:childrenNode(  )
	local node = display.newNode()
	M:addListener(node,events,function (  )
		
	end)
	self:addChild(node)
end
function M:setData( params )
	if params then
		self.cmdData = params
	end
	
end
return M

