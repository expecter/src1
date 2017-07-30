--
-- Author: Your Name
-- Date: 2017-05-08 19:53:46
--
local M = {
	_super = "GameLayer",
	_component = {
		{
			_type = "cc_node",
			contentsize = {width = 1136,height = 640},
			AnchPos = {x = 0,y = 0},
			pos = {x =0,y = 0},
		},
		{
			_type = "demo_FightComponent",
		},
	},
}

return M