--
-- Author: Your Name
-- Date: 2017-10-09 11:41:38
--
local M = {
	_super = "GameNode",
	_view = {
		_type = "node",
		contentsize = {width = 1136,height = 640},
		AnchPos = {x = 0,y = 0},
		pos = {x =0,y = 0},
	},
	_component = {
		{
			_type = "ui_ClickComponent",
			clickedEvent = {

			},
		},
	},
}
return M