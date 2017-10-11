--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class(...,componentBase)
function M:ctor( params)
    M.super.ctor(self,params)
	self:setData(params)
end
function M:setData(params )
end
function M:initView( parent )
	print("BBBBBBBBBB")	
	local node = self.target:getView()
    local sprite = display.newSprite("img_scale9_blood.png")
    node:addChild(sprite)
    -- local ccImgSliderBg = ccNodeUtil.sprite({spriteName = "img_scale9_blood_bg"})
    -- node:addChild(ccImgSliderBg)
    -- print("",ccImgSliderBg:getPositionX())
    -- local ccImgSliderFr = ccNodeUtil.sprite({spriteName = "img_scale9_blood"})
    -- node:addChild(ccImgSliderFr)
    -- self.progressBar = UICommon.createCCProgressTimer(
    -- 	ccImgSliderBg,
    -- 	UICommon.createSprite(ccImgSliderFr)
    -- )	
end

function M:setPercentage(  )
	self.progressBar:setPercentage(0.5*100)
end

function M:updateView( target )
	self.progressBar:setPercentage(0.5*100)
end
function M:bindFunc( target )
    target:bindOnceMethod(self,"setViewCallback")
end
return M