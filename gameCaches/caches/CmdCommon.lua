local M = {
	CacheName = {
		"CmdPlayer",
		"CmdItems",
		"CmdHeros",
	},
	CmdCommon = {
		id = {
			type = 'int32',
			default = 1,
		},
		class = "",
		type = "message",
	},
	CmdPlayer = {
		level = {
			type = 'int32',
			default = 1,
		},
		name = {
			type = 'string',
			default = "",
		},
		class = "CmdCommon",
	},
	CmdItems = {
		--children = "CmdItem",		
	},
	CmdItem = {
		class = "CmdCommon",
	},
	CmdHeros = {
		--children = "CmdHero",
	},
	CmdHero = {
		skill = {
			children ="CmdSkill"
		},
		class = "CmdCommon",
	},
	CmdSkill = {
		class = "CmdCommon",
		desc = "test",
	},
}
return M