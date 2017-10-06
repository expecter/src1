--
-- Author: Your Name
-- Date: 2017-05-03 23:28:17
--
local M = class("componentBase")
function M:ctor( params)
	self:setData(params)
end

function M:setData(params )

end

-- function M:getDepends(  )
-- 	return 
-- 	{
-- 		{
-- 			_type = "ct_viewList",
-- 			tlData = self.tlData,
-- 			cellMode = function ( params ,index)
-- 				local config = clone(require("game.config.gameCell"))
-- 				-- config._data = params
-- 				table.insert(config._component,{_type = "cache_chLabel"})
-- 				return GameSceneMgr.createGameNode(config)
-- 			end
-- 		},
-- 	}
-- end

function M:initView( target )
	GameMessage:addEventListener("work",function (  )
		print("I am work")
	end)
end

function M:enterView( target )
end

return M