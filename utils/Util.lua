--------------------------------------------------------------------------------
-- 元表操作工具类
-- @author 何泽平
-- @copyright 蜂鸟工作室
-- @release LoginObject.lua, v1.1 2013/10/8 
--------------------------------------------------------------------------------

local Util = {}
local ccuserdefault=cc.UserDefault:getInstance()
-- 合并两个表，返回合并后的表，srcTable中的域会被dstTable中的同名域覆盖
function Util.mergeTable(srcTable,dstTable)
	if not dstTable then 
		dstTable={}
	end
	local ret = clone(srcTable)
	for key,value in pairs(dstTable) do
		ret[key] = value
	end
	return ret
end

--创建只读表
function Util.getReadOnleyTab( tab )
	local proxy={}
	local mt ={
		__index = tab,
		__newindex=function ( t,k,v )
			error("试图修改只读table",2)
		end
	}
	setmetatable(proxy,mt)
	return proxy
end

--从父类中过滤指定字段
--filterFields 被过滤子都列表
function Util.filterTabFromParent( tab,filterFields ) 
	local t = getmetatable(tab)
	if nil ~= t then 
		local __oldIndex=t.__index 
		t.__index = function ( t,k )
			if type(filterFields)=="table" then 
				for i =1,#filterFields do 
				 	if k==filterFields[i] then
				 		--printInfo("过滤字段：%s",k)
				 		return nil
				 	end
				end 
			end
			if type(__oldIndex)=="table" then 
				return __oldIndex[k]
			elseif type(__oldIndex)=="function" then
				return __oldIndex(t,k)
			else 
				return nil 
			end
		end
		setmetatable(tab, t)
	end
	return tab   
end


--二进制转十六进制
function Util.binaryToHex(answer)
    local log=""
    for i=1,#answer do 
        log=log..string.format("%02X",string.byte(answer,i))
    end
    return log
end
--十六进制转二进制
function Util.hexToBinary(hexstr)
    local log=""
    for i = 1, string.len(hexstr) - 1, 2 do
        local doublebytestr = string.sub(hexstr, i, i+1);
        local n = tonumber(doublebytestr, 16);
        if 0 == n or nil == n then
            log=log..'\00'
        else
            log=log..string.format("%c", n)
        end
    end
    return log
end
--保存加密数据
function Util.savaLuaDataWithKey(key,luaData)
    local strjson = json.encode(luaData)
    if strjson ~= nil then
        local encry= crypto.encryptXXTEA(strjson,"a")
        strjson=Util.binaryToHex(encry)
        ccuserdefault:setStringForKey(key,strjson);
        ccuserdefault:flush()
        return true
    else
        return false
    end
end

--获取解密数据
function Util.getLuaDataByKey(key,default)
    local strbase64 = ccuserdefault:getStringForKey(key,default)
    local value=Util.hexToBinary(strbase64)
    strbase64=crypto.decryptXXTEA(value,"a")
    if strbase64 ~= default then 
        local luadata = json.decode(strbase64)
        if luadata then
            return luadata
        else
            return default
        end
    else
        return default
    end
end
--string转table   支持中文字符
function Util.stringToTable(str)
    local tb = {}
    local i = 1
    while i <= #str  do
        local c = str:sub(i,i)
        local ord = c:byte()
        if ord > 128 then
            table.insert(tb,str:sub(i,i+2))
            i = i+3
        else
            table.insert(tb,c)
            i=i+1
       end
    end
    return tb
end

-- 时间转换
-- @param key 
-- "hm"=时分 
-- "ms"=分秒 
-- "hms"=时分秒（默认）
function Util.timeConvert(value, key)
    local hour, min, sec
    hour = math.floor(value / 3600)
    if hour >= 1 then
        min = math.floor((value - hour * 3600) / 60)
    else
        min = math.floor(value / 60)
    end
    sec = math.floor(value % 60)
    
    hour = hour<10 and "0"..hour or hour 
    min = min<10 and "0"..min or min 
    sec = sec<10 and "0"..sec or sec

    if key == "hm" then
        return hour .. ":" .. min
    elseif key == "ms" then
        return min .. ":" .. sec
    end
    
    return hour .. ":" .. min .. ":" .. sec
end
function Util.timeConvertDate( value )
    local year = os.date("%Y",value)
    local month = os.date("%m",value)
    local day = os.date("%d",value)
    if not year or not month or not day then
        return "0/0/0"
    end
    return year.."/"..month.."/"..day
end
function Util.timeToString( value )
    local month = os.date("%m",value)
    local day = os.date("%d",value)
    local h = os.date("%H",value)
    local m = os.date("%M",value)
    return month.."月"..day.."日".."  "..h.."时"..m.."分"
