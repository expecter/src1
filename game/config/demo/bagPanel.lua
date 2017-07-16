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
			contentsize = {width = 700,height = 500},
			AnchPos = {x = 0.5,y = 0.5},
			pos = {x =568,y = 320},
		},
		-- {
		-- 	_type = "cc_DrawComponent"
		-- },
		{
			_type = "cc_scale9Sprite",spriteName = "img_scale9_panelbg"
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
					contentsize = {width = 700,height = 500},
					AnchPos = {x = 1,y = 0},
					pos = {x =700,y = 500},
				},
				{
					_type = "ct_viewList", 
					tlData = 
					{
						--道具背包数据
						_type = "ref",
						refName = "bagindex",
					},
				},
				{
					_type = "demo_bagPanelComponent"
				},
				
			}
		},
		{
			--显示道具详情，并且会根据缓存更新
			_super = "GameNode",
			_name = "switchNode",
			_component = {
				{
					_name = "",_type = "cc_node",
					contentsize = {width = 550,height = 350},
					AnchPos = {x = 0,y = 0},
					pos = {x =0,y = 0},
				},
				{
					_type = "ct_viewList", 
					unit = 2,
					tlData = 
					{
						--道具背包数据
						_type = "ref",
						refName = "item",
						-- params = "",
					},
				},
				{
					_type = "demo_handlerComponent"
				},
			},
		},
	},

}
return M