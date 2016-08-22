--
-- Author: Your Name
-- Date: 2016-08-20 00:01:02
--
local M = class("ClickComponent")
M.CLickOrder = 0
--baseFunc
function M:ctor( target )
	self.target = target
	self.fClickeEvent = nil
end

function M:setData(params )
	self.isSwallow = params.isSwallow==true
    self.isScale_ = params.isScale==true
end

function M:binding(  )
	
end

function M:initView( target,params )
	--点击层
    local layer = display.newLayer() 
    layer:addTouchEventListener( handler(self, self.onTouch), false, self.isSwallow)
    layer:setTouchEnabled(true)
    layer:setVisible(false)
    target:addChild(layer,M.CLickOrder)
end

function M:updateView(  )
	
end
--localFunc
function M:onTouch( event, x, y )
	local visiblehelper
    visiblehelper = function(node)
        if node == nil then return true end
        if not node:isVisible() then return false end
        local parent = node:getParent()
        return visiblehelper(parent)
    end
    if not visiblehelper(self.target) then return end
    if event == "began" then
        if self:isInRect(x,y) then
            self:setScaleEffect(-0.1)
        end        
    	return true
	elseif event =="moved" then
	elseif event == "ended" then
        self:setScaleEffect(0)
		self:onClick(x,y)
	end
    return false
end
function M:setScaleEffect( offset )
    if self.isScale_ then
        if not self.baseScale_ then
            self.baseScale_ = self.target:getScale()
        end
        self.target:stopAllActions()
        self.target:runAction(cc.ScaleTo:create(0.1, self.baseScale_ + offset))
    end
end
function M:onClick(x,y)
    local fClickeEvent = self.fClickeEvent

    if not fClickeEvent then return end
    local pos = self.target:convertToNodeSpace(cc.p(x,y))
    local size = self.target:getContentSize()
    if pos.x > 0 and pos.y > 0 and pos.x < size.width and pos.y < size.height then
        fClickeEvent(self.target, x, y)
        return
    end
end
function M:isInRect( x,y )
    local pos = self.target:convertToNodeSpace(cc.p(x,y))
    local size = self.target:getContentSize()
    if pos.x > 0 and pos.y > 0 and pos.x < size.width and pos.y < size.height then
        return true
    end
end
--exportFunc
function M:setClickedEvent( fClickedEvent )
	self.fClickeEvent = fClickedEvent
end
function M:getClickedEvent(  )
    return self.fClickeEvent
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"setClickedEvent")
    target:bindOnceMethod(self,"getClickedEvent")
    
end
return M