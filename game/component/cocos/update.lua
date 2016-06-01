--
-- Author: Your Name
-- Date: 2016-05-12 14:48:25
--
local M = class(...,component.componentBase)

function M:ctor(  )
	params = {
        name = "cocos_update",
        depends = {'cocos_node'},
    }
    M.super.ctor(self,params)
end

function M:bind( object )
	object:bindMethod(self, "initView", self.initView)
	object:bindMethod(self, "update", self.update)
end
function M:initView( object)
	-- self:startUpdate(object)
end
function M:startUpdate( object )
	local node =object:getView()
	node:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT,handler(object, object.update))
	node:scheduleUpdate()
	self.time = 1
end
function M:update(  )
	print("update111")
end
function M:update1(  )
	self.time = self.time+1
	print(self.time)
end

return M