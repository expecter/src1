-- MapLoader 单例
-- Author: LittleWhite
-- Date: 2016-01-06 14:29:53
local M = class(...)

local m_instance = nil

function M.new()
    m_instance = setmetatable({}, M)
    m_instance.class = M
    m_instance:ctor()
    M.new = function()
        error("MapLoader can't direct call new()!")
    end
    return m_instance
end

function M.getInstance()
    if m_instance == nil then
        m_instance = M.new()
    end
    return m_instance
end

function M:ctor()
    self:load()
end

function M:load()
	self.loader = cc.FNMapLoader:create("uimap/world/map.tmx")

	self.loader:retain()

	local mapSize = self.loader:getMapSize()
    local tileSize = self.loader:getTileSize()

    self.factor = mapSize.height / (mapSize.height + mapSize.width)
    self.tw = tileSize.width 
    self.th = tileSize.height  

    self.mw = mapSize.width
    self.mh = mapSize.height 

    self.mapOrientation = self.loader:getMapOrientation()

    --原点坐标(r,c = 0,0)
    -- map.ox = map.mw * map.tw * map.factor
    self.ox = self.mw * self.tw * 0.5
    self.oy = self.mh * self.th
end

function M:getContentSize()
    return self.mw*self.tw,self.mh*self.th
end

-- 获取瓦片GID
function M:getGIDAt(layerName,point)
    if not self:isOutside(point.x,point.y) then
        return self.loader:getGIDAt(layerName,point)
    end
end

-- 获取tile数组主键
function M:getIndexByRC(r,c)
    if r < 0 then r = r + self.mw end
    if r > self.mw - 1 then r = r - self.mw end
    if c < 0 then c = c + self.mh end
    if c > self.mh -1 then c = c - self.mh end
    return r + c * self.mw,r,c
end

--通过主键获得行,列坐标
function M:getRCByIndex(index)
    local r = index%self.mw
    local c = math.floor(index/self.mw)
    return r,c
end

----菱形地图行,列坐标转换为地图的像素坐标 对齐点 anchor(0.5,1)
function M:RCToPoint(r,c)
    local x = self.ox+(r-c)*self.tw*0.5
    local y = self.oy-(r+c)*self.th*0.5
    return x,y
end

---菱形地图行,列坐标转换为地图的像素坐标 中心点 anchor(0.5,0.5) 
function M:RCToCenterPoint(r,c)
    local x,y = self:RCToPoint(r,c)
    return x, y-self.th*0.5
end

---菱形地图行,列坐标转换为地图的像素坐标 原点 anchor(0,0)
function M:RCToOriginPoint(r,c)
    local x,y = self:RCToPoint(r,c)
    return x-self.tw*0.5,y-self.th
end

----地图的像素坐标转换到菱形地图行,列坐标
function M:pointToRC(x,y)
    local r = -1*((y-self.oy)/(self.th/2)-(x-self.ox)/(self.tw/2))/2
    local c = -1*(((x-self.ox)/(self.tw/2)) + ((y-self.oy)/(self.th/2)))/2
    return math.floor(r),math.floor(c)
end

--获取两点之间的距离
function M:getDistanceByRC(r1,c1,r2,c2)
     local x1,y1 = self:RCToCenterPoint(r1, c1)
     local x2,y2 = self:RCToCenterPoint(r2, c2)
     return cc.pGetDistance(cc.p(x1,y1),cc.p(x2,y2))
end

-- 设置屏幕可视区域
function M:setVisibleRect(or_pos,end_pos)
    local width = math.abs(end_pos.x - or_pos.x)
    local height = math.abs(end_pos.y - or_pos.y)
    self.or_pos = or_pos
    self.end_pos = end_pos
    self.visibleRect = cc.rect(or_pos.x,or_pos.y,width,height)
end

--获取当前rect坐标
function M:getVisibleRectPoint()
    return self.or_pos,self.end_pos
end

function M:isVisibleByPos(point)
    if not self.visibleRect then return false end
    return cc.rectContainsPoint(self.visibleRect,point)
end

-- 获取某r,c是否在屏幕可视范围内
function M:isVisibleByRC(r,c)
    local x,y = self:RCToCenterPoint(r,c)
    return self:isVisibleByPos(cc.p(x,y))
end

-- 是否越界判断
function M:isOutside(r,c)
    return r < 0 or r > self.mw -1  or c < 0 or c > self.mh - 1
