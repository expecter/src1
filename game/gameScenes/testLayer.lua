--测试接口专用界面
local M = class(..., GameLayer)

function M:ctor(  )
	M.super.ctor(self)	
end

function M:setData(  )
	self.className = ""
	self.funcName = ""
end

function M:initView(  )
	local tlData = {}
	local node = GameSceneMgr.createGameNode({
		_super = "GameNode",
		_component = {
			{
				_type = "ct_viewList",
				tlData = tlData,
			}
		}
	})
	node:setViewCallback(function ( data,index )
		self:selectFunc(tlData[index])
	end)
	self:addChild(node)
	local editbox --添加参数用的按钮
	local btn
	local label --提示参数标签
end

function M:selectFunc( data )
	self.className = data.className
	self.funcName = data.funcName
end

function M:request( className,funcName,params )
	local CacheObj = GameCache[className]
	if CacheObj then
		CacheObj[funcName](params)
	end	
end


return M