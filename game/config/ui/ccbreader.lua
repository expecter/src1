--
-- Author: Your Name
-- Date: 2017-10-09 11:41:38
--
local M = {
	_super = "GameNode",
	_view = {
		_type = "scrollview",
		viewNode = {
			_super = "GameNode",
			_view = {
				_type = "ccreader",
				ccbName = "ccbi_capital",
			},									
		},
		viewsize = {width = 1136,height = 640},
	},
	_view = {
		_type = "ui_ccb",
		_params = {
			_name = "",
			
		},
	},
}
return M