--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("panel")
function M:ctor( target ,params)
	self.target = target
	self:setData(params)
end
function M:getDepends(  )
	return {}
end
function M:setData(params )
end
function M:initView( target )
	target:setTouchEvent(handler(self,self.onTouch))
end
function M:updateView( target )
end
--对应onenter
function M:enterView(  )
	
end
function M:showPanel(  )
	GameSceneMgr.getRunningGamePanelMgr():addPanel(self.target)
    return true
end
function M:closePanel(  )
    GameSceneMgr.getRunningGamePanelMgr():removePanel(self.target)
end
function M:getFloatNode(  )
	return self.target
end
function M:onTouch( event,x,y )
	if event == "began" then   
        
        -- if not self:isready() then
        --     return true
        -- end 
        return self:isTouch(event,x,y)
	end
	
	if event == "ended" then
	    
	end
end
function M:isTouch( event,x,y )
    if self.__closing then
        return true
    end

    local ccFloatNode = self:getFloatNode()
    if ccFloatNode ==  nil then
        echoInfo(string.format("FloatGamePanel子类%s没有重写getFloatNode方法, 使用其默认行为", self.__cname))
        self.__closing = true
        self.target:closePanel()
    else
        local ccpoint = ccFloatNode:convertToNodeSpace(cc.p(x,y))
        local ccBox = ccFloatNode:getBoundingBox()
        local ccRect = cc.rect(0,0, ccBox.width, ccBox.height)
        if not cc.rectContainsPoint(ccRect,ccpoint) then
            self.__closing = true
            self.target:closePanel()
        end 
    end     

    return true
end
function M:getIsBackGroundVisible(  )
	return true
end
--对应onexit
function M:exitView(  )
	
end
--对应release
function M:releaseView(  )
	
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"showPanel")
	target:bindOnceMethod(self,"closePanel")
	target:bindOnceMethod(self,"getIsBackGroundVisible")
end
return M