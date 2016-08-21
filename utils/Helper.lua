local M = {}

local function getHashKeyAndHashValue(tmKey)
    local tlKey = {}
    local tlValue = {}
    for k,v in pairs(tmKey) do
        tlKey[#tlKey+1] = k
    end

    table.sort(tlKey)

    for _, key in pairs(tlKey) do
        tlValue[#tlValue+1] = tmKey[key]
    end

    return table.concat(tlKey,"."), table.concat(tlValue,"."), tlKey
end

local function getHashValue(tlKey, refX)
    local tlValue = {}
    for _, key in pairs(tlKey) do
        tlValue[#tlValue+1] = tostring(refX[key])
    end
    return table.concat(tlValue,".")
end

--扩展一个RefX
function M.extend(RefX, tlRefX, __index, fWalk)

    --没有被class扩展过
    assert(type(RefX) == "table" and RefX.__cname == nil)

    fWalk = fWalk or function() end

    --设置一遍
    for _, refX in ipairs(tlRefX) do
        fWalk(refX)
        setmetatable(refX,{
            __index = __index
        })
    end

    --缓存
    local tmCache = {}
    local function getCache(tlKey, hashKey)
        local cache = tmCache[hashKey]
        if cache then
            return cache
        end

        local cache = {}
        tmCache[hashKey] = cache

        for _, refX in ipairs(tlRefX) do
            local hashValue = getHashValue(tlKey, refX)
            local cacheline = cache[hashValue]
            if not cacheline then
                cacheline = {}
                cache[hashValue] = cacheline
            end
            cacheline[#cacheline+1] = refX
        end
        return cache
    end


    --随机获取一个
    function RefX.getRef(tmKey)
        local cacheline = RefX.getTlRef(tmKey)
        return cacheline[1]
    end

    --获取列表
    function RefX.getTlRef(tmKey)

        local hashKey, hashValue, tlKey = getHashKeyAndHashValue(tmKey)
        local cache = getCache(tlKey, hashKey)
        local cacheline = cache[hashValue]
        return cacheline or {}
    end
end
function M.extendCache( gameCache )
	
end
return M
