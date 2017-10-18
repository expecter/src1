--
-- Author: Your Name
-- Date: 2017-05-03 11:43:47
--
local M = {
	_super = "GameNode",
	_name = "nodeSlider",
	_view = {
		_type = "node",
		contentsize = {width = 1136,height = 640},
		AnchPos = {x = 0,y = 0},
		pos = {x =0,y = 0},
	},
	_component = {
	},
	_children = {
		{
			_super = "GameNode",
			_name = "nodeSlider",
			_view = {
				_type = "node",
				contentsize = {width = 500,height = 640},
				-- AnchPos = {x = 0.5,y = 0.5},
				pos = {x =568,y = 320},
			},
			_component = {
				{
					_type = "ui_progressTimer",
				},
			},
		},
		{
			_super = "GameNode",
			_name = "nodeSlider",
			_view = {
				_type = "polygon",
				contentsize = {width = 500,height = 640},
				AnchPos = {x = 0.5,y = 0.5},
				pos = {x =568,y = 320},
			},
		},
	}
}
return M