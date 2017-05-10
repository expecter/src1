--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( target ,params)
	self.target = target
	self.tlObject = {}
	self.Tlcolls = {}
	self:setData(params)
end
function M:setData(params )
end
function M:initView( target )
end
function M:addObject( target,object )	
	table.insert(self.tlObject,object)
end
function M:update( dt )
	-- for i=1,#self.tlObject do
	-- 	for j=i+1,#self.tlObject do
	-- 		if self:onRectTrigger(self.tlObject[i],self.tlObject[j]) then
	-- 			self.target:dispatch("trigger",{objA = self.tlObject[i],objB = self.tlObject[j]})
	-- 			if self.tlObject[i].onTrigger then
	-- 				self.tlObject[i]:onTrigger(self.tlObject[j])
	-- 			end
	-- 			if self.tlObject[j].onTrigger then
	-- 				self.tlObject[j]:onTrigger(self.tlObject[i])
	-- 			end
	-- 			if not self.Tlcolls[self.tlObject[i]] then
	-- 				--todo
	-- 			end
	-- 		else

	-- 		end
	-- 	end
	-- end
	for idxA,objA in ipairs(self.tlObject) do
		for idxB,objB in ipairs(self.tlObject) do
			if idxA~=idxB then
				if not self.Tlcolls[objA] then
					self.Tlcolls[objA] = {}
				end
				local objBCollisionWithObj1 = self.Tlcolls[objA][objB]
				if self:onRectTrigger(objA,objB) then
					self.target:dispatch("trigger",{objA = objA,objB = objB})
					if objA.onTrigger then
						objA:onTrigger(objB)
					end
					if objB.onTrigger then
						objB:onTrigger(objA)
					end
					if not objBCollisionWithObj1 then
						self.target:dispatch("EVENT_COLLISION_BEGAN",{objA = objA,objB = objB})
					end
					self.Tlcolls[objA][objB] = true
				else
					if objBCollisionWithObj1 then
						self.target:dispatch("EVENT_COLLISION_ENDED",{objA = objA,objB = objB})
					end
					self.Tlcolls[objA][objB] = nil
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
	local function getRect( obj )
		local pos = obj:convertToWorldSpace(cc.p(0,0))
		local size = obj:getContentSize()
		return cc.rect(pos.x,pos.y,size.width,size.height)
	end
	if cc.rectIntersectsRect(getRect(objA),getRect(objB)) then
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