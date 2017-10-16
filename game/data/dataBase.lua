--
-- Author: Your Name
-- Date: 2017-10-06 20:21:11
--
-- local _t = {
-- 	id = 1,
-- 	index = 2, --记录操作次数，方便界面计算是否更新
-- }

local M = {}

-- setmetatable(M, mt)
-- cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()
function M.new(...)
	local _t = {}
	local mt = {
		__index = function (t,k)
			print(k,_t[k])
			return _t[k]
		end,
		__newindex = function ( t,k,v )
			-- print(k .. "字段是不存在的，不要试图给它赋值！");
			print("update of element",v)
			_t[k] = v
		end
	}
    local self = setmetatable({}, mt)
    return self
end
return M