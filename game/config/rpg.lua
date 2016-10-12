--
-- Author: Your Name
-- Date: 2016-10-08 20:53:50
--
local M = {
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
			_type = "TriggerManager",
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
				},
			}
		},
		{
			_type = "GameNode",
			_name = "hero",
			_attr = "object",
			_component = {
				{
					_type = "cc_node",
					pos = {x =568,y = 50},
					AnchPos = {x = 0,y = 0},
				},
				{
					_type = "cc_sprite",
					spriteFrameName = "hero1",
					isEnough = true,
				},
				-- {
				-- 	_type = "plane_shoot",
				-- },
				{
					_type = "TriggerComponent",
				},
				{ _type = "plane_attRange"},
			},
		},
		{
			_type = "GameNode",
			_name = "planeLabel",
			_component = {
				{
					_type = "cc_node",
					pos = {x =30,y = 600},
					AnchPos = {x = 0,y = 0},
				},
				{
					_type = "cc_label",
				},
			}
		},
		{
			_type = "GameNode",
			_name = "hero1",
			_attr = "object",
			_component = {
				{
					_type = "cc_node",
					pos = {x =0,y = 300},
					AnchPos = {x = 0,y = 0},
				},
				
				{
					_type = "cc_sprite",
					spriteFrameName = "enemy2",
					isEnough = true,
				},
				{					
					_type = "plane_move",
				},
				{
					_type = "HealthComponent",
				},
				{
					_type = "TriggerComponent",
				},
				{
					_type = "plane_heroRange",
				},		
			},
		},
	},
}

return M