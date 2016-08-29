-- 世界地图对象基类
-- Author: LittleWhite
-- Date: 2016-06-24 12:16:46
--
local M = class(...,function()
    return display.newNode()
end)

function M:ctor(params) 
	params = params or {}
	self.mapLoader = require("game.gameScenes.world.MapLoader").getInstance()
	
	self:setData(params.cmdWorldObj)
	self:initView()
    self.tlListener = {}
    self:initListener()
end

-- virtual function
function M:setData(cmdWorldObj)
	self.cmdWorldObj = cmdWorldObj
	self.objId = cmdWorldObj.objId
	self.enumWorldObjType = cmdWorldObj.enumWorldObjType
	local r,c = self.mapLoader:getRCByIndex(cmdWorldObj.pos)
	self.r = r
	self.c = c
end

-- virtual function
function M:initListener()
	cc.EventProxy.new(GameObjectMgr.ObjWorld,self):addEventListener(GameObjectMgr.ObjWorld.EVENT_WORLD_MAPOBJ_SELECTED,function(event)
        local objId = event.data.objId
        if objId == self.objId then
        	if self.owner.ccImgName then self.owner.ccImgName:setVisible(false) end
        end
    end)

    cc.EventProxy.new(GameObjectMgr.ObjWorld,self):addEventListener(GameObjectMgr.ObjWorld.EVENT_WORLD_MENU_DESTROY,function(event)
        if self.owner.ccImgName then self.owner.ccImgName:setVisible(true) end
    end)
end

-- virtual function
function M:onCleanup()

end

-- virtual function
function M:initView()

end

-- virtual function
function M:onUpdate(cmdWorldObj)
	self:setData(cmdWorldObj)
	self:updateView()
end

-- virtual function
function M:updateView()

end

-- virtual function 返回世界位置
function M:getMapPos()
	return self.mapLoader:RCToCenterPoint(self.r,self.c)
end

-- virtual function 判断是否击中
function M:containsPoint(r,c)
	if r == self.r and c == self.c then return true end
end

return M