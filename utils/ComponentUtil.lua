--
-- Author: Your Name
-- Date: 2016-11-19 22:02:31
--
local M = {}
--根据类型获取配置，缓存以及其他数据
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
--根据文件路径获取类
function M.getClassByPath( params )
	if not params.path then	return nil end
	local class = require(params.path)
	local newData = params.newData or {}
	return M.updateClass(class,newData)
end

function M.updateClass( oldClass,newData )
	--TODO
	--对数据进行更新替换
	return oldClass
end

return M