end

-- 获取某地块是否能放资源
function M:getResourceValidBuild(r,c)

    local edge_gid = self:getGIDAt("edge",cc.p(r,c))
    if edge_gid ~= 0 then
        if ref.RefTileProperty.getRef{gid = edge_gid}.validbuild ~= 2 then 
            return false 
        end
    end

    local stamps_gid = self:getGIDAt("stamps",cc.p(r,c))

    if stamps_gid ~= 0 then
        if ref.RefTileProperty.getRef{gid = stamps_gid}.validbuild ~= 2 then 
            return false 
        end
    end

    local surface_gid = self:getGIDAt("surface",cc.p(r,c))
    if surface_gid ~= 0 then
        if ref.RefTileProperty.getRef{gid = surface_gid}.validbuild ~= 2 then 
            return false 
        end
    end

    return true
end

-- 获取某地块是否能迁城
function M:getCityValidBuild(r,c)
    local edge_gid = self:getGIDAt("edge",cc.p(r,c))
    if edge_gid ~= 0 then
        if ref.RefTileProperty.getRef{gid = edge_gid}.validbuild == 0 then return false end
    end

    local stamps_gid = self:getGIDAt("stamps",cc.p(r,c))

    if stamps_gid ~= 0 then
        if ref.RefTileProperty.getRef{gid = stamps_gid}.validbuild == 0 then return false end
    end

    local surface_gid = self:getGIDAt("surface",cc.p(r,c))
    if surface_gid ~= 0 then
        if ref.RefTileProperty.getRef{gid = surface_gid}.validbuild == 0 then return false end
    end
    return true
end

-- 获取国家Id
function M:getCountryType(r,c)
    local edge_gid = self:getGIDAt("edge",cc.p(r,c))
    if edge_gid ~= 0 then
        local refTileProperty = ref.RefTileProperty.getRef{gid = edge_gid}
        return refTileProperty.countrytype
    end
    return 0 
end

-- r1为矩形左下角 ，r3为矩形右上角
function M:isLineIntersectRect(start_p,end_p, r1, r3)
    local r2=cc.p(r1.x,r3.y)
    local r4=cc.p(r3.x,r1.y)
    local a = start_p.y - end_p.y
    local b = end_p.x -start_p.x
    local c = start_p.x* end_p.y - end_p.x* start_p.y

    local left = r2.x
    local top = r2.y
    local right = r4.x
    local bottom = r4.y

    -- 思路:先看线段所在直线是否与矩形相交，如果不相交则必为 “Ｆ”，
    -- 如果相交，则看线段的两个点是否在矩形的同一边（即两点的 x（y)  坐标都比矩形的小 x(y) 坐标小，或者大）,
    -- 若在同一边则为“Ｆ”，否则就是相交的情况。
    if ((a* left + b*top + c>=0 and a* right + b* bottom +c<=0) or
        (a* left + b*top + c<=0 and a* right + b* bottom +c>=0) or
        (a* left + b*bottom +c>=0 and a* right + b* top  +c<=0) or
        (a* left + b*bottom +c>=0 and a* right + b* top  +c<=0) )then
        if (left > right) then
            local l=left
            left=right
            right=l
            -- swap(left,right)
        end
        if (top < bottom) then
            local b=bottom
            bottom=top
            top=b
            -- swap(top, bottom)
        end
        if ((start_p.x < left and end_p.x < left) or
            (start_p.x > right and end_p.x < left) or
            (start_p.y > top and end_p.y > top) or
            (start_p.y < bottom and end_p.y < bottom)) then
            return false
        else
            return true
        end
    else
        return false
    end
end

--根据两点获取向量角度
function M:getAngleTwoPoint(starp,endp)
    local vector=cc.p(starp.x-endp.x,starp.y-endp.y)
    local radians = math.atan2(vector.y,vector.x)
    local rotate=-1 * radians*57.29577951
    return rotate-180
end

--根据两点按照一定长度分割为多个点
function M:getPointsByToPointAndLength(stp,etp,length)
    local points = {}
    local pl = length
    local l = cc.pGetDistance(stp,etp)
    local pc = math.floor(l/pl)
    for i=1,pc do
        local point=cc.p(((pc-i)*stp.x+i*etp.x)/pc,
                         ((pc-i)*stp.y+i*etp.y)/pc)
        points[#points+1]=point
    end
    return points
end

return M
