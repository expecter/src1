--
-- Author: Your Name
-- Date: 2017-09-15 20:40:00
--
local M = {}

local M_Tag = {
	"attr",
}

local M_TlView = {
	{tag = "attr"},
	{}
}
function M.switchToTag( tag )
	if type(tag) == "number" then
		tag = M_Tag[tag]
	end
	for i,v in ipairs(M_TlView) do
		if v[tag] then
			-- TODO
		end
	end
end

return M