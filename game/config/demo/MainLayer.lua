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
	},
	_children = {				
		{
			_super = "GameNode",
			_name = "back",
			_component = {
				{_name = "",_type = "cc_node",
				contentsize = {width = 900,height = 600},
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
				},
			},
		},
		{
			_super = "GameNode",
			_name = "shop",
			_component = {
				{_name = "",_type = "cc_node",
				contentsize = {width = 200,height = 100},
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
						{_type = "Message",name = "replaceLayer",params = {name = "choukaLayer"}}
					},
				},
			},
		},
		{
			_super = "GameNode",
			_name = "bag",
			_component = {
				{_name = "",_type = "cc_node",
				contentsize = {width = 200,height = 100},
				AnchPos = {x = 0,y = 0},
				pos = {x = 400,y = 100},
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
						{_type = "Message",name = "pushpanel",params = {name = "bagpanel"}}
					},
				},
			},
		},
		{
			_super = "GameNode",
			_name = "fight",
			_component = {
				{_name = "",_type = "cc_node",
				contentsize = {width = 200,height = 100},
				AnchPos = {x = 0,y = 0},
				pos = {x = 500,y = 100},
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
						{_type = "Message",name = "replaceLayer",params = {name = "fubenLayer"}}
					},
				},
			},
		},
		{
			_super = "GameNode",
			_name = "label",
			_component = {
				{_name = "",_type = "cc_node",
				contentsize = {width = 200,height = 100},
				AnchPos = {x = 0,y = 0},
				pos = {x = 300,y = 100},
				},
				{
					_type = "cache_chLabel",
					_text = "",
				},
			},
		},
	},

}
return M