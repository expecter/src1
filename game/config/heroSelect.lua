--
-- Author: Your Name
-- Date: 2016-11-13 19:14:21
--
local M = {
	_super = "GameLayer",
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
					contidion = {"contidion1","contidion2"},
				},
			}
		},
		{
			_super = "GameNode",
			_name = "child1",
			_component = {
				{
					_type = "cc_node",
					contentsize = {width = 600,height = 100},
					AnchPos = {x = 0,y = 0},
					pos = {x =10,y = 580},
				},
				{
					_type = "cache_chViewList", 
					tlData = {
						_type = "cache",refName = "refarmy",tmKey = {}
					}
				},				
				-- {
				-- 	_type = "cache_bind",
				-- 	caches = {
				-- 		{
				-- 			cacheName = "ObjArmy",
				-- 			tlComponent = {"cache_chViewList",},
				-- 		},
				-- 	},
				-- },
			},
		},
		{
			_super = "GameNode",
			_component = {
				{_name = "",_type = "cc_node",
				contentsize = {width = 154,height = 56},
				AnchPos = {x = 0,y = 0},
				pos = {x =0,y = 0},
				},
				{
					_type = "cc_sprite",spriteName = "img_btn_gray_2_n"
				},
				-- {
				-- 	_type = "cc_label",
				-- },
				{
					_type = "ex_hightlightComponent",
				},
				{
					_type = "cc_ClickComponent",
					isScale = true,
					--params可从clickcomponent里获取
					func = {path = "",funcName = "requestDoSomeThing",params = {}},
				},

			}
		},
	},
}

return M