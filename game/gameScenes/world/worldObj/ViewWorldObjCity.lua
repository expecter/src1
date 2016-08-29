-- 世界地图玩家对象
-- Author: LittleWhite
-- Date: 2016-06-24 12:16:46
--
local ViewWorldObj = import(".ViewWorldObj")
local ViewCityWarCity = require("game.gameScenes.world.citywar.ViewCityWarCity")

local M = class(...,ViewWorldObj)

function M:ctor(params) 
	M.super.ctor(self,params)
end

-- overwrite
function M:initView()
	if self.cmdWorldObj == nil then return end

	self.owner = CCBReader.load("ccbi_world_city")
	self:addChild(self.owner)
	
	self.viewCityWarCity = ViewCityWarCity.new{}
	self.owner.nodeIcon:addChild(self.viewCityWarCity)

	local x,y = self:getMapPos()
    self:setAnchorPoint(cc.p(0.5,0.5))
    self:setPosition(cc.p(x,y))

	self:updateView()
end

-- overwrite
function M:updateView()	
	local cityId = self.cmdWorldObj.npcCityId
	local refCity = ref.RefCity.getRef{ npcCityId = cityId }
	local cmdWorldObjOwnerInfo = self.cmdWorldObj.cmdWorldObjOwnerInfo
 
	self.owner.ccLabelName:setString(refCity.name)

	local playerId = 0
	local campId = 0

	if cmdWorldObjOwnerInfo then
		playerId = cmdWorldObjOwnerInfo.playerId
		local refCamp = ref.RefCamp.getRef{ provinceId = cmdWorldObjOwnerInfo.provinceId }
		campId = refCamp.campId
	end

	-- 由于与名城数据不一致，做数据转换
	local cmdCityBattleInfo = {
		cityId = cityId,
		playerId = playerId,
		campId = campId,
		isFire = self.cmdWorldObj.isFire
	}

	self.viewCityWarCity:onUpdate(cmdCityBattleInfo)
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