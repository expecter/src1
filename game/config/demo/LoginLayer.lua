--
-- Author: Your Name
-- Date: 2017-05-03 11:43:47
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
			_type = "demo_Comlogin",

		},
	},
	_children = {
		{
			_super = "GameNode",
			_component = {
				{_name = "",_type = "cc_node",
				contentsize = {width = 154,height = 56},
				AnchPos = {x = 0,y = 0},
				pos = {x = 300,y = 100},
				},
				{
					_type = "cc_sprite",spriteName = "img_btn_gray_2_n"
				},
				{
					_type = "ex_hightlightComponent",
				},
				{
					_type = "cc_ClickComponent",
					isScale = true,
					clickedEvent = {event = "Message",name = "replaceLayer",params = {name = "MainLayer"}},
				},
			},
		},
	},

}
return M