--
-- Author: Your Name
-- Date: 2017-10-09 11:41:38
--
local M = {
	_super = "GameNode",
	_view = {
		_type = "ui_ccReader",
		ccbName = "ccbi_troop_simple_cell",
		viewsize = {width = 1136,height = 640},
		tlCallback = {
			onBtnReviveClick = {_type = "Message",name = "LoginLayer_switchto"}
		},
		tlNode = {
			ccLabelHeroName = {
				_view = {
					_type = "ui_label",
					text = "aaaaaaa",
					visible = true,
				},				
			},
		},
	},
}
return M