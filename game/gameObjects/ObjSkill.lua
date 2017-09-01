--
-- Author: Your Name
-- Date: 2017-05-09 14:38:59
--
local M = {}
--获取是否有效技能（某些技能需要特点的世界，地点，时间才能使用）
function M.isActive( cmdX,skillId )
	return true
end

function M.isCanUsed( cmdX )     
	if conditions then --todo end return
		M.isActive(cmdX) 
	end    
	local refSkill = ref.RefSkill{id = cmdX.id}
	local cd =refSkill.cd     
	if cd>cmdX.cd then         
		return false 
	end
end
--获取某个范围内的单位
function M.getInRangeUnit( ... )
	return {}
end
--获取某个技能是否处于cd中
function M.getSkillInCd( skillId )
	return 0
end

function M.get( ... )
	-- body
end
return M