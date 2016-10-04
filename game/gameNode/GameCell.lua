-----------------------------------------------------------------------------------------------  
-- @description 主场景和弹出框的基类 
-- @author  ny,hzp
-- @coryright  蜂鸟工作室
-- @release  2014/7/10
--------------------------------------------------------------------------------------------


local M = class(...,GameNode)

---构建函数
function M:ctor(params)
    if not params then params = {} end
    -- params.DrawComponent = {}
    params._component = {}
	table.insert(params._component,{_type = "ClickComponent",isScale = true})
    M.super.ctor(self,params)    
    -- self:setClickedEvent(handler(self,self.onTouch))
    -- self:initView()
    self:setData(params)
end
function M:setData( params )
	self.name = params.name or ""
end
function M:initView(  )
	M.super.initView(self)
	self:getComponent("ClickComponent"):setClickedEvent(handler(self,self.onTouch))
	self:setContentSize(154, 56)
	self.viewSprite = display.newSprite("img_btn_gray_2_s.png")
	self.viewSprite:setPosition(cc.p(self:getCenterPosition()))
	self:addChild(self.viewSprite)
	self.label = display.newTTFLabel{text=self.name,size=30}
    self:addChild(self.label,1)
    self.label:setPosition(self:getCenterPosition())
end
function M:updateView(  )
	M.super.updateView(self)
	self.label:setString(self.name)
end
function M:hightlight(  )
	self.viewSprite:setSpriteFrame(display.newSpriteFrame("img_btn_brown_2_n.png"))
	-- self:updateView()
end
function M:normal(  )
	self.viewSprite:setSpriteFrame(display.newSpriteFrame("img_btn_gray_2_s.png"))
	-- self:updateView()
end
--- 子类调用setTouchEnabled(true) 并重写onTouch方法实现触摸事件分发
function M:onTouch(event, x, y)
	-- self:hightlight()
end

return M




