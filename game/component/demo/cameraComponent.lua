--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("cameraComponent")
function M:ctor( params)
	self:setData(params)
end
function M:setData(params )
end
function M:initView( target )
	self.map_ = target
	self.zooming_       = false
    self.scale_         = 1
    self.actualScale_   = 1
    self.offsetX_       = 0
    self.offsetY_       = 0
    self.offsetLimit_   = nil
    self.margin_        = {top = 0, right = 0, bottom = 0, left = 0}

    local width, height = target:getSize()
    local minScaleV     = display.height / height
    local minScaleH     = display.width / width
    local minScale      = minScaleV

    if minScaleH > minScale then minScale = minScaleH end
    self.minScale_ = minScale
    self:resetOffsetLimit()
end
--[[--

返回地图的边空

]]
function M:getMargin()
    return clone(self.margin_)
end

--[[--

设置地图卷动的边空

]]
function M:setMargin(top, right, bottom, left)
    if self.zooming_ then return end

    if type(top)    == "number" then self.margin_.top = top end
    if type(right)  == "number" then self.margin_.right = right end
    if type(bottom) == "number" then self.margin_.bottom = bottom end
    if type(left)   == "number" then self.margin_.left = left end
    self:resetOffsetLimit()
end

--[[--

返回地图当前的缩放比例

]]
function M:getScale()
    return self.scale_
end

--[[--

设置地图当前的缩放比例

]]
function M:setScale(scale)
    if self.zooming_ then return end

    self.scale_ = scale
    if scale < self.minScale_ then scale = self.minScale_ end
    self.actualScale_ = scale
    self:resetOffsetLimit()
    self:setOffset(self.offsetX_, self.offsetY_)

    local backgroundLayer = self.map_

    backgroundLayer:setScale(scale)
end

--[[--

动态调整摄像机的缩放比例

]]
function M:zoomTo(scale, x, y)
    self.zooming_ = true
    self.scale_ = scale
    if scale < self.minScale_ then scale = self.minScale_ end
    self.actualScale_ = scale
    self:resetOffsetLimit()

    local backgroundLayer = self.map_

    transition.removeAction(self.backgroundLayerAction_)

    self.backgroundLayerAction_ = transition.scaleTo(backgroundLayer, {scale = scale, time = 0.1})

    if type(x) ~= "number" then return end

    if x < self.offsetLimit_.minX then
        x = self.offsetLimit_.minX
    end
    if x > self.offsetLimit_.maxX then
        x = self.offsetLimit_.maxX
    end
    if y < self.offsetLimit_.minY then
        y = self.offsetLimit_.minY
    end
    if y > self.offsetLimit_.maxY then
        y = self.offsetLimit_.maxY
    end

    self.offsetX_, self.offsetY_ = x, y

    transition.moveTo(backgroundLayer, {
        x = x,
        y = y,
        time = 0.1,
        onComplete = function()
            self.zooming_ = false
        end
    })
end

--[[--

返回地图当前的卷动偏移量

]]
function M:getOffset()
    return self.offsetX_, self.offsetY_
end

--[[--

设置地图卷动的偏移量

]]
function M:setOffset(x, y, movingSpeed, onComplete)
    if self.zooming_ then return end

    if x < self.offsetLimit_.minX then
        x = self.offsetLimit_.minX
    end
    if x > self.offsetLimit_.maxX then
        x = self.offsetLimit_.maxX
    end
    if y < self.offsetLimit_.minY then
        y = self.offsetLimit_.minY
    end
    if y > self.offsetLimit_.maxY then
        y = self.offsetLimit_.maxY
    end

    self.offsetX_, self.offsetY_ = x, y

    if type(movingSpeed) == "number" and movingSpeed > 0 then
        transition.stopTarget(self.bgSprite_)
        local cx, cy = self.bgSprite_:getPosition()
        local mtx = cx / movingSpeed
        local mty = cy / movingSpeed
        local movingTime
        if mtx > mty then
            movingTime = mtx
        else
            movingTime = mty
        end

        transition.moveTo(self.bgSprite_, {
            x = x,
            y = y,
            time = movingTime,
            onComplete = onComplete
        })
    else
        self.map_:setPosition(x, y)
    end
end

--[[--

移动指定的偏移量

]]
function M:moveOffset(target,offsetX, offsetY)
    self:setOffset(self.offsetX_ + offsetX, self.offsetY_ + offsetY)
end

--[[--

返回地图的卷动限制

]]
function M:getOffsetLimit()
    return clone(self.offsetLimit_)
end

--[[--

更新地图的卷动限制

]]
function M:resetOffsetLimit()
    local mapWidth, mapHeight = self.target:getSize()
    self.offsetLimit_ = {
        minX = display.width - self.margin_.right - mapWidth * self.actualScale_,
        maxX = self.margin_.left,
        minY = display.height - self.margin_.top - mapHeight * self.actualScale_,
        maxY = self.margin_.bottom,
    }
end

--[[--

将屏幕坐标转换为地图坐标

]]
function M:convertToMapPosition(x, y)
    return (x - self.offsetX_) / self.actualScale_, (y - self.offsetY_) / self.actualScale_
end

--[[--

将地图坐标转换为屏幕坐标

]]
function M:convertToWorldPosition(x, y)
    return x * self.actualScale_ + self.offsetX_, y * self.actualScale_ + self.offsetY_
end

--[[--

将指定的地图坐标转换为摄像机坐标

]]
function M:convertToCameraPosition(x, y)
    local left = -(x - (display.width - self.margin_.left - self.margin_.right) / 2)
    local bottom = -(y - (display.height - self.margin_.top - self.margin_.bottom) / 2)
    return left, bottom
end
function M:updateView( target )	
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"moveOffset")
end
return M