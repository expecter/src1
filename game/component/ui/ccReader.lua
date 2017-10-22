--
-- Author: Your Name
-- Date: 2016-08-29 23:32:42
--
local M = class(...,componentBase)
function M:ctor(params)
	M.super.ctor(self,params)
	self:setData(params)
end
function M:setData(params )
	self.ccbName = params.ccbName or "ccbi_capital"
	self.tlCallback = {}
	self.tlNode = params.tlNode or {}
	self.owner = params._ccNode
	for k,v in pairs(params.tlCallback or {}) do
		self.tlCallback[k] = ComponentUtil.getCallFunc(v)
	end
end
-- function M:cellMode( cmdX )
	
-- end
--exportFunc
function M:initView( parent )
	-- self.owner = self.target:getView()
	if not self.owner then
		self.owner = CCBReader.load(string.format("%s.ccbi",self.ccbName),self.tlCallback)
		if parent then
			parent:addChild(self.owner)
		end
	end
	for k,v in pairs(self.tlNode) do
		v._view._ccNode = self.owner[k]
		v._super = "GameNode"
		-- local node = GameSceneMgr.createGameNode(v)
		-- node:initView(self.target:getView())
		-- node:enterView()
		self.target:addGameChild(v)
		print("AAAAAAAAAA")
	end
	for k,v in pairs(self.tlCallback) do
		self.owner.events[k] = v
	end

end

function M:getView(  )
	return self.owner
end
function M:updateView( )
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"getOwner")
	target:bindMethod(self,"getView")
end
return M