--
-- Author: Your Name
-- Date: 2016-08-20 00:01:02
--
local M = class(...,componentBase)
M.CLickOrder = 0
function M:ctor(params)
    M.super.ctor(self,params)
    self:setData(params)    
end

function M:setData(params )
	self.isSwallow = params.isSwallow==true
    self.isScale_ = params.isScale==true
    self.onTouch_ = params.touch_ or handler(self, self.onTouch)
    self.fClickeEvent = ComponentUtil.getCallFunc(params.clickedEvent)
end
function M:initView(  )
	--点击层
    self.touchlayer = display.newLayer() 
    self.touchlayer:addTouchEventListener( self.onTouch_, false, self.isSwallow)
    self.touchlayer:setTouchEnabled(true)
    self.touchlayer:setVisible(false)
    self.target:getView():addChild(self.touchlayer)
end

function M:enterView(  )
    
end
--localFunc
function M:onTouch( event, x, y )
    if self.touchEvent then
        self.touchEvent(event, x, y)
        return true
    end
	local visiblehelper
    visiblehelper = function(node)
        if node == nil then return true end
        if not node:isVisible() then print("node is not visible") return false end
        local parent = node:getParent()
        return visiblehelper(parent)
    end
    if not visiblehelper(self.target:getView()) then return end
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
            self.baseScale_ = self.target:getView():getScale()
        end
        self.target:getView():stopAllActions()
        self.target:getView():runAction(cc.ScaleTo:create(0.1, self.baseScale_ + offset))
    end
end
function M:onClick(x,y)
    local fClickeEvent = self.fClickeEvent
    if not fClickeEvent then return end
    local pos = self.target:getView():convertToNodeSpace(cc.p(x,y))
    local size = self.target:getView():getContentSize()
    if pos.x > 0 and pos.y > 0 and pos.x < size.width and pos.y < size.height then
        fClickeEvent(self.target:getView(), x, y)
        return
    end
end
function M:isInRect( x,y )
    local pos = self.target:getView():convertToNodeSpace(cc.p(x,y))
    local size = self.target:getView():getContentSize()
    if pos.x > 0 and pos.y > 0 and pos.x < size.width and pos.y < size.height then
        return true
    end
end
--exportFunc
function M:setClickedEvent(target, fClickedEvent )
	self.fClickeEvent = ComponentUtil.getCallFunc(fClickedEvent)
end
function M:getClickedEvent(  )
    return self.fClickeEvent
end
function M:setTouchEvent( target,event )
    self.touchEvent = event
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"setClickedEvent")
    target:bindOnceMethod(self,"getClickedEvent")
    target:bindOnceMethod(self,"setTouchEvent")
end
return M