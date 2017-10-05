--
-- Author: Your Name
-- Date: 2016-11-19 22:02:31
--
local M = {}
--根据类型获取配置，缓存以及其他数据
function M.getData( params )
	if params._data == "ref" then
		return M.getRefData(params)
	end
	if params._data == "cache" then
		return M.getCacheData(params)
	end
	if params._data == "obj" then
		return M.getObjData(params)
	end
	dump(Language.y1)
	return nil
end
--配置数据类型
function M.getRefData( params )
	return ref.getRef(params)
end
--缓存数据类型
function M.getCacheData( params )
	local cache = GameCacheMgr.getGameCacheByName(params.cacheName):get(params.key)
	if cache then
		return cache[params.field]
	end
	return nil
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
--获取obj判断条件
function M.getObjCondition( params )
	if not params.path then	return nil end
	local Obj = require(params.path)
	local condition = Obj[params.funcName](params.params)
	assert(type(condition)=='boolean')
	return condition
end
--获取obj计算数据
function M.getObjData( params )
	if not params.path then	return nil end
	local Obj = require(params.path)	
	local data = Obj[params.funcName](params.params)
	assert(type(data)=='table')
	return data
end
function M.updateClass( oldClass,newData )
	--TODO
	--对数据进行更新替换
	return oldClass
end

return M