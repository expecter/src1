--
-- Author: Your Name
-- Date: 2016-10-04 23:58:53
--
local M = {
	name = "cell",
	_type = "GameNode",
	_component = {
		{_name = "",_type = "cc_node",
		contentsize = {width = 154,height = 56},
		AnchPos = {x = 0,y = 0},
		pos = {x =0,y = 0},
		},
		{
			_type = "cc_sprite",
		},
		{
			_type = "cc_label",
		},
		{
			_type = "hightlightComponent",
		},
		{
			_type = "ClickComponent",isScale = true
		},
	},
	_children = {

	},
}
return M