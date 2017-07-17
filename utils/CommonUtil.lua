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
	if params._type == "obj" then
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
	return {}
end
--获取obj计算数据
function M.getObjData( params )
	-- if not params.path then	return nil end
	local Obj = GameObj[params.ObjName]	
	local data = Obj[params.funcName](params.params)
	-- dump(data)
	assert(type(data)=='table')
	return data
end
--缓存binding
function M.bind( component,cacheName )
    GameObj[cacheName].bind(component,{
        onAdd = function ( cmdX )
            if component.onAdd then
                component:onAdd(cmdX)
            end                 
        end,
        onUpdate = function ( cmdX )
            if component.onUpdate then
                component:onUpdate(cmdX)
            end                 
        end,
        onDelete = function ( cmdX )                    
        if component.onDelete then
                component:onDelete(cmdX)
            end
        end
    })
end

return M
