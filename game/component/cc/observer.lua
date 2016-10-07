--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("cc_observer")
function M:ctor( target )
	self.target = target
	self.isTargetVisible = true
	self.listeners_ = {}
end
--exportFunc
function M:addObserver(target,comName,target,eventName,listener )
	-- for com,v in pairs(self.listeners_) do
 --        if com == component and v[eventName] then
 --        	dump("has add listener")
 --            return
 --        end
 --    end
    if not self.listeners_[comName] then
    	self.listeners_[comName] = {}
    end
    
    if not self.listeners_[comName][target] then
    	self.listeners_[comName][target] = {}
    end
    self.listeners_[comName][target][eventName] = listener
end
function M:dispatch(target,eventName,data )
	if type(target) == "userdata" and tolua.isnull(target) then
		return
	end
	if not self.isTargetVisible then
		return
	end
	for comName,tlTarget in pairs(self.listeners_) do
		for target,v in pairs(tlTarget) do
			if type(target) == "userdata" and not tolua.isnull(target) then
				local listener = v[eventName]
				listener(data)
			end			
		end
	end
end
function M:exitView(  )
	self.isTargetVisible = false
end
function M:enterView(  )
	self.isTargetVisible = true
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"addObserver")
    target:bindOnceMethod(self,"dispatch")    
end
return M