--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("eventComponent")
function M:ctor( target ,params)
	self.target = target
	self:setData(params)
end
function M:setData(params )
	self.viewsize = params.viewsize
	self.viewNode = params.viewNode
end
-- function M:cellMode( cmdX )
	
-- end
--exportFunc
function M:initView( target )
	-- self.viewlist = UICommon.createViewList(target,self.isMovable)
	self.ccScrollView = cc.ScrollView:create(self.viewsize,self.viewNode)
	target:addChild(self.ccScrollView,1)
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
end
function M:onScroll(  )
	local point = self.ccScrollView:getContentOffset()
end
function M:updateView( target )
	-- if not self.viewlist and self.childNode then
	-- 	self.ccScrollView = cc.ScrollView:create(target:getContentSize(),self.childNode)	
	-- 	self.ccScrollView:setAnchorPoint(cc.p(0.5, 0.5))
	--     self.ccScrollView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
	--     target:addChild(self.ccScrollView)
	-- end	
end
function M:moveToPoints( x,y )
    self.ccScrollView:setContentOffset(cc.p(-x,-y))
end
function M:setViewCallback( target,callback )
	self.callback_ = callback
end
function M:bindFunc( target )
	target:bindMethod(self,"updateView")
	target:bindMethod(self,"initView")
	target:bindOnceMethod(self,"setViewCallback")
end
return M