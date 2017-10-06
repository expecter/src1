--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( params)
	self:setData(params)
end
function M:setData(params )
	self.dialog = ref.dialog.getTlRef{}
	self.index = 1
end
function M:initView( target )
	self.target:setClickedEvent(function (  )
		if self.dialog[self.index] then
			dump(self.dialog[self.index])
		end
		self.index = self.index+1
	end)
end
function M:updateView( target )
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