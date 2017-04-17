--
-- Author: Your Name
-- Date: 2016-10-05 15:02:44
--
local M = {
	_type = "GameNode",
	_name = "Joytick",
	_component = {
		{
			_type = "cc_node",
			contentsize = {width = 120,height = 120},
			pos = {x =120,y = 120},
			AnchPos = {x = 0,y = 0},
		},
		{
			_type = "cc_sprite",
			spriteFrameName = "Direction_bc",
			isEnough = true,
		},
		{
			_type = "ClickComponent",
			func = {action = "replace",name = "login",params = {}},
			func1 = {action = "push",name = "panel",params = {}},
			func2 = {action = "",name = "",},
		},
		{
			_type = "ScheduleComponent",
		},
		{
			_type = "JoytickComponent"
		},
	},
}

return M