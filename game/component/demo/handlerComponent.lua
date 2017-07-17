--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--后期可单独为一个界面脚本文件
local M = class("handlerComponent")
function M:ctor( target ,params)
	self.target = target
	self:setData(params)
end
function M:setData(params )
end
function M:handlerIndex( target,index )
	local tlData = ref.item.getTlRef{type = index}
	self.target:setTlData(tlData)
	self.target:updateView()
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
	target:bindOnceMethod(self,"handlerIndex")
end
return M