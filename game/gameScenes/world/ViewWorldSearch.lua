-----------------------------------------------------------------------------------------------  
-- @description 世界地图中的缩略图
-- @author  郑泽森
-- @coryright  蜂鸟工作室
-- @release  2016/4/6
--------------------------------------------------------------------------------------------
local M = class(...,require("game.gameSceneMgr.GameLayer"))
local MapLoader = import(".MapLoader")
local WIDTH = 200
local HEIGHT = 130

function M:ctor(params)
	M.super.ctor(self)
    self:initData(params)
    self:initView()
    	--大地图与小地图的倍数值
	self.nMapDouble_= self.mapLoader_.mw*self.mapLoader_.tw/WIDTH
end 
function M:initData(params)
	self.params=params
	self.mapLoader_ = MapLoader.getInstance()
end

function M:initView()
	self:setContentSize(cc.size(WIDTH,HEIGHT))
    -- 世界地图	
    -- self.viewWorldSearchMap_ = require("game.gameScenes.world.ViewWorldSearchMap").new()
    -- self.ccScrollView_ = cc.ScrollView:create(cc.size(WIDTH,HEIGHT),self.viewWorldSearchMap_)
    -- self.ccScrollView_:setAnchorPoint(cc.p(0.5, 0.5))
    -- self.ccScrollView_:setScale(1)
    -- self.ccScrollView_:setMovable(false)
    -- self:addChild(self.ccScrollView_)
    -- -- 设置弹回false
    -- self.ccScrollView_:setBounceable(false)
    -- self.ccScrollView_:setDelegate()
    
    -- -- 监听滚动事件
    -- self.ccScrollView_:registerScriptHandler(
    -- 	function(view)
    --         self:onScroll(view)
    --     end
    --     , cc.SCROLLVIEW_SCRIPT_SCROLL)

    self:Test()

    -- local sprite = view.ViewClippingSprite.new( 
    --     self.viewWorldSearchMap_:getSprite():getSpriteFrame(),
    --     "img_world_minmap_mask.png",
    --     true
    -- )
    -- sprite:setAnchorPoint(cc.p(0.5,0.5))
    -- self:addChild(sprite)

    -- local sprite = display.newSprite("img_world_minmap_mask.png")
    -- -- sprite:setOpacity(0)
    -- local clippingNode = view.ViewClipping.new{
    --     stencil = sprite,
    --     -- bInverted = true,
    -- }

    -- clippingNode:setAnchorPoint(cc.p(0,0))
    -- self:addChild(clippingNode)
    -- clippingNode:addChild(self.ccScrollView_)

    -- local sprite = display.newSprite("img_world_minmap_mask.png")
    -- sprite:setPosition(WIDTH * 0.5,HEIGHT * 0.5)
    -- sprite:setOpacity(100)
    -- self:addChild(sprite,999)
end

function M:onScroll(view)
	local point=self.ccScrollView_:getContentOffset()
end

function M:Test()
	self.mapImg = display.newSprite("img_world_icon_dadibiao.png", WIDTH/2, HEIGHT/2)
    self.mapImg:setAnchorPoint(cc.p(0.5,0.5))
    self:addChild(self.mapImg)
	-- self.ccScrollView_:addChild(self.mapImg)

    local btn1 = display.newSprite("img_wrold_btn_y_right.png", WIDTH, HEIGHT)
    btn1:setAnchorPoint(cc.p(1,1))
    self:addChild(btn1)

    local btn2 = display.newSprite("img_wrold_btn_y_search.png", WIDTH, HEIGHT/2)
    btn2:setAnchorPoint(cc.p(1,0.5))
    self:addChild(btn2)

    local btn3 = display.newSprite("img_wrold_btn_y_in.png", WIDTH,0)
    btn3:setAnchorPoint(cc.p(1,0))
    self:addChild(btn3)
end

function M:updateOnScorll(x,y)
    -- dump(1111111111111111111111111111111111111)
    -- dump(x,"x:")
    -- dump(y,"y:")

    if self.map then
        self.map:removeFromParent()
    end

    local wzx=(x+WIDTH/2*self.nMapDouble_-display.cx)/self.nMapDouble_
    local wzy=(y+HEIGHT/2*self.nMapDouble_-display.cy)/self.nMapDouble_

    -- dump(wzx,"wzx:")
    -- dump(wzy,"wzy:")
    local path = "img_world_pic_shijieditu1.png"
    local sprite = cc.Sprite:create(path,cc.rect(wzx,wzy,WIDTH,HEIGHT))
    local sprite = view.ViewClippingSprite.new( 
        sprite:getSpriteFrame(),
        "img_world_minmap_mask.png",
        true
    )

    sprite:setOpacity(122)
    sprite:setAnchorPoint(cc.p(0.5,0.5))
    sprite:setPosition(cc.p(WIDTH*0.5,HEIGHT*0.5))
    self.map = sprite
    self:addChild(self.map,-1)
	
    -- self.ccScrollView_:setContentOffset(cc.p(wzx,wzy))

    -- self.mapImg:setPosition(cc.p(-wzx+WIDTH/2,-wzy+HEIGHT/2))
end

function M:onTouch(event,x,y)
	 if event == "began" then   
        local ccpoint = self:convertToNodeSpace(cc.p(x,y))
        local ccBox = self:getBoundingBox()
		local ccRect = cc.rect(0,0, ccBox.width, ccBox.height)
        if cc.rectContainsPoint(ccRect,ccpoint) then
        	return true
        end 
	    return false
	elseif event=="ended" then
    	local panelWorldSearch=require("game.gameScenes.world.panel.PanelWorldSearch").new(
    			{moveToCenterByRC=self.params.moveToCenterByRC}
    		)
    	panelWorldSearch:showPanel() 
	end
end
return M