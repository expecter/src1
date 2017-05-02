--
-- Author: Your Name
-- Date: 2016-08-09 21:25:00
--根据调用顺序写代码结构
--[[
viewlist
viewmulptex
]]
local M = class(...,function (  )
	return display.newNode()
end)
--ctor
function M:ctor( params )
	--TODOinitData
end
--外部调用方法
function M:updateData(  )
	
end

--initView
function M:getTlInitView(  )
	return {
		handler(self,self.initView),
	}
end

function M:initView(  )
	self.owner = CCBReader.load("ccbi_bag_itemView.ccbi")
	self:addChild(self.owner)
	self.viewList = UICommon.createViewList(self.owner.ccNodeNewAttr, false, 'v',0)
end
--enterView
function M:getTlOnEnter(  )
	return {
		handler(self,self.enterView),		
	}
end

function M:enterView(  )
	self:binding()
end

function M:binding(  )
	local gameCache = GameCacheMgr.getGameCacheByName("CmdItem")
	if gameCache then
		gameCache:bind(self,{
			onAdd = function ( cmdX )
				self:setData(cmdX)
				self:updateView()
			end,
			onUpdate = function ( cmdX )
				self:updateView()
			end,
			onDelete = function ( cmdX )
				self:updateView()
			end
			})
	end
	self:setData()
	self:updateView()
end

function M:setData( params )
	
end

function M:updateView(  )
	local tlNode = {}
	for i,cmdX in ipairs(GameObj.ObjHero.getData()) do
		table.insert(tlNode,self:createNode(cmdX))
	end
	self.viewList:setTlCcNode(tlNode)
end

function M:createNode( cmdX )
	local node = display.newNode()
	return node
end
--exitView
function M:getTlOnExit(  )
	return {
		handler(self,self.exitView),
	}
end

function M:exitView(  )
	self:unbind()
end

function M:unbind(  )
	local gameCache = GameCacheMgr.getGameCacheByName("CmdItem")
    gameCache:unbind(self)
end
--releaseView
function M:getTlReleaseView(  )
	return {
		handler(self,self.releaseView),
	}
end

function M:releaseView(  )
	
end

return M