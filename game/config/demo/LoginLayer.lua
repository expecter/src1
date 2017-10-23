--
-- Author: Your Name
-- Date: 2017-10-09 11:41:38
--
local M = {
	_super = "GameNode",
	_view = {
		_type = "ui_ccReader",
		ccbName = "ccbi_newTroop_operation_panel",
		viewsize = {width = 1136,height = 640},
		tlCallback = {
			onBtnReviveClick = {_type = "Message",name = "LoginLayer_switchto"}
		},
		tlNode = {
			ccLabelHeroName = {
				_super = "GameNode",
				_view = {
					_type = "ui_label",
					text = "aaaaaaa",
					visible = true,
				},
				_component = {
					{
						_type = "dispatch_bind",
					},
				},			
			},
			-- ccLabelName = {

			-- },
		},
	},
}
return M