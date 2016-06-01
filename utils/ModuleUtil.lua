-----------------------------------------------------------------------------------------------  
-- @description 构建模块 
-- @author  ny
-- @coryright  蜂鸟工作室
-- @release  2015/11/12
--------------------------------------------------------------------------------------------


local M = {}

function M.extend(object, modelFullname)
    --没有被class扩展过
    assert(type(object) == "table" and object.__cname == nil)

    local tlName = string.split(modelFullname, ".") or {}

    --最后以为为空
    tlName[#tlName] = nil
    local tlName = table.map(tlName, function(v,k)
        return v.."."
    end)

    --新的modelFullname
    modelFullname = table.concat(tlName)
    local metaTable = {}

    function metaTable:__index(key)
        local tlName = string.split(key, "_") or {}

        --最后以为为空
        local tlName = table.map(tlName, function(v,k)
            return v.."."
        end)
        local v = require(modelFullname..string.sub(table.concat(tlName),1,-2))
        self[key] = v
        return v
    end

    setmetatable(object, metaTable)
    
end


return M