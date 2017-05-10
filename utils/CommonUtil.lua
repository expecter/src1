--
-- Author: Your Name
-- Date: 2017-02-22 12:08:28
--计算相关方法
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
function M.getObjData( params )
	return GameObj.ObjArmy.getCacheData()
end

return M
