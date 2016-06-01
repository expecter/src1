local Vector = {x = 0, y = 0}
Vector.__index = Vector
function Vector.new(x, y)
    local self = setmetatable({}, Vector)
    if (type(x) == "table") then
        for k, v in pairs(x) do
            self[k] = v
        end
    elseif (type(x) == "number" and type(y) == "number") then
        self['x'] = x
        self['y'] = y
    end
    return self
end

-- 两点相加
function Vector.__add(p1, p2)
    local p3 = Vector.new({x = p1.x + p2.x, y = p1.y + p2.y})
    return p3
end

-- 两点相减
function Vector.__sub(p1, p2)
    return Vector.new({x = p1.x - p2.x, y = p1.y - p2.y})
end

function Vector.__mul(p1, p2)
    if type(p2) == "number" then
        return Vector.new({x = p1.x * p2, y = p1.y * p2})
    end
    if type(p1) == "number" then
        return Vector.new({x = p2.x * p1, y = p2.y * p1})
    end
    return Vector.new({x = p2.x * p1.x, y = p2.y * p1.y})
end

function Vector.__div(p1, num)
    return Vector.new({x = p1.x / num, y = p1.y / num})
end

function Vector.__tostring(p1)
    return "x="..p1.x.." y="..p1.y
end

-- 相等
function Vector.__eq(p1, p2)
    return p1.x == p2.x and p1.y == p2.y
end
function Vector:Zero (  )
    self.x = 0
    self.y = 0
end
function Vector:isZero (  )
    return self.x ==0 and self.y ==0
end
function Vector:Length (  )
    return math.sqrt(self.x*self.x+self.y*self.y)
end
function Vector:LengthSq (  )
    return (self.x*self.x+self.y*self.y)
end

function Vector:Dot ( point )
    return self.x*point.x+self.y*point.y
end
function Vector:Sign ( point )
    if self.y*point.x>self.x*point.y then
        return -1
    else
        return 1
    end
end
function Vector:Perp ( )
    return Vector.new(-self.y,self.x)
end
function Vector:Distance ( point)
    local y = point.y-self.y
    local x = point.x-self.x
    return math.sqrt(y*y+x*x)
end
function Vector:DistanceSq ( point)
    local y = point.y-self.y
    local x = point.x-self.x
    return (y*y+x*x)
end

function Vector:Truncate ( max)
    if self:Length()>max then
        self:Normalize()
        self = self*max
    end
end

function Vector:Reflect ( norm)
    self = self+norm:GetReverse()*2*self:Dot(norm)
end

function Vector:GetReverse ( )
    return Vector.new(-self.x,-self.y)
end

function Vector:Normalize ( )
    local vector_length = self:Length()
    if (vector_length>1) then
        self.x = self.x/vector_length
        self.y = self.y/vector_length
    end
end

function Vector.Vec2DNormalize ( vec)
    local v = Vector.new(vec)
    local vector_length = v:Length()
    if (vector_length>1) then
        v.x = v.x/vector_length
        v.y = v.y/vector_length
    end
    return v
end

function Vector.Vec2DDistance( v1,v2 )
    local y = v2.y-v1.y
    local x = v2.x-v1.x
    return math.sqrt(y*y+x*x)
end

function Vector.Vec2DDistanceSq( v1,v2 )
    local ySeparation = v2.y-v1.y
    local xSeparation = v2.x-v1.x
    return ySeparation*ySeparation+xSeparation*xSeparation
end

function Vector:Vec2DLength(  )
    return self.x*self.x+self.y*self.y
end

function Vector:Vec2DLengthSq( v )
    return v.x*v.x+v.y*v.y
end
function Vector:POINTtoVector( p )
    return Vector.new(p.x,p.y)
end
function Vector:VectorToPOINTS(  )
    return cc.p(self.x,self.y)
end

function Vector:WrapAround( pos,MaxX,MaxY )
    if pos.x >MaxX then
        pos.x = 0
    end
    if pos.x <0 then
        pos.x = MaxX
    end
    if pos.y <0 then
        pos.y = MaxY
    end
    if pos.y>MaxY then
        pos.y = 0
    end
end

function Vector:NotInsideRegion( p,top_left,bot_rgt )
    return p.x<top_left.x or p.x>bot_rgt.x or p.y<top_left.y or p.y>bot_rgt.y
end

function Vector:InsideRegion( p,top_left,bot_rgt,right,bottom )
    if right~=nil and bottom~= nil then
        return not (p.x<top_left or p.x>right or p.y<bot_rgt or p.y>bottom)
    end
    return not (p.x<top_left.x or p.x>bot_rgt.x or p.y<top_left.y or p.y>bot_rgt.y)
end
function Vector:isSecondInFOVOfFirst( posFirst,facingFirst,posSecond,fov )
    local toTarget = Vector.Vec2DNormalize(posSecond - posFirst)
    return facingFirst:Dot(toTarget)>=math.cos(fov/2)
end
return Vector