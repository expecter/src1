-- 世界地图资源对象
-- Author: LittleWhite
-- Date: 2016-06-24 12:16:46
--
local ViewWorldObj = import(".ViewWorldObj")

local M = class(...,ViewWorldObj)

function M:ctor(params) 
	M.super.ctor(self,params)
end

function M:setData(cmdWorldObj)
	M.super.setData(self,cmdWorldObj)
	self.gid = self.mapLoader:getGIDAt("resource",cc.p(self.r,self.c))
end

function M:initView()
	self.owner = CCBReader.load("ccbi_world_resource")
	self:addChild(self.owner)

	self:updateView()
end

function M:updateView()
	local refTileProperty = ref.RefTileProperty.getRef{ gid = self.gid }
	self.owner.ccImgResource:setSpriteFrame(display.newSpriteFrame(refTileProperty:getImage()))

	self.owner.ccLabelLevel:setString(self.cmdWorldObj.level)
end

-- function M:onUpdate(cmdX)
-- 	self.cmdResourceGrid = cmdResourceGrid
-- 	self:updateView()
-- end

return M