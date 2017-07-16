--
-- Author: Your Name
-- Date: 2016-10-04 23:58:53
--
local M = {
	name = "panel",
	_type = "GameNode",
	_component = {
		{
			_name = "",
			_type = "cc_node",
			contentsize = {width = 300,height = 300},
			AnchPos = {x = 0,y = 0},
			pos = {x =300,y = 300},
			scale = 2,
		},
		{
			_type = "cc_ClickComponent",
		},
		{
			_type = "ex_CCbComponent",ccbName = "ccbi_login_account",
		},
		{
			_type = "ex_panel"
		},
	},
}
return M