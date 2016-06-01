--
-- Author: Your Name
-- Date: 2016-05-12 14:48:25
--
local M = class(...,component.componentBase)

function M:ctor( data )
    params = {
        name = "model_enemy",
        depends = {'cocos_layer'},
    }
    M.super.ctor(self,params)
end

function M:bind( object )
    self.object = object
    self.TlEnemy = {}
    object:bindMethod(self, "touchBegan", self.touchBegan)
    object:bindMethod(self, "touchMoved", self.touchMoved)
    object:bindMethod(self, "touchEnded", self.touchEnded)
end
function M:touchBegan( object,x,y )

    local enobject = Object.new()    
    enobject:bindComponent("enemy_enobject",{})
    enobject:initView(object:getView(),x,y)    
    enobject:getSpr():runAction(cc.MoveTo:create(2,(object:getRanPos())))
end
function M:touchMoved( object,x,y )
end
function M:touchEnded( object,x,y )
end
return M