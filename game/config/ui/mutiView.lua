--
-- Author: Your Name
-- Date: 2017-05-03 11:43:47
--
local M = {
	_super = "GameNode",
	_view = {
		_type = "ui_node",
		contentsize = {width = 1136,height = 640},
		AnchPos = {x = 0,y = 0},
		pos = {x =0,y = 0},
	},
	_children = {			
			{
				_super = "GameNode",
				_view = {
					_type = "ui_node",
					contentsize = {width = 1136,height = 640},
					AnchPos = {x = 0,y = 0},
					pos = {x =0,y = 0},
				},
				_component = {
				{
					_type = "ui_mutiViewComponent",
					tlData = {
						{path = "game.config.TabNode2",params = {}},
						{path = "game.config.TabNode3",params = {}},
					},
				},
				{
					_type = "dispatch_switchView",
					-- btnName = "switchNode",
					-- eventName = 
					tlEventName = {
						"LoginLayer_switchto",
					},
				},
				},
			},
			{
				_name ="switchNode",
				_super = "GameNode",
				_view = {
					_type = "ui_node",
					contentsize = {width = 1136,height = 140},
					AnchPos = {x = 0,y = 0},
					pos = {x =0,y = 0},
				},
				_component = {
				{
					_type = "ui_viewList",
					object = 
					{
						--道具背包数据
						_data = "ref",
						refName = "bagindex",
					},
					clickedEvent = {
						{_type = "Message",name = "LoginLayer_switchto"}
					},
				}
				},
			},
	},

}
return M