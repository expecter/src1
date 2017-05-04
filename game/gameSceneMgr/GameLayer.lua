-----------------------------------------------------------------------------------------------  
-- @description 主场景和弹出框的基类 
-- @author  ny,hzp
-- @coryright  蜂鸟工作室
-- @release  2014/7/10
--------------------------------------------------------------------------------------------


local M = class(...,GameNode)

---构建函数
function M:ctor(params)
    if not params then params = {} end
    -- local InitComponent = {
    --     ClickComponent = {isSwallow = true,touch_ = handler(self,self.onTouch)},
    --     viewComponent = {},
    --     loadComponent = {},
    -- }
    -- table.merge(InitComponent,params)
    -- table.insert(params._component,{_type = "loadComponent"})
    self:setContentSize(display.width, display.height)
    M.super.ctor(self,params)
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
    local tlFunc = {}
    self:getFuncByCmd(tlFunc,"initView")
    return tlFunc
end

--销毁函数队列
function M:getTlReleaseView()
    local tlFunc = {}
    self:getFuncByCmd(tlFunc,"releaseView")
    
    return tlFunc
end

-- -- onEnter函数队列
function M:getTlOnEnter()
    local tlFunc = {}
    self:getFuncByCmd(tlFunc,"enterView")
    return tlFunc
end

-- -- onExit函数队列
function M:getTlOnExit()
    local tlFunc = {}
    self:getFuncByCmd(tlFunc,"exitView")
    return tlFunc
end
function M:getFuncByCmd( tlFunc,cmd )
    for k,com in pairs(self:getAllComponent()) do
        if com[cmd] then
            table.insert(tlFunc,handler(com,com[cmd]))
        end
    end
    self:getChildFunc(tlFunc,self,cmd)
    -- return tlFunc
end
function M:getChildFunc( tlFunc,node,cmd )
    for _,child in ipairs(node:getAllChildren()) do
        for k,com in pairs(child:getAllComponent()) do
            if com[cmd] then
                table.insert(tlFunc,handler(com,com[cmd]))
            end
        end
        self:getChildFunc(tlFunc,child,cmd)        
    end
end
--在gamelayermgr里面对当前层的所有节点进行控制和获取
function M:setAllGameNode(  )
    
end
--- 子类调用setTouchEnabled(true) 并重写onTouch方法实现触摸事件分发
function M:onTouch(event, x, y)
    if event == "began" then
        return true
    end
end

return M




