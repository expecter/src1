--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
--运用于可切换的页面和节点
local M = class("eventComponent")
function M:ctor( target ,params)
	self.target = target
	self.defaultIndex = params.defaultIndex or 1
	self:setData(params)
	self.lastView = nil
	self.tlIndex = {}
	self.tlView = {}
end
function M:setData(params )
	self.tlData = params.tlData or {}
end
function M:initView( target )
	for i,cmdX in ipairs(self.tlData) do
		local view = require(cmdX.path).new(cmdX.params)
		-- view:setAnchorPoint(cc.p(0,0))
		-- view:setVisible(false)
		table.insert(self.tlView,view)
		target:addChild(view)
	end	
end
function M:updateView( target )
	if self.lastView and self.lastView.updateView then
		self.lastView:updateView()
	end
end

function M:getTlView()
	return self.tlView
end

function M:switchTo( target,index )
	local isInit = false
	for _,_index in ipairs(self.tlIndex) do
		if _index == index then 
			isInit = true
			break
		end
	end
    --分发事件
	if isInit == false then 
		table.insert(self.tlIndex,index)
		--初始化。
		if self.tlView[index].initView then
            self.tlView[index]:initView()
        end
	end

	if self.lastView then 
		--隐藏上一标签页显示
		self.lastView:setVisible(false)
		if self.lastView.exitView then
        	self.lastView:exitView()
    	end
	end
	self.lastView = self.tlView[index]
	if self.tlView[index].enterView then
        self.tlView[index]:enterView()
    end
    self.lastView:setVisible(true)
end
function M:bindFunc( target )
	target:bindMethod(self,"updateView")
	target:bindMethod(self,"initView")
	target:bindOnceMethod(self, "switchTo")
end
return M