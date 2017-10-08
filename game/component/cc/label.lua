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
	self.text = params.text or "text"
	self.object = params.object
end
function M:initView( parent )
	self.label = display.newTTFLabel{text=self.text,size=30}
    parent:addChild(self.label)
    self.label:setPosition(parent:getCenterPosition())
    -- self.label:setAnchorPoint(cc.p(0,0))
    self.label:setString(self.text)
    self.target:setView(self.label)
end
function M:initByNode( target,label )
	self.label = label
	self.label:setString(self.text)
end
function M:setText( target,text )
	if text == self.text then return end
	self.text = text
	self.label:setString(self.text)
end
function M:updateView( )
	local text = self.text
	print("self.text",self.text)
	if self.object then
		text = ComponentUtil.getData(self.object)		
	end
	self.target:setText(text)
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
	target:bindOnceMethod(self,"setText")
	target:bindOnceMethod(self,"initByNode")
end
return M