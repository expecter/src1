--
-- Author: Your Name
-- Date: 2016-10-08 20:53:50
--
local M = {
	_type = "GameNode",
	_component = {
		{
			_type = "cc_node",
			contentsize = {width = 1136,height = 640},
			AnchPos = {x = 0,y = 0},
			pos = {x =0,y = 0},
		}
	},
	_children = {
		{
		_type = "GameNode",
			_component = {
				{
					_type = "cc_node",
					contentsize = {width = 1136,height = 640},
					AnchPos = {x = 0,y = 0},
					pos = {x =0,y = 0},
				},
				{
					_type = "cc_spriteFrame",
					isCcz = true,
					tlFrame = {
						"bubble",
					},
				},
				{
					_type = "bb_bubble",
				},
			}
		},
	},
}

return M