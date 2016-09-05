--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class("eventComponent")
function M:ctor( target ,params)
	self.target = target
	self.cellMode = params.cellMode or hanlder(self,self.cellMode)
	self.isMovable = params.isMovable
end
function M:setData(params )
	self.tlData = params.tlData
end
function M:cellMode( cmdX )
	
end
--exportFunc
function M:initView( target )
	self.viewlist = UICommon.createViewList(self,self.isMovable)	
end
function M:updateView(  )
	local tlNode = {}
	for k,v in pairs(self.tlData) do
        table.insert(tlNode,self.cellMode({owner = v}))
    end
	self.viewlist:setTlCcNode(tlNode)
end
function M:bindFunc( target )
	target:bindMethod(self,"updateView")
	target:bindMethod(self,"initView")    
end
return M