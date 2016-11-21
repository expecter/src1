--
-- Author: Your Name
-- Date: 2016-11-18 11:16:17
--
local M = {
	CmdArmy = {
		tmField = {
			key = {
				type = 'int32',
				prefix = 'required',
				name = 'key'
			},
			name = {
				type = 'string',
				prefix = 'optional',
				name = 'name'
			},
			num = {
				type = 'int32',
				prefix = 'optional',
				name = 'num'
			},
			armytype = {
				type = 'int32',
				prefix = 'repeated',
				name = 'tlCmdNpcCitySimpleMail'
			},
		},	
		type = "message",
		name = "CmdArmy",
	},
	CmdArmy = {
		tmField = {
			key = {
				type = 'int32',
				prefix = 'required',
				name = 'key'
			},
			name = {
				type = 'string',
				prefix = 'optional',
				name = 'name'
			},
			num = {
				type = 'int32',
				prefix = 'optional',
				name = 'num'
			},
			armytype = {
				type = 'int32',
				prefix = 'repeated',
				name = 'tlCmdNpcCitySimpleMail'
			},
		},	
		type = "message",
		name = "CmdArmy",
	},
}

return M