-----------------------------------------------------------------------------------------------  
-- @description 弹出窗基类
-- @author  ny,何泽平
-- @coryright  蜂鸟工作室
-- @release  2014/7/11
--------------------------------------------------------------------------------------------

local GameLayer = import(".GameLayer")
local M = class(..., GameLayer)

function M:ctor(params)
    M.super.ctor(self,params)
end

--重写此接口, 控制Panel是否有遮挡
function M:getIsBackGroundVisible()
    return true
end

function M:showPanel(fCallback)
    GameSceneMgr.getRunningGamePanelMgr():addPanel(self, fCallback)
    return true
end

function M:closePanel()
    --removePanel会调用,关闭回调
    if not tolua.isnull(self.__runningGamePanelMgr) then
        self.__runningGamePanelMgr:removePanel(self)
    else
        GameSceneMgr.getRunningGamePanelMgr():removePanel(self)
    end
end

function M:setCloseEvent(listener)
    self.fCloseListener = listener
end

function M:getTlInitView(listener)
    local ret = {
        function()
            if self.initView then
                self:initView()
            end
        end,
    }
    return ret
end

function M:getTlReleaseView(listener)
    local ret = {
        function()
            if self.releaseView then
                self:releaseView()
            end
        end,
    }
    return ret
end

return M