--
-- Author: Your Name
-- Date: 2016-05-12 14:48:25
--
local M = class(...,component.componentBase)

function M:ctor( data )
    params = {
        name = "enemy_enobject",
    }
    M.super.ctor(self,params)
end

function M:bind( object )
    self.object = object
    object:bindMethod(self, "initView", self.initView)
    object:bindMethod(self, "getPos", self.getPos)
    object:bindMethod(self, "getSpr", self.getSpr)
end
function M:initView( object,parent,x,y )
	self.sprite = display.newSprite("EditBoxBg.png")
    self.sprite:setPosition(x,y)
    -- sprite:runAction(cc.MoveTo:create(2,cc.p(200,200)))
    parent:addChild(self.sprite)
end
function M:getPos(  )
	return self.sprite:getPosition()
end
function M:getSpr(  )
	return self.sprite
end
return M