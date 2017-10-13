--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class(...,componentBase)
function M:ctor(params)
	M.super.ctor(self,params)	
	self:setData(params)
end
function M:setData(params )
	self.posStart = nil
	self.posEnd = nil
	self.distance = cc.pGetDistance(self.posStart, self.posEnd)
end

function M:initView( parent )
end

function M:updateView(  )
end
-- 动画开始接口
function M:startAnime()
	local cur_time = net.Client.getServerTime()
    local start_pos = self:getStartPos()
	local march_time = (self.cmdMarch.endTime - cur_time) /1000 > 0 and (self.cmdMarch.endTime - cur_time)/1000 or 1
	self.viewSoldier:setPosition(start_pos)
	self.viewSoldier:startMove({start_pos,self.posEnd},self.speed,march_time)
end
-- 获取行军初始位置
function M:getStartPos()
	local cur_time = net.Client.getServerTime()
    local left_time = self.cmdMarch.endTime - cur_time

    -- 当前位置点
    local start_pos 
    start_pos= cc.pLerp(self.posEnd,self.posStart,left_time/self.cmdMarch.totalTime)   
    return start_pos 
end
function M:bindFunc( target )
end
return M