--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("ct_viewList")
function M:ctor( target ,params)
	self.target = target
	
	self:setData(params)
end
function M:setData( params )
	self.tlData = CommonUtil.getData(params.tlData)
	self.cellMode = params.cellMode or function ( params ,index)
		local config = clone(require("game.config.gameCell"))
		table.insert(config._component,{
					_type = "cache_label",object = {
						name = "ObjArmy",
						key = index,
						field = "health",
					},
				})
		return GameSceneMgr.createGameNode(config)
	end
	if type(params.cellMode) == "table" then
		self.cellMode = function (  )
			return GameSceneMgr.createGameNode(params.cellMode)
		end
	end
	self.isMovable = params.isMovable
	self.isTapMenu = DEFAULT_TRUE(params.isTapMenu)
	self.defaultIndex = params.defaultIndex or 1
	local clickedEvent = params.clickedEvent
	if clickedEvent then
		self.callback_ = function ( params,index )
			for k,v in pairs(clickedEvent) do
				if v._type == "switchto" then
		            local switchNode = GameSceneMgr.getGameNode(v.nodeName)
		            switchNode:switchTo(index)
		        end
			end			
		end
	end
	
end
--exportFunc
function M:initView(  )
	self.viewlist = UICommon.createViewList(self.target,self.isMovable)
	-- self:updateView()
end

function M:enterView(  )
	self:updateView()
end

function M:updateView( target )
	local tlNode = {}
	for k,v in ipairs(self.tlData) do
		local node = self.cellMode(v,k)
		node:initView()
        table.insert(tlNode,node)
    end
	self.viewlist:setTlCcNode(tlNode)
	if self.isTapMenu then --切换标签，有高亮和正常显示
		local orgNode = nil
		local function switchEvent( index )
	        if orgNode and orgNode.normal then
	            orgNode:normal()
	        end
	        orgNode = tlNode[index]
	        if orgNode and orgNode.hightlight then
	            orgNode:hightlight()
	        end
	        if self.callback_ then
	            self.callback_(self.tlData[index],index)
	        end
	        orgNode:updateView()
	    end
	    self.viewlist:setClickedEvent(function ( node,index,x,y )
	        switchEvent(index)
	    end)
	    switchEvent(self.defaultIndex)
	else
		self.viewlist:setClickedEvent(function ( node,index,x,y )
	    end)
	end
end
function M:getViewList(  )
	return self.viewlist
end
--isFirst表示是否第一次回调
function M:setViewCallback( target,callback,isFirst )
	self.callback_ = callback
	if isFirst then
		self.callback_(self.tlData[self.defaultIndex],self.defaultIndex)
	end	
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"setViewCallback")
	target:bindOnceMethod(self,"getViewList")
end
return M