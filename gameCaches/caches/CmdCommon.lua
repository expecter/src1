local M = {
	CacheName = {
		"CmdPlayer",
		"CmdItem",
		"CmdHero",
	},
	CmdCommon = {
		id = {
			type = 'int32',
			default = 1,
		},
		class = "",
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
		key = "id",
		class = "CmdCommon",
	},
	CmdItem = {
		class = "CmdCommon",
		isRepeated = true,
	},
	CmdHero = {
		skill = {
			isRepeated = true,
			class = "CmdSkill",
		},
		class = "CmdCommon",
		isRepeated = true,
	},
	CmdSkill = {
		class = "CmdCommon",
		desc = "test",
	},
}
return M