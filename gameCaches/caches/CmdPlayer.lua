--
-- Author: Your Name
-- Date: 2016-11-18 11:16:17
--
local M = {
	CmdPlayer = {
		tmField = {
			playerId = {
				type = 'int32',
				prefix = 'required',
				name = 'playerId'
			},
			name = {
				type = 'string',
				prefix = 'optional',
				name = 'name'
			},
			level = {
				type = 'int32',
				prefix = 'optional',
				name = 'level'
			},
			health = {
				type = 'int32',
				prefix = 'optional',
				name = 'health'
			},
		},	
		type = "message",
		name = "CmdPlayer",
	},
}

return M