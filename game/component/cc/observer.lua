--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("cc_observer")
function M:ctor(  )
	self.isTargetVisible = true
	self.listeners_ = {}
end
--exportFunc
function M:addObserver(target,com,eventName,listener )
    if not self.listeners_[com.name] then
    	self.listeners_[com.name] = {}
    end
    table.insert(self.listeners_[com.name],{target = com.target,[eventName] = listener})
end
function M:dispatch(target,eventName,data )
	if type(target) == "userdata" and tolua.isnull(target) then
		return
	end
	if not self.isTargetVisible then
		return
	end
	for comName,tlTarget in pairs(self.listeners_) do
		for i,v in ipairs(tlTarget) do
			local com = v.target:getComponent(comName)
			if not com then
				print("not listener",eventName,comName)
			end
			if com and type(v.target) == "userdata" and not tolua.isnull(v.target) then
				if v[eventName] then
					v[eventName](data)
				end				
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