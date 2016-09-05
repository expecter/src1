--
-- Author: Your Name
-- Date: 2016-05-24 00:38:30
--
local M = {
	name = "login",
	ctor = "GameNode",
	component = {
		owner = {},
		ClickComponent = {},
		DrawComponent = {},
	},
	cc = {
		contentsize = {width = 320,height = 280},
		AnchPos = {x = 0.5,y = 0.5},
		pos = {x =460,y = 320},
	},
	children = {
		{
			ctor = "GameNode",
			component = {
				owner = {},
				-- clickevent = {ontouch = "onClick"},
				viewList = {},
			},
			cc = {
				contentsize = {width = 320,height = 280},
				AnchPos = {x = 0.5,y = 0.5},
				pos = {x =460,y = 320},
			}
		},
		-- {
		-- 	name = "child1",
		-- 	ctor = "GameNode",
		-- 	component = {
		-- 		owner = {},
		-- 		clickevent = {ontouch = "onClick"},
		-- 	},
		-- 	cc = {
		-- 		contentsize = {width = 320,height = 280},
		-- 		AnchPos = {x = 0.5,y = 0.5},
		-- 		pos = {x =160,y = 320},
		-- 	}
		-- },
		{
			ctor = "sprite",
			name = "sprite1",
			cc = {
				contentsize = {width = 120,height = 280},
				AnchPos = {x = 0.5,y = 0.5},
				pos = {x =230,y = 320},
			},
		},
		{
			ctor = "label",
			name = "label1",
			cc = {
				contentsize = {width = 120,height = 280},
				AnchPos = {x = 0.5,y = 0.5},
				pos = {x =260,y = 320},
			},
		},
	},
}
return M