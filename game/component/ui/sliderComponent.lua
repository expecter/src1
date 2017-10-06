--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( params)
	self:setData(params)
end
function M:setData(params )
	self.selectNum = 0
	self.totalNum = 100
end
function M:initView( target )
	self.slider = UICommon.createCCControlSlider(owner.nodeSlider,owner.ccImgSliderBg,owner.ccImgSliderFr,owner.ccImgSliderBtn)
    slider:setChangedEvent(function(value)
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
    self.selectNum = getRounding(self.ccSlider:getValue()/ro)
end
function M:updateView( target )
end
function M:bindFunc( target )
end
return M