--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("eventComponent")
function M:ctor( target ,params)
	self.target = target
	self.cellMode = params.cellMode or function ( params )
		return GameCell.new(params)
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
	-- self.viewlist = UICommon.createViewList(target,self.isMovable)	
end
function M:updateView( target )
	if not self.viewlist then
		self.viewlist = UICommon.createViewList(target,self.isMovable)
	end	
	local tlNode = {}
	for k,v in ipairs(self.tlData) do
        table.insert(tlNode,self.cellMode({owner = v}))
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
	end
end
function M:setViewCallback( target,callback )
	self.callback_ = callback
	self.callback_(self.tlData[self.defaultIndex],self.defaultIndex)
end
function M:bindFunc( target )
	target:bindMethod(self,"updateView")
	target:bindMethod(self,"initView")
	target:bindOnceMethod(self,"setViewCallback")
end
return M