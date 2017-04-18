--
-- Author: Your Name
-- Date: 2017-04-14 15:58:52
--{name = "xxx",params = params}
--获取某个静态判断方法
local M = {}

function M.HeroLayer( params )
	return false
end

function M.PlayerLayer( params )
	return false
end

function M.testLayer( params )
	return false
end
--yu与,huo或,为关键字(暂不支持not非)
function M.getResult( tlCondition )
	local result = nil
	tlFunc = {}
	local operator = nil
	for i,v in ipairs(tlCondition) do
		if result == nil then
			result = M[v.name](v.params)
		else
			if v.name == "yu" or v.name == "huo" then
				operator = v.name
			else
				if operator then
					if operator == "yu" then
						result = result and M[v.name](v.params)
					elseif operator == "huo" then
						result = result or M[v.name](v.params)
					end
					operator = nil
				end
			end
		end		
	end

end
return M