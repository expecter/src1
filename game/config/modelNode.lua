--
-- Author: Your Name
-- Date: 2016-05-24 00:38:30
--
local M = {
	name = "login",
	_type = "GameNode",
	_component = {
		{_name = "",_type = "cc_node",
		contentsize = {width = 640,height = 1136},
		AnchPos = {x = 0,y = 0},
		pos = {x =0,y = 0},
		},
	},
	_children = {
		{
		_type = "GameNode",
		_name = "switchNode",
		_component = {
			{_name = "",_type = "cc_node",
			contentsize = {width = 300,height = 300},
			AnchPos = {x = 0,y = 0},
			pos = {x =0,y = 0},
			},
			{_type = "DrawComponent"},
			{_type = "ViewSwitchComponent",tlData = {
		{path = "game.config.TabNode1",params = {}},
		{path = "game.config.TabNode2",params = {}},
		{path = "game.config.TabNode1",params = {}},
		{path = "game.config.TabNode1",params = {}},
			}},
		}
		},
		{
			_type = "GameNode",
			_name = "child1",
			_component = {
				{
				_type = "cc_node",
				contentsize = {width = 600,height = 100},
				AnchPos = {x = 0,y = 0},
				pos = {x =10,y = 580},
				},
				{_type = "ViewListComponent", tlData = {
				{name = "步兵",tag = 10001,node = 1},
				{name = "弓兵",tag = 10101,node = 1},
				{name = "骑兵",tag = 10201,node = 2},
				{name = "器械",tag = 10302,node = 2}
				}},
				{_type = "modelComponent"}				
				-- DrawComponent = {},
			},
		},
	},
}
return M