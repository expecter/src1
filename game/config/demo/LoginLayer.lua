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
		{
			_type = "ui_sliderComponent",
		},
	},

}
return M