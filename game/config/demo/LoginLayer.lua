--
-- Author: Your Name
-- Date: 2017-05-03 11:43:47
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
			_type = "cc_spriteFrame",tlFrame = {"login/plist_ui_plist_login","capital/plist_ui_plist_capital","camp/plist_ui_plist_camp"}
		},
	},
	_children = {
			-- {
			-- 	_super = "GameNode",
			-- 	_view = {
			-- 		_type = "sprite",
			-- 		spriteName = "img_picture_login_bg"
			-- 	},
			-- },
			-- {
			-- 	_super = "GameNode",
			-- 	_view = {
			-- 		_type = "ccreader",
			-- 		ccbName = "ccbi_capital",
			-- 		tlCallback = {
			-- 			-- onBtnAccountClicked = {_type = "Message",name = "replaceLayer",params = {name = "HeroLayer"}}
			-- 		},
					
			-- 	},
			-- 	_component = {
			-- 			{
			-- 				_type = "ex_ccReader",
			-- 				-- tlNode = {
			-- 				-- 	ccLabelServer = {
			-- 				-- 		_super = "GameNode",
			-- 				-- 		_component = 
			-- 				-- 			{
			-- 				-- 				{_type = "ex_label",text = "服务器"}
			-- 				-- 			},
			-- 				-- 	},
			-- 				-- },
			-- 			},
			-- 	}
				
			-- },
		-- {
		-- 	_super = "GameNode",
		-- 	_component = {
		-- 		{
		-- 			_type = "ui_node",
		-- 			contentsize = {width = 1136,height = 640},
		-- 			AnchPos = {x = 0,y = 0},
		-- 			pos = {x =0,y = 0},
		-- 		},
		-- 		{
		-- 			_type = "ui_ScrollViewComponent",
		-- 			viewNode = {
		-- 				_super = "GameNode",
		-- 				_component = {
		-- 					{
		-- 						_type = "ui_node",
		-- 					},
		-- 					{
		-- 						_type = "ui_CCbComponent",
		-- 						ccbName = "ccbi_capital",
		-- 					},
		-- 				},			
		-- 			},
		-- 			viewsize = {width = 1136,height = 640},	
		-- 		},
		-- 	}
		-- },
		-- {
		-- 	_super = "btn",
		-- 	_component = {
		-- 		{_name = "",_type = "ui_node",
		-- 		contentsize = {width = 154,height = 56},
		-- 		AnchPos = {x = 0,y = 0},
		-- 		pos = {x = 300,y = 100},
		-- 		},
		-- 		{
		-- 			_type = "cc_ClickComponent",
		-- 			clickedEvent = 
		-- 			{
		-- 				{_type = "Message",name = "request",params = {cacheName = "CacheItem",funcName = "newItem",params = {}}}
		-- 			},
		-- 		},
		-- 	},
		-- },
		-- {
		-- 	_super = "btn",
		-- 	_component = {
		-- 		{_name = "",_type = "ui_node",
		-- 		contentsize = {width = 154,height = 56},
		-- 		AnchPos = {x = 0,y = 0},
		-- 		pos = {x = 500,y = 100},
		-- 		},
		-- 		{
		-- 			_type = "cc_ClickComponent",
		-- 			clickedEvent = 
		-- 			{
		-- 				{_type = "Message",name = "replaceLayer",params = {name = "choukaLayer"}}
		-- 			},
		-- 		},
		-- 	},
		-- },
		-- {
		-- 	_super = "btn",
		-- 	_component = {
		-- 		{
		-- 			_type = "cc_ClickComponent",
		-- 			clickedEvent = 
		-- 			{
		-- 				{_type = "Message",name = "showPanel",params = {name = "bagPanel"}}
		-- 			},
		-- 		},
		-- 	},
		-- },
		-- {
		-- 	_super = "GameNode",
		-- 	_component = {
		-- 		{_name = "",_type = "ui_node",
		-- 		contentsize = {width = 254,height = 56},
		-- 		AnchPos = {x = 0,y = 0},
		-- 		pos = {x = 300,y = 100},
		-- 		},
		-- 		{
		-- 			_type = "cache_bind",
		-- 			tlCacheName = 
		-- 			{
		-- 				"CacheItem"
		-- 			},
		-- 		},
		-- 		{
		-- 			_type = "dispatch_listener",
		-- 			tlEventName = 
		-- 			{
		-- 				"event_bag_use"
		-- 			},
		-- 		},
		-- 		{
		-- 			_type = "ui_label",
		-- 			object = {
		-- 				_data = "cache",
		-- 				cacheName = "CacheItem",
		-- 				key = {id = 2},
		-- 				field = "num",
		-- 			},
		-- 		},
		-- 		-- {
		-- 		-- 	_type = "cc_sprite",
		-- 		-- 	spriteName = "s_1",
		-- 		-- 	object = {
		-- 		-- 		_data = "cache",
		-- 		-- 		cacheName = "CacheItem",
		-- 		-- 		key = {id = 2},
		-- 		-- 		field = "num",
		-- 		-- 	},
		-- 		-- },
		-- 	},
		-- },
	},

}
return M