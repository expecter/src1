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
	-- self.caches = params.caches
end
function M:initView(  )	
end

function M:updateView(  )
end
--对应onenter
function M:enterView(  )

end
function M:bind( target,listenName,callback )
	print("listenName",listenName)
	ObjMessage:addEventListener(listenName,function(cmdX)
		if callback then
			callback(cmdX)
		end
	end)
end
function M:exitView(  )
	
end
--对应release
function M:releaseView(  )
	
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"bind")
end
return M