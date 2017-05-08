--
-- Author: Your Name
-- Date: 2017-05-03 11:43:41
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
			_type = "cc_sprite",spriteName = "img_picture_choukaBg1"
		},
		-- {
		-- 	_type = "demo_ComTest",
		-- },

	},
	_children = {
		{
			_super = "GameNode",
			_name = "back",
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
					clickedEvent = {_type = "Message",name = "replaceLayer",params = {name = "loginLayer"}},
					data = {_type = "cache",refName = "refarmy",tmKey = {}},
					condition = {},
				},
			},
		},
		{
			_type = "GameNode",
			_name = "switchNode",
			_component = {
				{
					_name = "",_type = "cc_node",
					contentsize = {width = 300,height = 300},
					AnchPos = {x = 0,y = 0},
					pos = {x =0,y = 0},
				},
				-- {_type = "DrawComponent"},
				{
				_type = "ViewSwitchComponent",tlData = {
					{path = "game.config.TabNode1",params = {}},
					{path = "game.config.TabNode2",params = {}},
					{path = "game.config.TabNode1",params = {}},
					{path = "game.config.TabNode1",params = {}},
				}},
		}
	},

}
return M