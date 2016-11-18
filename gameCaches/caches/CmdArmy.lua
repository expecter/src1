--
-- Author: Your Name
-- Date: 2016-11-18 11:16:17
--
local M = {
	tmField = {
		key = {
			type = 'int32',
			prefix = 'required',
		},
		name = {
			type = 'string',
			prefix = 'optional',
		},
		num = {
			type = 'int32',
			prefix = 'optional',
		},
		armytype = {
			type = 'int32',
			prefix = 'repeated',
			name = 'tlCmdNpcCitySimpleMail'
		},
	},	
	type = "message",
	name = "CmdArmy",
}

return M