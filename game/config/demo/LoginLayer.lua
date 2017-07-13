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
			_type = "cc_sprite",spriteName = "img_picture_login_bg"
		},
	},
	_children = {
		{
			_super = "btn",
			_component = {
				{_name = "",_type = "cc_node",
				contentsize = {width = 154,height = 56},
				AnchPos = {x = 0,y = 0},
				pos = {x = 300,y = 100},
				},
				{
					_type = "cc_ClickComponent",
					clickedEvent = 
					{
						{_type = "Message",name = "request",params = {cacheName = "CacheItem",funcName = "newItem",params = {}}}
					},
				},
			},
		},
		{
			_super = "btn",
			_component = {
				{_name = "",_type = "cc_node",
				contentsize = {width = 154,height = 56},
				AnchPos = {x = 0,y = 0},
				pos = {x = 500,y = 100},
				},
				{
					_type = "cc_ClickComponent",
					clickedEvent = {{_type = "Message",name = "exitGame",params = {name = "choukaLayer"}}},
				},
			},
		},
		{
			_super = "btn",
			_component = {
				{
					_type = "cc_ClickComponent",
					clickedEvent = {{_type = "Message",name = "showPanel",params = {name = "bagPanel"}}},
				},
			},
		},
	},

}
return M