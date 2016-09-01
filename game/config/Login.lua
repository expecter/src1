--
-- Author: Your Name
-- Date: 2016-05-24 00:38:30
--
local M = {
	name = "login",
	ctor = "GameNode",
	-- children = {
	-- 	sprite = {},
	-- 	label = {},		
	-- },
	clickevent = "onClick",
	component = {
		owner = {},
		DrawComponent = {},
	},
	cc = {
		contentsize = {width = 320,height = 280},
		AnchPos = {x = 0.5,y = 0.5},
		pos = {x =160,y = 320},
	},
}
return M