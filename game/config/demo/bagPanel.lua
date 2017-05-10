--
-- Author: Your Name
-- Date: 2017-05-03 11:43:33
--
local M = {
	_super = "GamePanel",
	_name = "bagPanel",
	_component = {
		{
			_type = "cc_node",
			contentsize = {width = 500,height = 300},
			AnchPos = {x = 0,y = 0},
			pos = {x =200,y = 300},
		},
		-- {
		-- 	_type = "demo_bagPanelComponent",
		-- },
	},
	_children = {
		{
			_super = "GameNode",
			_name = "switchMenu",
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
						_type = "ref",
						refName = "bagindex",
						clickedEvent = {
							_type = "switch",
							nodeName = "switchNode",
						},
					},
				},
				{
					_type = "cache_binding",
					caches = {
						{name = "Cache1",component = {"ct_viewList"}},
						{name = "Cache2",component = {"ct_viewList"}},
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
					_type = "ct_mutiViewComponent",tlData = 
					{
						_type = "ref",
						refName = "bagindex",
					},
				},
			}
		},

	},

}
return M