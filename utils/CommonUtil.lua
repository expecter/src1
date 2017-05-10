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
	if params._data == "obj" then
		return M.getObjData(params)
	end
	dump(Language.y1)
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
--获取obj计算数据
function M.getObjData( params )
	if not params.path then	return nil end
	local Obj = require(params.path)	
	local data = Obj[params.funcName](params.params)
	assert(type(data)=='table')
	return data
end

return M
