--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class(...,require("game.component.cc.node"))
function M:ctor(params)
	M.super.ctor(self,params)	
	self.text = params.text or "text"
	self._ccNode = params._ccNode
	-- self.object = params.object
	self.visible = params.visible~=false
end
-- function M:setData(params )
-- 	self.text = params.text or "text"
-- 	self.label = params._ccNode
-- 	self.object = params.object
-- 	self.visible = params.visible~=false
-- end
function M:initView( parent )
	if not self._ccNode then
		self._ccNode = display.newTTFLabel{
			text = self.text
    	}
    	if parent then
    		parent:addChild(self._ccNode)
    	end    	
	end
end
function M:setText( target,text )
	if text == self.text then return end
	self.text = text
	self.label:setString(self.text)	
end
function M:updateView( )
	M.super.updateView(self)	
	local text = self.text
	-- if self.object then
	-- 	text = ComponentUtil.getData(self.object)		
	-- end
	self.target:setText(text)
end
function M:getView(  )
	return self._ccNode
end
--对应onenter
function M:enterView(  )
	self:updateView()
end
--对应onexit
function M:exitView(  )
	
end
--对应release
function M:releaseView(  )
	
end
function M:bindFunc( target )
	M.super.bindFunc(self,target)
	target:bindOnceMethod(self,"setText")
	target:bindMethod(self,"getView")
end
return M