local M = {
	CacheName = {
		"CmdPlayer",
		"CmdItem",
		"CmdHero",
	},
	CmdCommon = {
		id = 1,
		super = ""
	},
	CmdPlayer = {
		level = 0,
		name = "",
		super = "CmdCommon",
	},
	CmdItem = {
		super = "CmdCommon",

		isRepeated = true,
	},
	CmdHero = {
		skill = {
			isRepeated = true,
			super = "CmdSkill",
		},
		super = "Common",
		isRepeated = true,
	},
	CmdSkill = {
		super = "Common",
		desc = "test",
	},
}
return M