--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( target ,params)
	self.target = target
	self.text = params.text or "text"
	self:setData(params)
end
function M:setData(params )
end
function M:initView( target )
	self.label = display.newTTFLabel{text=self.text,size=30}
    target:addChild(self.label)
    self.label:setPosition(target:getCenterPosition())
end
function M:setText( target,text )
	self.text = text
	self:updateView()
end
function M:updateView( target )
	self.label:setString(self.text)
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
	target:bindOnceMethod(self,"setText")
end
return M