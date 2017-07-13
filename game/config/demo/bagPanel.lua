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
			pos = {x =300,y = 300},
		},
		{
			_type = "cc_sprite",spriteName = "img_scale9_panelbg"
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
					contentsize = {width = 300,height = 300},
					AnchPos = {x = 0,y = 0},
					pos = {x =0,y = 0},
				},
				{
					_type = "ct_viewList", 
					tlData = 
					{
						--道具背包数据
						_type = "ref",
						refName = "bagindex",
						clickedEvent = {
							
						},
					},
				},
			}
		},
		{
			--显示道具详情，并且会根据缓存更新
			_super = "GameNode",
			_name = "itemInfo",
			_component = {
				{
					_name = "",_type = "cc_node",
					contentsize = {width = 300,height = 50},
					AnchPos = {x = 0,y = 0},
					pos = {x =0,y = 0},
				},
				-- {
				-- 	_type = "show"
				-- },
				-- {
				-- 	_type = "binding",
				-- },
			},
		},
	},

}
return M