--
-- Author: Your Name
-- Date: 2016-11-19 22:02:31
--
local M = {}

function M.getData( params )
	if params._type == "ref" then
		return M.getRefData(params)
	end
	if params._type == "cache" then
		return M.getCacheData(params)
	end
	return params
end
--配置数据类型
function M.getRefData( params )
	return ref.getRef(params)
end
--缓存数据类型
function M.getCacheData( params )
	return GameObj.ObjArmy.getCacheData()
end
--其他数据类型
function M.getOtherData( params )
	return {}
end

return M