--
-- Author: Your Name
-- Date: 2017-09-24 11:44:33
--object使用的单位，params控制伤害和作用范围的字段
--获取某个技能可造成的效果
--hurt伤害
--duration持续时间，interval间隔时间
local M = {}
--诅咒类，持续少血
function M.damnation( object,params )
	
end
--属性增加类
function M.addProperty( object,params )
	
end
--暴击类
function M.crt( object,params )
	
end
--召唤类
function M.summon( object,params )
	
end
--免疫类
function M.immune( object,params )
	
end

--ban技能
function M.banSkill( object,params )
	
end
--控制技（眩晕，冰冻）
function M.control( object,params )
	
end
--凋零（持续伤害技）
function M.withered( hurt,duration )
	-- body
end
return M