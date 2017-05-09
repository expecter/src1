--
-- Author: Your Name
-- Date: 2017-05-03 11:43:33
--
local M = {
	_super = "GamePanel",
	_component = {
		{
			_type = "cc_node",
			contentsize = {width = 500,height = 300},
			AnchPos = {x = 0,y = 0},
			pos = {x =200,y = 300},
		},
	},
	_children = {
		{
			_super = "GameNode",
			_name = "switchNode",
			_component = {
				{
					_name = "",_type = "cc_node",
					contentsize = {width = 300,height = 50},
					AnchPos = {x = 0,y = 0},
					pos = {x =0,y = 0},
				},
				{
					_type = "ct_viewList", tlData = 
					{
						{name = "步兵",tag = 10001,node = 1},
						{name = "弓兵",tag = 10101,node = 1},
						{name = "骑兵",tag = 10201,node = 2},
						{name = "器械",tag = 10302,node = 2}
					},
				},
			}
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
					_type = "mutiViewComponent",tlData = 
					{
						{path = "game.config.TabNode1",params = {}},
						{path = "game.config.TabNode2",params = {}},
						{path = "game.config.TabNode1",params = {}},
						{path = "game.config.TabNode1",params = {}},
					}
				},
			}
		},
	},

}
return M