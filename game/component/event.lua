--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( target ,params)
	self.target = target
	self:setData(params)
end
function M:setData(params )
end
function M:initView(  )
	
end
function M:updateView(  )
end
--对应onenter
function M:enterView(  )
	self.target:setViewCallback(function ( data,index )
		GameObj.ObjArmy.updateNum(index)
	end)
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