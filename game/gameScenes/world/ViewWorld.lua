-----------------------------------------------------------------------------------------------  
-- @description 世界地图对象(地表,城堡，资源)
-- @author  郑泽森
-- @coryright  蜂鸟工作室
-- @release  2016/4/1
--------------------------------------------------------------------------------------------
local MapLoader = import(".MapLoader")
local ViewWorldMap = import(".ViewWorldMap")
---------- 层次布局ZOrder
-- 地图，建筑，野怪，行军路线，部队，操作菜单
-------------------------------------------------------------------------------------
--地图层次
local M_ZORDER_MAP = 1
local M_ZORDER_PLATE = 2
local M_ZORDER_OBJ = 3
local M_ZORDER_MARCH = 4
local M_ZORDER_MENU = 5

local M = class(...,function()
    return display.newNode()
end)

function M:ctor(params) 
	self:initData(params)
    self:initView()
end

function M:initData(params)
	-- 地图(地表，挂件)
    self.viewWorldMap = nil 
	self.mapLoader = MapLoader.getInstance()
    self.viewArmyPath = nil
    self.tmAddObj = {}
    self.tmMapObj = {}
    self.tlViewPlate = {}
end

function M:initView()
    -- 地图上的格子
    self.viewWorldMap = ViewWorldMap.new()
    self:addChild(self.viewWorldMap,M_ZORDER_MAP)

    local width,height = self.mapLoader:getContentSize()
    self:setContentSize(width,height)
end
function M:isUpdateMap()
    local center_pos = self:convertToNodeSpace(cc.p(display.width*0.5,display.height*0.5))

    -- 地图坐标系(0,0)
    local or_pos = self:convertToNodeSpace(cc.p(0,0))

    local half_width = math.abs(center_pos.x - or_pos.x)
    local half_height = math.abs(center_pos.y - or_pos.y)

    if self.viewWorldMap.curCenterPos then
        local distance = cc.pGetDistance(center_pos,self.viewWorldMap.curCenterPos)
        local move_x = math.abs(self.viewWorldMap.curCenterPos.x - center_pos.x)
        local move_y = math.abs(self.viewWorldMap.curCenterPos.y - center_pos.y)
        -- 划动过半屏才刷新
        if move_x < half_width and move_y < half_height then return false end
    end
    return true
end

function M:updateWorld()
    self.viewWorldMap:updateMap()

    local center_pos = self:convertToNodeSpace(cc.p(display.width*0.5,display.height*0.5))
    -- 地图坐标系(0,0)
    local or_pos = self:convertToNodeSpace(cc.p(0,0))

    local half_width = math.abs(center_pos.x - or_pos.x)
    local half_height = math.abs(center_pos.y - or_pos.y)

    if self.curCenterPos then
        local distance = cc.pGetDistance(center_pos,self.curCenterPos)
        local move_x = math.abs(self.curCenterPos.x - center_pos.x)
        local move_y = math.abs(self.curCenterPos.y - center_pos.y)
        -- 划动过半屏才请求数据
        if move_x < half_width and move_y < half_height then return end
    end

    self.curCenterPos = center_pos 
end
return M