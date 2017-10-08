--
-- Author: Your Name
-- Date: 2017-10-07 21:24:49
--
local M = {
	_super = "GameNode",
	_view = {
		_type = "node",
		contentsize = {width = 1136,height = 640},
		AnchPos = {x = 0,y = 0},
		pos = {x =0,y = 0},
	},
	_component = {
		{
			_type = "cc_spriteFrame",tlFrame = {"fuben/plist_ui_plist_fuben"}
		},
	},
	_children = {
		{
			_super = "GameNode",
			_view = {
				_type = "ccreader",
				ccbName = "ccbi_fuben_PanelFuben",
							
			},
			_component = {
				{
					_type = "ex_ccReader",
					tlNode = {
						ccLabelServer = {
							_super = "GameNode",
							_component = 
								{
									{_type = "ex_label",text = "服务器"}
								},
						},
					},
					tlCallback = {
						onBtnCloseClicked = {_type = "Message",name = "replaceLayer",params = {name = "loginLayer"}}
					},
				},
			}
		}
	},

}
return M