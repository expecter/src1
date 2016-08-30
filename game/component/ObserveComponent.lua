--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("ClickComponent")
function M:ctor( target )
	self.target = target
	self.listeners_ = {}
end
--exportFunc
function M:addObserver(component,eventName,listener )
	for comp,v in pairs(self.listeners_) do
        if comp == component and v[eventName] then
        	dump("has add listener")
            return
        end
    end
    if not self.listeners_[component] then
    	self.listeners_[component] = {}
    end
    
	self.listeners_[component]= {[eventName]=listener}
end
function M:dispatch(name,data )
	if type(self.target) == "userdata" and tolua.isnull(self.target) then
		return
	end
	-- print("dispatch",name,data)
	for component,v in pairs(self.listeners_) do
		local listener = v[name]
		listener(component,data)
	end
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"addObserver")
    target:bindOnceMethod(self,"dispatch")    
end
return M