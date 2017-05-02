--
-- Author: Your Name
-- Date: 2016-10-08 20:53:50
--
local M = {
	_super = "GameLayer",
	_name = "map",
	_component = {
		{
			_type = "cc_node",
			contentsize = {width = 1136,height = 640},
			AnchPos = {x = 0,y = 0},
			pos = {x =0,y = 0},
		},
		{ _type = "loadComponent"},
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
				{_type = "ct_viewList", tlData = {
				{name = "步兵",tag = 10001,node = 1},
				{name = "弓兵",tag = 10101,node = 1},
				{name = "骑兵",tag = 10201,node = 2},
				{name = "器械",tag = 10302,node = 2},
				{name = "器械",tag = 10302,node = 2},
				{name = "器械",tag = 10302,node = 2},
				{name = "器械",tag = 10302,node = 2},
				{name = "器械",tag = 10302,node = 2},
				{name = "器械",tag = 10302,node = 2},
				{name = "器械",tag = 10302,node = 2},
				}},
				-- {_type = "modelComponent"}				
				-- DrawComponent = {},
			},
		},
	},
}

return M