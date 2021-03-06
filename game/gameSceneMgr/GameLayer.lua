-----------------------------------------------------------------------------------------------  
-- @description 主场景和弹出框的基类 
-- @author  ny,hzp
-- @coryright  蜂鸟工作室
-- @release  2014/7/10
--------------------------------------------------------------------------------------------


local M = class(...,function()
    return display.newLayer()
end)

---构建函数
function M:ctor(params)
    self:setNodeEventEnabled(true)
    self:addTouchEventListener(handler(self, self.onTouch), false, true)
    self:setTouchEnabled(true)
end

-------------------------------------------------------------------------------------  
---------- 预加载loading(子类覆盖)
-------------------------------------------------------------------------------------
-- --初始化函数队列
-- 如 {
--     --function(self, fCallback) end,
--     --function(self, fCallback) end,
--     --function(self, fCallback) end,
-- }
function M:getTlInitView()
    return {}
end

--销毁函数队列
function M:getTlReleaseView()
    return {}
end

-- -- onEnter函数队列
function M:getTlOnEnter()
    return {}
end

-- -- onExit函数队列
function M:getTlOnExit()
    return {}
end

--- 子类调用setTouchEnabled(true) 并重写onTouch方法实现触摸事件分发
function M:onTouch(event, x, y)
    if event == "began" then
        return true
    end
end

return M




