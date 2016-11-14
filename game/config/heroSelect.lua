--
-- Author: Your Name
-- Date: 2016-11-13 19:14:21
--
local M = {
	_type = "GameNode",
	_component = {
		{
			_type = "cc_node",
			contentsize = {width = 1136,height = 640},
			AnchPos = {x = 0,y = 0},
			pos = {x =0,y = 0},
		}
	},
	_children = {
		{
			_type = "GameNode",
			_component = {
				{
					_type = "cc_node",
					contentsize = {width = 1130,height = 240},
					AnchPos = {x = 0,y = 0},
					pos = {x =3,y = 400},
				},
				{
					_type = "cc_DrawComponent",
				},
			}
		},
		{
			_type = "GameNode",
			_component = {
				{
					_type = "cc_node",
					contentsize = {width = 300,height = 240},
					AnchPos = {x = 0,y = 0},
					pos = {x =568,y = 100},
				},
				{
					_type = "cc_spriteFrame",
					tlFrame = {
						"uires/cards/npc_animation_1",
					},
				},
				{
					_type = "cc_sprite",
					spriteFrameName = "img_npc_1_stanby1_01",
				},
				{
					_type = "cc_animation",
					spriteFrameName = "img_npc_1_stanby1_01",
				},
			}
		},
	},
}

return M