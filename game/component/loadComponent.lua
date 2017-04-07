--
-- Author: Your Name
-- Date: 2017-04-07 18:01:47
--GameLayer加载项
local M = class("loadComponent")
function M:ctor( target ,params)
	self.target = target
	self:setData(params)
end

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
    for k,com in pairs(self.target:getAllComponent()) do
        if com[cmd] then
            table.insert(tlFunc,handler(com,com[cmd]))
        end
    end
    self:getChildFunc(tlFunc,self.target,cmd)
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

function M:bindFunc( target )
	target:bindOnceMethod(self,"getTlInitView")
	target:bindOnceMethod(self,"getTlReleaseView")
	target:bindOnceMethod(self,"getTlOnEnter")
	target:bindOnceMethod(self,"getTlOnExit")
end

return M