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
	self.selectNum = 0
	self.totalNum = 100
    self.callback_ = ComponentUtil.getCallFunc(params.clickedEvent)
end
function M:initView( parent )
    local ccImgSliderFr = ccNodeUtil.sprite({spriteName = "img_scale9_blood"})
    parent:addChild(ccImgSliderFr)
    local ccImgSliderBg = ccNodeUtil.sprite({spriteName = "img_scale9_blood_bg"})
    parent:addChild(ccImgSliderBg)
    local ccImgSliderBtn = ccNodeUtil.sprite({spriteName = "img_scale9_black"})
    parent:addChild(ccImgSliderBtn)
	self.slider = UICommon.createCCControlSlider(parent,ccImgSliderBg,ccImgSliderFr,ccImgSliderBtn)
    self.slider:setChangedEvent(function(value)
        self:onSliderChanged()
    end)	
end
function M:onSliderChanged(  )
	local function getRounding(a)
        local r1, r2 = math.modf(a, 1)
        if r2 >= 0 then
            r2 = r2 >= 0.5 and 1 or 0
        else
            r2 = r2 <= -0.5 and -1 or 0
        end
        return r1 + r2
    end
    local ro = 100/self.totalNum
    self.selectNum = getRounding(self.slider:getValue()/ro)
    if self.callback_ then
        self.callback_({selectNum = self.selectNum})
    end
end
function M:setViewCallback( target,callback,isFirst )
    self.callback_ = callback
    if isFirst then
        self.callback_({selectNum = self.selectNum})
    end 
end
function M:updateView( target )
end
function M:bindFunc( target )
    target:bindOnceMethod(self,"setViewCallback")
end
return M