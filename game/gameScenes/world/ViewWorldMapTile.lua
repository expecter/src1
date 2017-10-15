-----------------------------------------------------------------------------------------------  
-- @description 格子中的地图tile   只与静态地图中的显示有关
-- @author  郑泽森
-- @coryright  蜂鸟工作室
-- @release  2016/4/1
--------------------------------------------------------------------------------------------
local M_ZORDER_SURFACE = 1
local M_ZORDER_EGDE = 2
local M_ZORDER_STAMPS = 3
local M_ZORDER_DESC = 4
local _mapLoader = import(".MapLoader").getInstance()
local RefTileProperty = require("game.ref.RefTileProperty")
local M = class(...,function()
    return display.newNode()
end)

function M:ctor(params) 
	self:initData(params)
	self:initView()
end

function M:initData( params )
	self.bShow = params.bShow
	self.r = params.r
	self.c = params.c
end

function M:initView()

	self:addSurface()

	self:performWithDelay(function()
		self:addStamps()
	end, 0)

	self:performWithDelay(function()
		self:addEdge()
	end, 0.1)
	
	if self.bShow then
		self:addDesc()
	end
end

function M:addSurface()
	local surface_gid = _mapLoader:getGIDAt("surface",cc.p(self.r,self.c))

	if surface_gid ~= 0 then
		local refTileProperty = RefTileProperty.getRef{ gid = surface_gid}

		local surface_sprite = self:getTileSprite(refTileProperty)
		if surface_sprite then
	     	self:addChild(surface_sprite,M_ZORDER_SURFACE)
	 	end
	end
end

function M:addEdge()
	local edge_gid = _mapLoader:getGIDAt("edge",cc.p(self.r,self.c))
	if edge_gid ~= 0 then
		local refTileProperty = RefTileProperty.getRef{ gid = edge_gid }

		if refTileProperty.countrytype == 0 then
		 	local edge_sprite = self:getTileSprite(refTileProperty)
		 	if edge_sprite then
		 		self:addChild(edge_sprite,M_ZORDER_SURFACE)
		 	end
		end
	end
end

function M:addStamps()
	local stamps_gid = _mapLoader:getGIDAt("stamps",cc.p(self.r,self.c))
	if stamps_gid ~= 0 then
		local refTileProperty = RefTileProperty.getRef{ gid = stamps_gid }
		
		if refTileProperty.isccb ~= 0 then
			if refTileProperty.ccb ~= "0" then
				self.owner = CCBReader.load(refTileProperty.ccb)
				if refTileProperty.isccb == 2 then
					self.owner:setPosition(cc.p(0,-_mapLoader.th * 1.5))
				else
					self.owner:setPosition(cc.p(0,0))
				end
				self:addChild(self.owner,M_ZORDER_STAMPS)
			end
		else
			local edge_sprite = self:getTileSprite(refTileProperty)
		 	if edge_sprite then
		 		self.owner = edge_sprite
		 		self:addChild(self.owner,M_ZORDER_STAMPS)
		 	end
		end
	end
end

function M:addDesc()
	local x,y = _mapLoader:RCToCenterPoint(self.r,self.c)
    local text = string.format([[(%s,%s)]],self.r,self.c)
    local label = display.newTTFLabel{
        text = text,
        size = 18,
    }
    label:setAnchorPoint(cc.p(0.5,0.5))
    self:addChild(label,M_ZORDER_DESC)
end

function M:setStampsVisible(bShow)
	if self.owner then
		local stamps_gid = _mapLoader:getGIDAt("stamps",cc.p(self.r,self.c))
		if stamps_gid ~= 0 then
	        if RefTileProperty.getRef{gid = stamps_gid}.validbuild ~= 0 then 
	          	self.owner:setVisible(bShow)
	        end
    	end
	end
end

function M:getTileSprite(refTileProperty)
	if not refTileProperty then return end

	local path = refTileProperty:getImage()	
 	local frame = display.newSpriteFrame(path)
 	local sprite
 	if frame then
    	-- sprite = cc.FNSpriteTiled:createWithSpriteFrame(frame)
	    sprite = cc.Sprite:createWithSpriteFrame(frame)
	    sprite:getTexture():setAliasTexParameters()
	    sprite:setPosition(cc.p(0,0))
    end
	return sprite
end

return M