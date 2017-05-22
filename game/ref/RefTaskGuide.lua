--
-- Author: Your Name
-- Date: 2017-05-22 23:48:51
--
local M = {}

function M.getLayer( ... )
	local taskguide = ref.taskguide.getRef{id = 1000}
	taskguide.layer
end

return M