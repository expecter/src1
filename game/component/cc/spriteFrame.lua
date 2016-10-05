--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("spriteFrame")
function M:ctor( target ,params)
	self.target = target
	self.tlFrame = params.tlFrame or {}
end
function M:setData(params )
end
function M:initView( target )
	for i,frameName in ipairs(self.tlFrame) do
		target:addSpriteFrame(frameName)
	end
end
function M:addSpriteFrame( target,frameName )
	display.addSpriteFrames(string.format("%s.plist",frameName), string.format("%s.png",frameName))
end
function M:updateView( target )
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"addSpriteFrame")
end
return M