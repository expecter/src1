--
-- Author: Your Name
-- Date: 2017-05-03 11:43:47
--
local M = {
	_super = "GameNode",
	_view = {
		_type = "node",
		contentsize = {width = 1136,height = 640},
		AnchPos = {x = 0,y = 0},
		pos = {x =0,y = 0},
	},
	_children = {
			{
				_name ="switchNode",
				_super = "GameNode",
				_view = {
					_type = "node",
					contentsize = {width = 1136,height = 140},
					AnchPos = {x = 0,y = 0},
					pos = {x =0,y = 600},
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
						-- {_type = "Message",name = "LoginLayer_switchto"}
					},
				}
				},
			},
	},

}
return M