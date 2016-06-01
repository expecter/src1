-----------------------------------------------------------------------------------------------  
-- @description 浮点弹出框, 点击窗体区域外的区域, 弹出框自动消失
-- @author  ny
-- @coryright  蜂鸟工作室
-- @release  2014/7/11
--------------------------------------------------------------------------------------------

local GamePanel = import(".GamePanel")
local M = class(..., GamePanel)

function M:ctor(params) 
   M.super.ctor(self,params)
end

function M:getFloatNode() end

function M:onTouch(event, x, y)
    if event == "began" then   
        
        -- if not self:isready() then
        --     return true
        -- end 

        if self.__closing then
            return true
        end

        local ccFloatNode = self:getFloatNode()
        if ccFloatNode ==  nil then
            echoInfo(string.format("FloatGamePanel子类%s没有重写getFloatNode方法, 使用其默认行为", self.__cname))
            self.__closing = true
            self:performWithDelay(function()
                self:closePanel()
            end, 0)
        else
            local ccpoint = ccFloatNode:convertToNodeSpace(cc.p(x,y))
            local ccBox = ccFloatNode:getBoundingBox()
            local ccRect = cc.rect(0,0, ccBox.width, ccBox.height)
            if not cc.rectContainsPoint(ccRect,ccpoint) then
                self.__closing = true
                self:performWithDelay(function()
                    self:closePanel()
                end, 0)
            end 
        end     

	    return true
	end
	
	if event == "ended" then
	    
	end

end


return M