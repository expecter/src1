--
-- Author: Your Name
-- Date: 2016-11-19 17:50:12
--
local M = class("cache_chViewList")
function M:ctor( target,params )
	self.target = target
	self.cacheName = ""
	self:setData(params)
end
function M:setData(  )
	self.tlData = GameObj.ObjArmy.getCacheData()
end
function M:getDepends(  )
	return {
		{
			_type = "ct_viewList",
			tlData = self.tlData,
			cellMode = function ( params ,index)
				local config = clone(require("game.config.gameCell"))
				-- config._data = params
				table.insert(config._component,{
							_type = "cache_chLabel",object = {
								name = "ObjArmy",
								key = index,
								field = "health",
							},
						})
				return GameSceneMgr.createGameNode(config)
			end
		},
		{
			_type = "cache_bind",
		},		
	}
end

-- function M:initView(  )
	
-- end

--缓存使用方法
function M:onAdd( cmdX )
	local index = GameObj.ObjArmy.getIndex(self.tlData,cmdX)
	self.target:getViewList():insertCcNode(self.cellMode(cmdX),index)
end

function M:onUpdate( cmdX )
	local index = GameObj.ObjArmy.getIndex(self.tlData,cmdX)
	self.target:getViewList():getTlCcNode()[index]:updateView()
end

function M:onDelete( cmdX )
	local index = GameObj.ObjArmy.getIndex(self.tlData,cmdX)
	self.target:getViewList():removeNode(function(viewHospitalItem, i)
			return i == index
		end)
end
function M:enterView(  )
	self.target:bind(self,"ObjArmy")
	self.target:setViewCallback(function ( cmdX,index )
		-- print("AAAA",index)
	end)
end
return M