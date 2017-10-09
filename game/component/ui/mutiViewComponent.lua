--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
--运用于可切换的页面和节点
local M = class(...,componentBase)
function M:ctor(params)
	M.super.ctor(self,params)
	self.defaultIndex = params.defaultIndex or 1
	self:setData(params)
	self.lastView = nil
	self.tlIndex = {}
	self.tlView = {}
end
function M:setData(params )
	self.tlData = ComponentUtil.getData(params.tlData)
end
function M:initView( target )
	for i,cmdX in ipairs(self.tlData) do
		table.insert(self.tlView,GameSceneMgr.createGameNode(clone(require(cmdX.path))))
	end
	self.target:switchTo(self.defaultIndex)
end

function M:onUpdate( cmdX )
	self.lastView:updateView()
end

function M:updateView( target )
	if self.lastView and self.lastView.updateView then
		self.lastView:updateView()
	end
end

function M:getTlView()
	return self.tlView
end

function M:switchTo( target,index,params )
	if not self.tlView[index] then
		print("没有该序号")
		return
	end
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
            self.tlView[index]:initView(self.target:getView())
        end
	end

	if self.lastView then 
		--隐藏上一标签页显示
		self.lastView:getView():setVisible(false)
		if self.lastView.exitView then
        	self.lastView:exitView(params)
    	end
	end
	self.lastView = self.tlView[index]
	if self.tlView[index].enterView then
        self.tlView[index]:enterView(params)
    end
    self.lastView:getView():setVisible(true)
end
function M:bindFunc( target )
	target:bindOnceMethod(self, "switchTo")
end
return M