--
-- Created by IntelliJ IDEA.
-- User: hezeping
-- Date: 14-5-16
-- Time: 下午2:43
-- To change this template use File | Settings | File Templates.
--
local GameState = require(cc.PACKAGE_NAME .. ".cc.utils.GameState")
local M = class(...)
local cashData=nil
function M:ctor()
    GameState.init(function(result)
        if result.name =="init" then
            local filename = result.filename
            local encode = result.encode
            printInfo("本机缓存文件路径:%s",filename)
        elseif result.name =="load" then
            if type(result.errorCode)~="nil" then
                --echoError("加载本地缓存失败,code=%s",tostring(result.errorCode))
                return nil
            else
                local values = result.values
                local encode = result.encode
                local ostime = result.time
                return self:onLoadedData(values,encode,ostime)
            end
        elseif result.name =="save" then
            local values = result.values
            local encode = result.encode
            return self:onSaveInfo(values,encode)
        end
    end, "ginfo")
end

function M:load()
    return GameState.load()
end

function M:save(newValues)
   if newValues and type(newValues.name)=="string" and type(newValues.data)=="table" then
       GameState.save(newValues)
   else
       error(string.format("%s 持久化数据格式不正确!",self.__cname),2)
   end
end

function M:onSaveInfo(values,encode)
    if cashData==nil then cashData = {} end
    cashData[values.name]=values.data
    return cashData
end

function M:onLoadedData(values,encode,ostime)
    cashData = values
    return cashData
end

function M:getDataByName(sName)
    if cashData == nil then
        local data = self:load()
        if type(data) == "table" then
            --dump(data)
            return data[sName]
        end
        return nil
    else
        return cashData[sName]
    end
end
return M