end
function Util.timeConvertfullDate( value )
    return Util.timeConvertDate(value).." "..os.date("%X",value)
end
-- 时间转换
-- @param key 
-- "dhm"=天时分 
-- "dhms"=天时分秒（默认）
function Util.timeConvertReTime( value,key )
    local day,hour, min, sec =0,0,0,0    
    if value>(3600*24) then
        day = math.floor(value/(3600*24))
        value = value -day*3600*24
    end
    if value>3600 then
        hour = math.floor(value / 3600)
        value = value -hour*3600
    end
    if value>60 then
        min = math.floor(value / 60)
        value = value -min*60
    end
    sec = math.floor(value % 60)
    if key == "dhm" then
        return day.."天"..hour .. "时" .. min .. "分"
    end
    return day.."天"..hour .. "时" .. min .. "分" .. sec.."秒"
end

function Util.getAngleTwoPoint(starp,endp)
    local vector=cc.p(starp.x-endp.x,starp.y-endp.y)
    local radians = math.atan2(vector.y,vector.x)
    local rotate=-1 * radians*57.29577951
    return rotate-180
end

function Util.getIntRounded(value)
    local intValue, floatValue = math.modf(value)
    if floatValue >= 0.5 then
        intValue = intValue + 1
    end
    return intValue
end
--根据两点获取向量角度
function Util.getAngleTwoPoint(starp,endp)
    local vector=cc.p(starp.x-endp.x,starp.y-endp.y)
    local radians = math.atan2(vector.y,vector.x)
    local rotate=-1 * radians*57.29577951
    return rotate-180
end

--根据两点按照一定长度分割为多个点
function Util.getPointsByToPointAndLength(stp,etp,length)
    local points = {}
    local pl = length
    local l = cc.pGetDistance(stp,etp)
    local pc = math.floor(l/pl)
    for i=1,pc do
        local point=cc.p(((pc-i)*stp.x+i*etp.x)/pc,
                         ((pc-i)*stp.y+i*etp.y)/pc)
        points[#points+1]=point
    end
    return points
end
-- r1为矩形左下角 ，r3为矩形右上角   直线是否与矩形相交
function Util.isLineIntersectRect(start_p,end_p, r1, r3)
    local r2=cc.p(r1.x,r3.y)
    local r4=cc.p(r3.x,r1.y)
    local a = start_p.y - end_p.y
    local b = end_p.x -start_p.x
    local c = start_p.x* end_p.y - end_p.x* start_p.y

    local left = r2.x
    local top = r2.y
    local right = r4.x
    local bottom = r4.y

    -- 思路:先看线段所在直线是否与矩形相交，如果不相交则必为 “Ｆ”，
    -- 如果相交，则看线段的两个点是否在矩形的同一边（即两点的 x（y)  坐标都比矩形的小 x(y) 坐标小，或者大）,
    -- 若在同一边则为“Ｆ”，否则就是相交的情况。
    if ((a* left + b*top + c>=0 and a* right + b* bottom +c<=0) or
        (a* left + b*top + c<=0 and a* right + b* bottom +c>=0) or
        (a* left + b*bottom +c>=0 and a* right + b* top  +c<=0) or
        (a* left + b*bottom +c>=0 and a* right + b* top  +c<=0) )then
        if (left > right) then
            local l=left
            left=right
            right=l
            -- swap(left,right)
        end
        if (top < bottom) then
            local b=bottom
            bottom=top
            top=b
            -- swap(top, bottom)
        end
        if ((start_p.x < left and end_p.x < left) or
            (start_p.x > right and end_p.x < left) or
            (start_p.y > top and end_p.y > top) or
            (start_p.y < bottom and end_p.y < bottom)) then
            return false
        else
            return true
        end
    else
        return false
    end
end
-- 两点确定一向量，求从end_p开始长度为l的坐标点 d为- + 方向
function Util.extensionLineOnAStraightLinePoint(start_p,end_p,l,d)
    local x1,y1=start_p.x,start_p.y
    local x2,y2=end_p.x,end_p.y
    if d=="-" then
        return cc.p(x2+((x1-x2)/math.sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)))*l,
               y2+((y1-y2)/math.sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)))*l)
    else
        return cc.p(x2-((x1-x2)/math.sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)))*l,
               y2-((y1-y2)/math.sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)))*l)
    end
end
--十进制转十六进制字符串
--string.sub(string.format("%#x",str),3,-1)
--ccColor转十六进制
function Util.ccColorToHex( color )
    local function tenToHex( num )
        return string.sub(string.format("%#x",num),3,-1)
    end
    return tenToHex(color.r)..tenToHex(color.g)..tenToHex(color.b)
end
return Util
