--
-- Author: Your Name
-- Date: 2017-05-03 11:43:33
--
local M = {
	_super = "GamePanel",
	_name = "bagPanel",
	_component = {
		{
			_type = "ui_node",
			contentsize = {width = 700,height = 500},
			AnchPos = {x = 0.5,y = 0.5},
			pos = {x =568,y = 320},
		},
		-- {
		-- 	_type = "cc_DrawComponent"
		-- },
		{
			_type = "ui_scale9Sprite",spriteName = "img_scale9_panelbg"
		},
		-- {
		-- 	_type = "demo_bagPanelComponent",
		-- },
		{
			_type = "demo_bagPanelComponent"
		},
	},
	_children = {
		{
			_super = "GameNode",
			_name = "switchMenu",
			_component = {
				{
					_name = "",_type = "ui_node",
					contentsize = {width = 700,height = 500},
					AnchPos = {x = 1,y = 0},
					pos = {x =700,y = 500},
				},
				{
					_type = "ui_viewList", 
					tlData = 
					{
						--道具背包数据
						_type = "ref",
						refName = "bagindex",
					},
					{--首次进入界面时进行的操作
						_type = "",
					},
					{--接收数据更新时的变化
						_type = "",
					},
				},				
			}
		},
		{
			--显示道具详情，并且会根据缓存更新
			_super = "GameNode",
			_name = "switchNode",
			_component = {
				{
					_name = "",_type = "ui_node",
					contentsize = {width = 550,height = 350},
					AnchPos = {x = 0,y = 0},
					pos = {x =0,y = 0},
				},
				{
					_type = "ui_viewList", 
					unit = 3,
					dir = "v",
					tlData = 
					{
						--道具背包数据
						_type = "obj",
						ObjName = "ObjHero",
						funcName = "getHeroById",
						-- params = "",
					},
				},

				-- {
				-- 	_type = "demo_handlerComponent"
				-- },
			},
		},
	},
}
return M