--
-- Author: Your Name
-- Date: 2016-10-04 23:58:53
--
local M = {
	name = "tabNode3",
	_super = "GameNode",
	_component = {
		{
			_type = "cc_node",
			contentsize = {width = 300,height = 300},
			AnchPos = {x = 0,y = 0},
			pos = {x =0,y = 0},
		},
	},
	_children = {
		{
			_super = "GameNode",
			_name = "back",
			_component = {
				{_name = "",_type = "cc_node",
				contentsize = {width = 154,height = 56},
				AnchPos = {x = 0,y = 0},
				pos = {x = 100,y = 100},
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
					-- clickedEvent = 
					-- {
					-- 	{_type = "Message",name = "replaceLayer",params = {name = "loginLayer"}}
					-- },
				},
				{_type = "demo_printdialog"}
			},
		},
	},
}
return M