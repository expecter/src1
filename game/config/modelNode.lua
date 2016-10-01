--
-- Author: Your Name
-- Date: 2016-05-24 00:38:30
--
local M = {
	name = "login",
	_type = "GameNode",
	component = {
		{_name = "",_type = "cc_node",
		contentsize = {width = 300,height = 300},
		AnchPos = {x = 0,y = 0},
		pos = {x =0,y = 0},
		},
		{_type = "DrawComponent"},
		{_type = "ViewSwitchComponent",tlData = {
		}},
	},
	children = {
		{
			_type = "GameNode",
			name = "child1",
			component = {
				{
				_type = "cc_node",
				contentsize = {width = 600,height = 100},
				AnchPos = {x = 0,y = 0},
				pos = {x =10,y = 580},
				},
				{_type = "ViewSwitchComponent", tlData = {
				{name = "步兵",tag = 10001,node = 1},
				{name = "弓兵",tag = 10101,node = 1},
				{name = "骑兵",tag = 10201,node = 2},
				{name = "器械",tag = 10302,node = 2}
				}},				
				-- DrawComponent = {},
			},
		},
	},
}
return M