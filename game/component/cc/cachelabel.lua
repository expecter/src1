--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( target ,params)
	self.target = target
	self.tlData = GameObj.ObjArmy.getCacheData()
	self.index = params.index
	self:setData(params)
end
function M:setData(params )
end
function M:initView( target )
	self.label = display.newTTFLabel{text=self.text,size=30}
    self.target:addChild(self.label)
    self.label:setPosition(self.target:getCenterPosition())
    -- self.label:setAnchorPoint(cc.p(0,0))
    self:updateView()
end
function M:updateView( )
	self.label:setString(self.tlData[self.index].health)
end
function M:onUpdate( cmdX )
	self:updateView()
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
end
return M