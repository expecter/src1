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
function M:addObserver(target,component,eventName,listener )
	for com,v in pairs(self.listeners_) do
        if com == component and v[eventName] then
        	dump("has add listener")
            return
        end
    end
    if not self.listeners_[component] then
    	self.listeners_[component] = {}
    end
    
	self.listeners_[component]= {[eventName]=listener}
end
function M:dispatch(target,name,data )
	if type(target) == "userdata" and tolua.isnull(target) then
		return
	end
	if not self.isTargetVisible then
		return
	end
	-- print("dispatch",name,data)
	for component,v in pairs(self.listeners_) do
		local listener = v[name]
		listener(data)
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