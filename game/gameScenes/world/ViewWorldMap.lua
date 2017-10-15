-----------------------------------------------------------------------------------------------  
-- @description 世界地图 地表
-- @author  郑泽森
-- @coryright  蜂鸟工作室
-- @release  2016/4/1
--------------------------------------------------------------------------------------------
local MapLoader = import(".MapLoader")
local ViewWorldGrid = import(".ViewWorldGrid")
local ViewWorldMapTile = import(".ViewWorldMapTile")
local M = class(...,function()
    return display.newNode()
end)

function M:ctor(params)
    self:initData(params)

    local width,height = self.mapLoader:getContentSize()
    self:setContentSize(width,height)

    -- cc.EventProxy.new(GameObjectMgr.ObjWorld,self):addEventListener(GameObjectMgr.ObjWorld.EVENT_WORLD_SHOWTILE, function(event)
    --     self:setShowTilePos(event.data)
    -- end)
end

function M:initData(params)
    self.mapLoader = MapLoader.getInstance()
    self.curtmPos = {}
    self.tmPos = {}
    self.tmTile = {}
    self.bShowTile = true
    self.isRequstCity = true
    self.initGrids = {}
end

-- 刷新显示的坐标点
function M:updateTmPos()
    -- 服务器热点区域数据
    local centerRC = self:getCenterPos()
    local interval = 9
    local beginR = centerRC.x - interval <0 and 0 or centerRC.x - interval
    local beginC = centerRC.y - interval <0 and 0 or centerRC.y - interval
    local endR = centerRC.x + interval >(self.mapLoader.mw -1) and (self.mapLoader.mw-1) or centerRC.x + interval
    local endC = centerRC.y + interval >(self.mapLoader.mh -1) and (self.mapLoader.mh-1) or centerRC.y + interval

    local or_pos = self:convertToNodeSpace(cc.p(-display.width*0.5 - self.mapLoader.tw * 0.5,-display.height*0.5-self.mapLoader.th * 0.5))
    local end_pos = self:convertToNodeSpace(cc.p(display.width*1.5 + self.mapLoader.tw * 0.5,display.height*1.5 + self.mapLoader.th * 0.5))
    self.mapLoader:setVisibleRect(or_pos,end_pos)
    -- 屏幕实际区域
    local disor_pos,disend_pos

    -- if self.curCenterPos then
    --     disor_pos = self:convertToNodeSpace(cc.p(-self.mapLoader.tw,-self.mapLoader.th))
    --     disend_pos = self:convertToNodeSpace(cc.p(display.width + self.mapLoader.tw,display.height + self.mapLoader.th))
    -- else
    disor_pos = self:convertToNodeSpace(cc.p(-self.mapLoader.tw*1.5,-self.mapLoader.th*1.5))
    disend_pos = self:convertToNodeSpace(cc.p(display.width + self.mapLoader.tw*1.5,display.height + self.mapLoader.th*1.5))
    -- end
    local rect = cc.rect(disor_pos.x,disor_pos.y,math.abs(disend_pos.x - disor_pos.x),math.abs(disend_pos.y - disor_pos.y))
    local tmPos = {}
    for i = beginR,endR do
        for j = beginC,endC do
            -- 二次过滤
            local point = cc.p(self.mapLoader:RCToCenterPoint(i,j))
            -- print("point",point.x,point.y)
            if cc.rectContainsPoint(rect,point) then
                local idx = self.mapLoader:getIndexByRC(i,j)
                tmPos[idx] = { r = i ,c = j }
            end
        end
    end

    -- dump(tmPos,"tmPos:")
    self.tmPos = tmPos 
end

function M:updateMap() 
    local function helper()
        self:updateTmPos()
        self:onUpdate()
    end

    if not self.curCenterPos then
        helper()    
    end

    local cur_center = self:getCenterPos()
    local last_center = cc.p(self.mapLoader:pointToRC(self.curCenterPos.x, self.curCenterPos.y))

    if cur_center.x ~= last_center.x or cur_center.y ~= last_center.y then
        helper() 
    end
end

-- function M:reqGridCity()
--     if self.isRequstCity then
--         local centerRC = self:getCenterPos()
--         GameObjectMgr.ObjWorld.reqCmdQueryWorldObjInSight(centerRC.x,centerRC.y)
--         self.isRequstCity =false  
--     end 
-- end

-- 获取中心点坐标
function M:getCenterPos()
    local r,c = self:pixelToRC(display.width*0.5, display.height*0.5)
    return cc.p(r,c)
end

--屏幕坐标转换为地图行列坐标
function M:pixelToRC(x,y)
    local point = self:convertToNodeSpace(cc.p(x,y))
    return self.mapLoader:pointToRC(point.x, point.y)
end

function M:onUpdate()
    for k,v in pairs(self.curtmPos) do
        if self.tmPos[k] == nil then
            if self.tmTile[k] then
                self.tmTile[k]:removeFromParent() 
                self.tmTile[k] = nil
            end
        end
    end

    -- local time1=os.clock()*1000
    for idx, pos in pairs(self.tmPos) do
        if self.curtmPos[idx] == nil then
            self:addTile(pos.r,pos.c,idx)
        end
    end
    -- local time2=os.clock()*1000
    -- print("addTile-------------------------------------=:",time2-time1)
    self.curtmPos = self.tmPos
    --保留上次刷新的中心点
    self.curCenterPos = self:convertToNodeSpace(cc.p(display.width*0.5,display.height*0.5))
end
-- M.Gid = {
--     surface = 1,
--     stamps = 2,
--     -- jianzhu=3,
--     -- resource = 3,
-- }
--添加格子
function M:addTile(r,c,idx)
    -- print("addTile")
    local viewWorldMapTile = ViewWorldMapTile.new{
        bShow = self.bShowTile,
        r = r,
        c = c,
    }

    local pos_x,pos_y = self.mapLoader:RCToCenterPoint(r,c)

    viewWorldMapTile:setAnchorPoint(cc.p(0.5,0.5))
    viewWorldMapTile:setPosition(cc.p(pos_x,pos_y))

    self.tmTile[idx] = viewWorldMapTile
    self:addChild(viewWorldMapTile,idx)
end

function M:cleanAllTile()
    for k,v in pairs(self.curtmPos) do
        if self.tmTile[k] then 
            self.tmTile[k]:removeFromParent() 
            self.tmTile[k] = nil
        end
    end
    self.curtmPos = {}
end

function M:setShowTilePos(bValue)
    self.bShowTile = bValue
    self:cleanAllTile()
    self:onUpdate()
end

return M