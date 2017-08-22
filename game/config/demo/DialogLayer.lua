--
-- Author: Your Name
-- Date: 2017-08-20 00:01:32
--对白ui

local M = {
	_super = "GameLayer",
	_component = 
	{
		{
			_type = "cc_node",
			contentsize = {width = 1136,height = 640},
			AnchPos = {x = 0,y = 0},
			pos = {x =0,y = 0},
		},
		{
			_type = "cc_sprite",spriteName = "img_picture_choukaBg1"
		},
		-- {
		-- 	_type = "demo_Dialog",
		-- },
		{
			_type = "cc_spriteFrame",
			tlFrame = {
				"shoot_background",
				"shoot",
			},
		}
			
	},
	_children = {
		{
			_super = "GameNode",
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
			_super = "GameNode",
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
	},
}
return M
