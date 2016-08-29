-----------------------------------------------------------------------------------------------  
-- @description 地图格子
-- @author  郑泽森
-- @coryright  蜂鸟工作室
-- @release  2015/4/1
--------------------------------------------------------------------------------------------
local ViewWorldMapTile = import(".ViewWorldMapTile")
local ViewWorldObjResource = import(".worldObj.ViewWorldObjResource")
local _mapLoader = import(".MapLoader").getInstance()

local M_ZORDER_TILE = 1
local M_ZORDER_RESOURCE = 2

local M = class(...,function()
    return display.newNode()
end)

function M:ctor(params)
	self:initData(params)
	self:initView()
end

function M:initData( params )
	self.r = params.r
	self.c = params.c
	self.datas = params
end

function M:initView()
	self.viewWorldMapTile = ViewWorldMapTile.new(self.datas)
	--初始化格子中的地图
	self:addChild(self.viewWorldMapTile,M_ZORDER_TILE)
	--初始化格子中的资源
	self:initResoure()
end

function M:initResoure()

	local stamps_gid = _mapLoader:getGIDAt("stamps",cc.p(self.r,self.c))
	if stamps_gid ~= 0 then return end

	-- local index = _mapLoader:getIndexByRC(self.r, self.c)
	-- local cmdResource = GameObjectMgr.ObjWorld.getCmdWorldObjByPos(index)

	-- if cmdResource and cmdResource.enumWorldObjType == "WT_RESOURCE" then
	-- 	self.viewWorldObjResource = ViewWorldObjResource.new{
	-- 		cmdWorldObj = cmdResource
	-- 	}

	-- 	self:addChild(self.viewWorldObjResource,M_ZORDER_RESOURCE)
	-- end
end

return M