--
-- Author: Your Name
-- Date: 2017-05-03 11:43:53
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
		-- {
		-- 	_type = "cc_sprite",spriteName = "img_picture_zhanyi_bg"
		-- },
		-- {
		-- 	_type = "demo_ComTest",
		-- },

	},
	_children = {
		
		{
			_super = "GameNode",
			_component = {
				{
				_type = "cc_node",
				contentsize = {width = 600,height = 100},
				AnchPos = {x = 0,y = 0},
				pos = {x =10,y = 580},
				},
				{
					_type = "ct_viewList", 
					tlData = 
					{
						_type = "ref",
						refName = "bagindex",
					},
					clickedEvent =
					{
						{_type = "switchto",
						nodeName = "switchNode",}
					},
				},
				-- {_type = "modelComponent"}				
				-- DrawComponent = {},
			},
		},
		{
			_super = "GameNode",
			_name = "switchNode",
			_component = {
				{
					_name = "",_type = "cc_node",
					contentsize = {width = 300,height = 300},
					AnchPos = {x = 0,y = 0},
					pos = {x =0,y = 0},
				},
				{
					_type = "ct_mutiViewComponent",
					tlData = 
					{
						_type = "ref",
						refName = "bagindex",
					},
				},
			}
		},
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
					clickedEvent = 
					{
						{_type = "Message",name = "replaceLayer",params = {name = "loginLayer"}}
					},
					data = {_type = "cache",refName = "refarmy",tmKey = {}},
				},
			},
		},
	},

}
return M