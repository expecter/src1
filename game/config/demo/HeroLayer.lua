--
-- Author: Your Name
-- Date: 2017-10-07 21:24:49
--
local M = {
	_super = "GameLayer",
	_component = {
		{
			_type = "ui_node",
			contentsize = {width = 1136,height = 640},
			AnchPos = {x = 0,y = 0},
			pos = {x =0,y = 0},
		},
		{
			_type = "cc_spriteFrame",tlFrame = {"fuben/plist_ui_plist_fuben"}
		},
		{
			_type = "ui_ccbComponent",
			ccbName = "ccbi_fuben_PanelFuben",
			tlCallback = {
				onBtnCloseClicked = {_type = "Message",name = "replaceLayer",params = {name = "loginLayer"}}
			},
			-- tlNode = {
			-- 	ccLabelServer = {_super = "GameNode",_component = 
			-- 		{{_type = "ui_label",text = "服务器"}}
			-- 	},
			-- },
		},
	},

}
return M