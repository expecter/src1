--
-- Author: Your Name
-- Date: 2016-10-04 23:58:53
--
local M = {
	name = "tabNode1",
	_super = "GameNode",
	_component = {
		{
			_type = "cc_node",
			contentsize = {width = 1136,height = 440},
			AnchPos = {x = 0,y = 0},
			pos = {x =0,y = 0},
		},
		{
			_type = "ct_ScrollViewComponent",
			viewNode = {
				_super = "GameNode",
				_component = {
					{
						_type = "cc_node",
					},
					{
						_type = "cc_sprite",
						spriteName = "back_5",
						isEnough = true,
					},
				},			
			},
			viewsize = {width = 300,height = 300},	
		},
	},
	_children = {

	},
}
return M