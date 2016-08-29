-----------------------------------------------------------------------------------------------  
-- @description 请求 
-- @author  ny
-- @coryright  蜂鸟工作室
-- @release  2014/9/8
--------------------------------------------------------------------------------------------

local Message = import(".Message")

local M = class(...)

function M:ctor(params)

    --消息名
    self.messageName = params.messageName

    --参数
    self.params = params.params

    --正常回调
    self.fCallback = params.fCallback

    --错误回调
    self.fErrorCallback = params.fErrorCallback

    --超时回调
    self.fTimeoutCallback = params.fTimeoutCallback

    --request的生命周期绑定view, view被销毁后 不会回调
    self.view = params.view

    --请求期间是否允许玩家操作
    self.free = params.free

    --时间
    self.timestamp = os.time()

    
end

function M:onReceive(cmdX, suc)
    --如果绑定了view, 但是 为空
    if self.view~=nil and tolua.isnull(self.view) then
        return
    end

    if suc then
        if self.fCallback then
            self.fCallback(cmdX)
        end
    else
        if self.fErrorCallback then
            return self.fErrorCallback(cmdX)
        end
    end
end

function M:onTimeout()
    --如果绑定了view, 但是 为空
    if self.view~=nil and tolua.isnull(self.view) then
        return
    end

    if self.fTimeoutCallback then
        self.fTimeoutCallback()
    end
end










return M



