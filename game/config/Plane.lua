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
					contentsize = {width = 1136,height = 640},
					AnchPos = {x = 0,y = 0},
					pos = {x =0,y = 0},
				},
				{
					_type = "ScrollViewComponent",
					viewNode = {
						_type = "GameNode",
						_component = {
							{
								_type = "cc_node",
							},
							{
								_type = "CCbComponent",
								ccbName = "ccbi_capital",
							},
						},			
					},
					viewsize = {width = 1136,height = 640},
					movable = false,	
				},
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
					_type = "ClickComponent",
				},
				{
					_type = "ScheduleComponent",
				},
				{
					_type = "JoytickComponent"
				},
			},
		},
		{
			_type = "GameNode",
			_component = {
				{_type = "planeComponent"}
			},
		},
	},
}
return M