--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class(...,componentBase)
function M:ctor(params)
	M.super.ctor(self,params)
	self.tlFrame = params.tlFrame or {}
	self.isCcz = DEFAULT_FALSE(params.isCcz)
end
function M:setData(params )
end
function M:initView( target )
	for i,frameName in ipairs(self.tlFrame) do
		self.target:addSpriteFrame(frameName)
	end
end
function M:addSpriteFrame( target,frameName )
	if self.isCcz then
		display.addSpriteFrames(string.format("%s.plist",frameName), string.format("%s.pvr.ccz",frameName))
	else
		display.addSpriteFrames(string.format("%s.plist",frameName), string.format("%s.png",frameName))
	end
	
end
-- function M:updateView( target )
-- end
function M:bindFunc( target )
	target:bindOnceMethod(self,"addSpriteFrame")
end
return M