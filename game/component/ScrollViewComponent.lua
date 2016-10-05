--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("ScrollViewComponent")
function M:ctor( target ,params)
	self.target = target
	self:setData(params)
end
function M:setData(params )
	self.viewsize = params.viewsize
	self.viewConfig = params.viewNode
    self.movable = DEFAULT_TRUE(params.movable)
end
-- function M:cellMode( cmdX )
	
-- end
--exportFunc
function M:initView( target )
    self.viewNode = GameSceneMgr.createGameNode(self.viewConfig)
	self.ccScrollView = cc.ScrollView:create(self.viewsize,self.viewNode)
	target:addChild(self.ccScrollView)
    -- self.ccScrollView:setAnchorPoint(cc.p(0.5, 0.5))
    -- self.ccScrollView:setPosition(cc.p(target:getCenterPosition()))
    -- self.ccScrollView:setScale(1)
    -- self.ccScrollView:setMaxScale(1)
    -- self.ccScrollView:setMinScale(0.7)
    -- self.ccScrollView:setZoomScaleInDuration(0.7,0.5)
    -- -- 设置弹回false
    self.ccScrollView:setBounceable(false)
    self.ccScrollView:setDelegate()
    -- -- self.ccScrollView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    -- -- 监听滚动事件
    self.ccScrollView:registerScriptHandler(
        function(view)
            self:onScroll(view)
        end
        , cc.SCROLLVIEW_SCRIPT_SCROLL)
    
    -- ScriptHandlerMgr:getInstance():registerScriptHandler(self.ccScrollView,
    --     function() 
    --         -- self.viewWorld:reqGridCity()
    --     end,
    --     cc.Handler.CALLFUNC)
    -- self:onScroll(self.ccScrollView)
    self.ccScrollView:setMovable(self.movable)
end
function M:onScroll(  )
	local point = self.ccScrollView:getContentOffset()
end
function M:updateView( target )	
end
function M:moveToPoints( x,y )
    self.ccScrollView:setContentOffset(cc.p(-x,-y))
end
function M:movebyPoints( target,x,y )
    local pos = self.ccScrollView:getContentOffset()
    self.ccScrollView:setContentOffset(cc.p(pos.x-x,pos.y-y))
end
function M:getContentOffset( target )
    return self.ccScrollView:getContentOffset()
end
function M:getViewNode(  )
    return self.viewNode
end
function M:getViewSize(  )
    return self.viewsize
end
function M:setScrollMovable( target,movable )
    self.ccScrollView:setMovable(movable)
end
function M:setScrollOffsetInDuration( target,pos,time )
    self.ccScrollView:setContentOffsetInDuration(pos, time)
end
function M:setViewCallback( target,callback )
	self.callback_ = callback
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"setViewCallback")
    target:bindOnceMethod(self,"setScrollMovable")
    target:bindOnceMethod(self,"setScrollOffsetInDuration")
    target:bindOnceMethod(self,"getViewNode")
    target:bindOnceMethod(self,"getViewSize")
    target:bindOnceMethod(self, "moveToPoints")
    target:bindOnceMethod(self, "movebyPoints")
    target:bindOnceMethod(self, "getContentOffset")
end
return M