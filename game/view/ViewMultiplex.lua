-- 多标签页面
-- Author: qj
-- Date: 

local M = class(..., function()
    return display.newNode()
end)


function M:ctor(params)
    params = params or {}

    self.tlView = {}

    self.tlIndex = {}
    self:setData(params)

    self.lastView = nil
end

function M:setData(params)
	if params.size then 
		self:setContentSize(params.size)
	end
end
--增加子标签页
function M:addView(view)
	if view then 
		table.insert(self.tlView,view)
		self:addChild(view)
	end
end

function M:getTlView()
	return self.tlView
end
--页面切换
--如需要考虑等待页面加载完的处理，可以直接扩展传入参数switchTo(index ,callback)  
function M:switchTo(index)
	assert(self.tlView[index], string.format("no exist view %s",index))

	local isInit = false
	for _,_index in ipairs(self.tlIndex) do
		if _index == index then 
			isInit = true
			break
		end
	end
	
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

return M