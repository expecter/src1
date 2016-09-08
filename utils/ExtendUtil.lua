--
-- Author: Your Name
-- Date: 2016-08-29 23:28:23
--
local M = {}

function M.extend( object,tbComp )
	local metaTable = {}

    function metaTable:__index(key)
        self[key] = tbComp[key]
        -- return v
    end
	setmetatable(object, metaTable)
end

return M