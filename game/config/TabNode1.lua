--
-- Author: Your Name
-- Date: 2016-10-04 23:58:53
--
local M = {
	name = "tabNode1",
	_super = "GameNode",
	_component = {
		{
			_type = "ui_node",
			contentsize = {width = 1136,height = 440},
			AnchPos = {x = 0,y = 0},
			pos = {x =0,y = 0},
		},
		{
			_type = "ct_ScrollViewComponent",
			viewNode = {
				_super = "GameNode",
				_component = {
					{
						_type = "cc_node",
					},
					{
						_type = "ex_CCbComponent",
						ccbName = "ccbi_capital",
						tlOwner = {
							{								
								_view = {
									_type = "ui_node",
									_ccNode = "",
									x,
									y,
									_TlNode = {

									},
									_func = {

									},
								},
								_component = {
									{
										_type = "ui_ClickComponent",
										clickedEvent = {

										},
									},
								},
							},
						},
						events = {
							{
								_name = "",

							},
						},
					},
				},			
			},
			viewsize = {width = 1136,height = 440},	
		},
		{
			_type = "demo_AutoScrollComponent",
			
		},
	},
	_children = {

	},
}
return M