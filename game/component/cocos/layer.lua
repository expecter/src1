--
-- Author: Your Name
-- Date: 2016-05-12 14:48:25
--
local M = class(...,component.componentBase)

function M:ctor( data )
    params = {
        name = "cocos_layer",
        depends = {'cocos_node'},
    }
    M.super.ctor(self,params)
end

function M:bind( object )
    self.object = object
	object:bindMethod(self, "initView", self.initView)
    object:bindMethod(self, "touchBegan", self.touchBegan)
    object:bindMethod(self, "touchMoved", self.touchMoved)
    object:bindMethod(self, "touchEnded", self.touchEnded)
end
function M:initView( object,parent )
	self.touchLayer = display.newLayer()
	parent:addChild(self.touchLayer)
	self.touchLayer:addTouchEventListener(handler(self,self.onTouch), false, false)

    self.touchLayer:setTouchEnabled(true)
end
function M:onTouch( event,x,y )
    local tm = {
        began = function(x,y)
            self.object:touchBegan(x,y)
            return true
        end,
        moved = function ( x,y )
            self.object:touchMoved(x,y)
        end,
        ended = function(x,y)
            self.object:touchEnded(x,y)
        end,
    }
    return tm[event](x,y)
    
end
function M:touchBegan(  )
end
function M:touchMoved(  )
end
function M:touchEnded(  )
end
return M