--
-- Author: Your Name
-- Date: 2017-08-20 00:01:32
--对白ui

local M = {
	_super = "GameLayer",
	_component = 
	{
		{
			_type = "cc_node",
			contentsize = {width = 1136,height = 640},
			AnchPos = {x = 0,y = 0},
			pos = {x =0,y = 0},
		},
		{
			_type = "cc_sprite",spriteName = "img_picture_choukaBg1"
		},
		{
			_type = "demo_Dialog",
		},
	},
}
return M
