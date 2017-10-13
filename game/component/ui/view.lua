--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class(...,componentBase)
function M:ctor(params)
	M.super.ctor(self,params)
	self:setData(params)
end
function M:setData(params )
end
function M:initView( parent )
	if (type(self._view) == "table" and self._view._type == "node") or tolua.type(self._view) == "cc.Node" then
		if not self.TlComName["ui_node"] then
			self:addComponent({_type = "ui_node"})
		end
	end
	if (type(self._view) == "table" and self._view._type == "label") or tolua.type(self._view) == "cc.label" then
		if not self.TlComName["ui_label"] then
			self:addComponent({_type = "ui_label"})
		end
	end
	if (type(self._view) == "table" and self._view._type == "sprite") or tolua.type(self._view) == "cc.Sprite" then
		if not self.TlComName["ui_sprite"] then
			self:addComponent({_type = "ui_sprite"})
		end
	end
	if (type(self._view) == "table" and self._view._type == "ccreader") or tolua.type(self._view) == "cc.BReader" then
		
		if not self.TlComName["ui_ccReader"] then
			self:addComponent({_type = "ui_ccReader"})
		end
	end
end
function M:updateView(  )
end
function M:bindFunc( target )
end
return M