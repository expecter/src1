--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("ct_viewList")
function M:ctor( target ,params)
	self.target = target
	self.cellMode = params.cellMode or function ( params )
		local config = GameSceneMgr.updateConfig("game.config.gameCell",{
			_type = "cc_label",
			text = params.name
		})
		return GameSceneMgr.createGameNode(config)
	end
	self.isMovable = params.isMovable
	self.isTapMenu = DEFAULT_TRUE(params.isTapMenu)
	self.defaultIndex = params.defaultIndex or 1
	self:setData(params)
end
function M:setData(params )
	self.tlData = params.tlData
end
-- function M:cellMode( cmdX )
	
-- end
--exportFunc
function M:initView( target )
	self.viewlist = UICommon.createViewList(target,self.isMovable)
	self:updateView()
end
function M:updateView( target )
	local tlNode = {}
	for k,v in ipairs(self.tlData) do
		local node = self.cellMode(v)
		-- node:setText(v.name)
        table.insert(tlNode,node)
    end
	self.viewlist:setTlCcNode(tlNode)
	if self.isTapMenu then
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
function M:setViewCallback( target,callback )
	self.callback_ = callback
	self.callback_(self.tlData[self.defaultIndex],self.defaultIndex)
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"setViewCallback")
end
return M