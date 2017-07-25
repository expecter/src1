--
-- Author: Your Name
-- Date: 2017-05-09 14:38:59
--
local M = {}
--获取是否有效技能（某些技能需要特点的世界，地点，时间才能使用）
function M.isActive( cmdX,skillId )
	return true
end

return M