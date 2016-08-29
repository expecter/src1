-- 世界地图玩家对象
-- Author: LittleWhite
-- Date: 2016-06-24 12:16:46
--
local ViewWorldObj = import(".ViewWorldObj")

local M = class(...,ViewWorldObj)

function M:ctor(params) 
	M.super.ctor(self,params)
end

-- overwrite
function M:initView()
	if self.cmdWorldObj == nil then return end

	self.owner = CCBReader.load("ccbi_world_castle")
	self:addChild(self.owner)
	
	local x,y = self:getMapPos()
    self:setAnchorPoint(cc.p(0.5,0.5))
    self:setPosition(cc.p(x,y))

	self:updateView()
end

-- overwrite
function M:updateView()
	local cmdWorldObjOwnerInfo = self.cmdWorldObj.cmdWorldObjOwnerInfo
	if cmdWorldObjOwnerInfo then
		self.owner.ccLabelName:setString(cmdWorldObjOwnerInfo.playerName)
	end
end

-- overwrite
function M:getMapPos()
	local x,y = self.mapLoader:RCToCenterPoint(self.r,self.c)
	y = y - self.mapLoader.th*0.5
	return x,y
end

-- overwrite
function M:containsPoint(r,c)
	if r >= self.r and r - self.r <= 1 and c >= self.c and c - self.c <= 1 then return true end
	return false
end

return M