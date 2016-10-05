--
-- Author: Your Name
-- Date: 2016-10-04 23:58:53
--
local M = {
	name = "tabNode1",
	_type = "GameNode",
	_component = {
		{
			_type = "cc_node",
			contentsize = {width = 1136,height = 640},
			AnchPos = {x = 0,y = 0},
			pos = {x =0,y = 0},
		},
		{
			_type = "ScrollViewComponent",
			viewNode = {
				_type = "GameNode",
				_component = {
					{
						_type = "cc_node",
					},
					{
						_type = "CCbComponent",
						ccbName = "ccbi_capital",
					},
				},			
			},
			viewsize = {width = 1136,height = 640},	
		},
		{
			_type = "AutoScrollComponent",
			
		},
	},
	_children = {

	},
}
return M