--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class(...,componentBase)
function M:ctor(params)
	M.super.ctor(self,params)
	self.tlEventName = params.tlEventName
	self.tlListener = {}
end

function M:addListener( target,messageName,func )
	self.tlListener[messageName] = cc.EventProxy.new(GameMessage, self.target:getView()):addEventListener(
			messageName,func)
end

function M:removeListener( target,messageName )
	local listener = self.tlListener[messageName]
	GameMessage:removeEventListener(listener)
end

function M:enterView(  )
	for _,eventName in ipairs(self.tlEventName or {}) do
		self.target:addListener(eventName,function (  )
			self.target:updateView()
		end)
	end
end

function M:exitView(  )
	for messageName,listener in pairs(self.tlListener) do
		GameMessage:removeEventListener(listener)
	end
	self.tlListener = {} --置空
end

function M:bindFunc( target )
	target:bindOnceMethod(self,"addListener")
	target:bindOnceMethod(self,"removeListener")
end
return M