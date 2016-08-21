--
-- Author: Your Name
-- Date: 2016-08-09 21:25:00
--
local M = class(...,function (  )
	return display.newNode()
end)
function M:ctor( params )
	self:initData(params)
	self:initView()
end
--初始化数据
function M:initData( params )
	--TODO
	self:setData(params)
end
--可多帧更新数据
function M:setData( params )
	--TODO initData or updateData
end
function M:initView(  )
	--TODO initView
	--self.owner = display.newNode()
	--self:addChild(self.owner)
	self:updateView()
end

function M:updateView( params )
	if params then
		self:setData(params)
	end
	--DO updateview
	-- self.owner:updateView()
end

return M