--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class(...,componentBase)
function M:ctor(params)
	M.super.ctor(self,params)
	self.contentSize = params.contentsize or cc.size(0,0)
	self.anchPos = params.AnchPos or cc.p(0,0)
	self.pos = params.pos or cc.p(0,0)
	self.visible = params.visible~=false
	self.scale = params.scale or 1
	self._view = params._view
	self:setData(params)
end
function M:setData(params )
end
function M:initView( parent )
end
function M:updateView(  )
end
function M:bindFunc( target )
end
return M