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
			_type = "mutiViewComponent",
			tlData = 
			{
				{path = "game.config.TabNode1",params = {}},
				{path = "game.config.TabNode2",params = {}},
				{path = "game.config.TabNode1",params = {}},
				{path = "game.config.TabNode1",params = {}},
			}
		},
	}
end

function M:initView( target )	
end
function M:updateView( target )
end
--对应onenter
function M:enterView(  )
	
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