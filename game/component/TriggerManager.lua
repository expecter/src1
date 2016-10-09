--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( target ,params)
	self.target = target
	self.tlObject = {}
	self:setData(params)
end
function M:getDepends(  )
	return {
		{
			_type = "cc_ScheduleComponent",
		},
	}
end
function M:setData(params )
end
function M:initView( target )
	self.target:startScheduler(handler(self,self.update))
end
function M:addObject( target,object )
	table.insert(self.tlObject,object)
end
function M:update(  )
	for i=1,#self.tlObject do
		for j=i+1,#self.tlObject do
			if self:onRectTrigger(self.tlObject[i],self.tlObject[j]) then
				self.target:dispatch("trigger",{objA = self.tlObject[i],objB = self.tlObject[j]})
				if self.tlObject[i].onTrigger then
					self.tlObject[i]:onTrigger(self.tlObject[j])
				end
				if self.tlObject[j].onTrigger then
					self.tlObject[j]:onTrigger(self.tlObject[i])
				end
			end
		end
	end
end
function M:onRectTrigger( objA,objB )
	if objA==nil or tolua.isnull(objA) then
		return false
	end
	if objB==nil or tolua.isnull(objB) then
		return false
	end
	if cc.rectIntersectsRect(objA:getBoundingBox(),objB:getBoundingBox()) then
		return true
	end
	return false
end
function M:onCircleTrigger( objA,objB )
	if objA==nil or tolua.isnull(objA) then
		return false
	end
	if objB==nil or tolua.isnull(objB) then
		return false
	end
	local x = bubble1:getPositionX() - bubble2:getPositionX()
    local y = bubble1:getPositionY() - bubble2:getPositionY()
    local w = bubble1.ccSpr:getContentSize().width / 2

    if (x*x + y*y) < w * w then
		return true
	end
	return false
end
function M:updateView( target )
end
--对应onenter
function M:enterView(  )
	
end
--对应onexit
function M:exitView(  )
	
end
--对应release
function M:releaseView(  )
	
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"addObject")
end
return M