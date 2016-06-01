--
-- Author: Your Name
-- Date: 2016-05-12 14:48:25
--
local M = class(...,component.componentBase)

function M:ctor( data )
    params = {
        name = "model_npc",
        depends = {'cocos_node'},
    }
    M.super.ctor(self,params)
end

function M:bind( object )
    self.object = object
    self.TlEnemy = {}
    object:bindMethod(self, "initView", self.initView)
    object:bindMethod(self, "getRanPos", self.getRanPos)
end
function M:initView( object )
	for i=1,10 do
    	self:createNpc(object,math.random(1,display.width),math.random(1,display.height))
    end
end
function M:createNpc( object,x,y )
    local npcobject = Object.new()    
    npcobject:bindComponent("enemy_enobject",{})
    npcobject:initView(object:getView(),x,y)
    table.insert(self.TlEnemy,npcobject)
end
function M:getRanPos(  )	
	return cc.p(self.TlEnemy[math.random(1,10)]:getPos())
end
return M