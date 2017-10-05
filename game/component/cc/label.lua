--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( target ,params)
	self.target = target
	self.text = params.text or "text"
	self.object = params.object
	self:setData(params)
end
function M:setData(params )
end
function M:initView( target )
	self.label = display.newTTFLabel{text=self.text,size=30}
    self.target:addChild(self.label)
    self.label:setPosition(self.target:getCenterPosition())
    -- self.label:setAnchorPoint(cc.p(0,0))
end
function M:setText( target,text )
	self.text = text
	-- self:updateView()
	self.label:setString(self.text)
end
function M:updateView( )
	self.label:setString(self.text)
end
--cache更新调用
function M:onUpdate( )
	if self.object then
		local text = ComponentUtil.getData(self.object)
		self.label:setString(text)
	end	
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
end
return M