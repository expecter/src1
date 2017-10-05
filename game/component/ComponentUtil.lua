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
	if params.key then
		local cache = GameCacheMgr.getGameCacheByName(params.cacheName):get(params.key)
		if cache then
			if params.field then
				return cache[params.field]
			else
				return cache
			end
			
		end
	else
		return GameCacheMgr.getGameCacheByName(params.cacheName):getAll()
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
--根据参数拼接调用方法
function M.getCallFunc( params )
	if type(params) == "function" then
        return params
    elseif type(params) == "table" then
    	if params._type == "Message" then
    		return function (  )
    			GameMessage:dispatchEvent{
                    name = params.name,
                    data = params.params,
                }
    		end
    	else
    		return function (  )
    			for k,v in pairs(params) do
	                if v.name then
	                    GameMessage:dispatchEvent{
	                        name = v.name,
	                        data = v.params,
	                    }
	                end
	            end
    		end
    	end
    end
    return nil
end

return M