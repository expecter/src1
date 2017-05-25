local ModelName = ...

local M = {}
-- local function getHashKeyAndHashValue(tmKey)
--     local tlKey = {}
--     local tlValue = {}
--     for k,v in pairs(tmKey) do
--         tlKey[#tlKey+1] = k
--     end

--     table.sort(tlKey)

--     for _, key in pairs(tlKey) do
--         tlValue[#tlValue+1] = tmKey[key]
--     end

--     return table.concat(tlKey,"."), table.concat(tlValue,"."), tlKey
-- end

-- local function getHashValue(tlKey, refX)
--     local tlValue = {}
--     for _, key in pairs(tlKey) do
--         tlValue[#tlValue+1] = tostring(refX[key])
--     end
--     return table.concat(tlValue,".")
-- end
-- function M.extend(object, modelFullname)
--     --没有被class扩展过
--     assert(type(object) == "table" and object.__cname == nil)

--     local tlName = string.split(modelFullname, ".") or {}

--     --最后以为为空
--     tlName[#tlName] = nil
--     local tlName = table.map(tlName, function(v,k)
--         return v.."."
--     end)

--     --新的modelFullname
--     modelFullname = table.concat(tlName)
--     local metaTable = {}

--     function metaTable:__index(key)
--         local v = require(modelFullname..key)
--         --缓存
-- 	    local tmCache = {}
-- 	    local function getCache(tlKey, hashKey)
-- 	        local cache = tmCache[hashKey]
-- 	        if cache then
-- 	            return cache
-- 	        end

-- 	        local cache = {}
-- 	        tmCache[hashKey] = cache

-- 	        for _, refX in ipairs(v) do
-- 	            local hashValue = getHashValue(tlKey, refX)
-- 	            local cacheline = cache[hashValue]
-- 	            if not cacheline then
-- 	                cacheline = {}
-- 	                cache[hashValue] = cacheline
-- 	            end
-- 	            cacheline[#cacheline+1] = refX
-- 	        end
-- 	        return cache
-- 	    end
--         function v.getRef( tmKey )
--          	local cacheline = RefX.getTlRef(tmKey)
--         	return cacheline[1]
--         end
--         function v.getTlRef( tmKey )
--          	local hashKey, hashValue, tlKey = getHashKeyAndHashValue(tmKey)
-- 	        local cache = getCache(tlKey, hashKey)
-- 	        local cacheline = cache[hashValue]
-- 	        return cacheline or {}
--         end        
--         self[key] = v

--         return v
--     end

--     setmetatable(object, metaTable)    
-- end

-- M.extend(M, ModelName)
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
