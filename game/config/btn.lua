--
-- Author: Your Name
-- Date: 2017-07-13 15:35:09
--
local M = {
	_super = "GameNode",
	_component = {
		{_name = "",_type = "cc_node",
		contentsize = {width = 154,height = 56},
		AnchPos = {x = 0,y = 0},
		pos = {x = 700,y = 100},
		},
		{
			_type = "cc_sprite",spriteName = "img_btn_gray_2_n"
		},
		{
			_type = "ex_hightlightComponent",
		},
	},
}
return M