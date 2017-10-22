--
-- Author: Your Name
-- Date: 2016-10-04 23:58:53
--
local M = {
	name = "cell",
	_super = "GameNode",
	_view = {
		_type = "ui_sprite",
		spriteName = "img_btn_gray_2_n"
	},
	_component = {
		{
			_type = "ui_hightlightComponent",
		},
		{
			_type = "ui_ClickComponent",isScale = true
		},
	},
}
return M