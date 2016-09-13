--
-- Author: Your Name
-- Date: 2016-05-24 00:38:30
--
local M = {
	name = "login",
	ctor = "GameNode",
	component = {
		owner = {},
		-- ClickComponent = {},
		DrawComponent = {},
		ViewSwitchComponent = {tlData = {
		}},
	},
	cc = {
		contentsize = {width = 300,height = 300},
		AnchPos = {x = 0,y = 0},
		pos = {x =0,y = 0},
	},
}
return M