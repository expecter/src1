--
-- Author: Your Name
-- Date: 2016-10-07 17:33:01
--
local M = {
	_type = "GameNode",
	_component = {
		{
			_type = "cc_node",
			contentsize = {width = 1600,height = 1000},
			AnchPos = {x = 0,y = 0},
			pos = {x =0,y = 0},
		}
	},
	_children = {
		{
			_type = "GameNode",
			_name = "map",
			_component = {
				{
					_type = "cc_node",
					contentsize = {width = 1600,height = 1000},
					AnchPos = {x = 0,y = 0},
					pos = {x =0,y = 0},
				},
				{
					_type = "cc_sprite",
					spriteFrameName = "MapA0002Bg",
					isEnough = true,
				},
				{
					_type = "mapcomponent",
				},
				{
					_type = "cameraComponent",
				},
			}
		},
	},
}

return M