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
cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()
local tlGameNode = {}
function M.new(params)
	local _t = params.data
	local _name = params.name
	local mt = {
		__index = function (t,k)
			print(k,_t[k])
			return _t[k]
		end,
		__newindex = function ( t,k,v )
			-- print(k .. "字段是不存在的，不要试图给它赋值！");
			print("update of element",v)

			if not _t[k] then
				print("不允许添加新值")
				return
			end
			local old = _t[k]			
			_t[k] = v
			GameMessage:dispatchEvent{
                name = GameMessage.MessageName.updateData,
                data = {old = old,new = _t[k]},
            }
            for i,node in ipairs(tlGameNode) do
            	node:updateView()
            end
		end
	}
    local self = setmetatable({}, mt)
    return self
end

function M:addGameNode( node )
	table.insert(tlGameNode,node)
end

return M