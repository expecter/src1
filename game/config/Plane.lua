--
-- Author: Your Name
-- Date: 2016-10-04 23:58:53
--
local M = {
	name = "tabNode1",
	_type = "GameNode",
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
		_type = "GameNode",
			_component = {
				{
					_type = "cc_spriteFrame",
					tlFrame = {
						"shoot_background",
						"shoot",
					},
				}
			}
		},
		{
			_type = "GameNode",
			_name = "map",
			_component = {
				{
					_type = "cc_node",
					contentsize = {width = 480,height = 640},
					AnchPos = {x = 0.5,y = 0},
					pos = {x =568,y = 0},
				},
				{
					_type = "ct_rollComponent"
				},
			},
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
				{
					_type = "ct_viewList", 
					tlData = {
						_type = "ref",refName = "refarmy",tmKey = {node = 1}
					}
				},
				{_type = "modelComponent"}
			},
		},
		{
			_type = "GameNode",
			_name = "hero",
			_component = {
				{
					_type = "cc_node",
					pos = {x =568,y = 0},
					AnchPos = {x = 0,y = 0},
				},
				{
					_type = "cc_sprite",
					spriteFrameName = "hero1",
					isEnough = true,
				},
			},
		},		
		{
			_type = "GameNode",
			_name = "Joytick",
			_component = {
				{
					_type = "cc_node",
					contentsize = {width = 120,height = 120},
					pos = {x =120,y = 120},
					AnchPos = {x = 0,y = 0},
				},
				{
					_type = "cc_sprite",
					spriteFrameName = "Direction_bc",
					isEnough = true,
				},
				
				{
					_type = "JoytickComponent"
				},
			},
		},
		{
			_type = "GameNode",
			_component = {
				{_type = "plane_planeComponent"}
			},
		},
	},
}
return M