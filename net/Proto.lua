-----------------------------------------------------------------------------------------------  
-- @description Proto 
-- @author  ny
-- @coryright  蜂鸟工作室
-- @release  2014/9/8
--------------------------------------------------------------------------------------------

import(".proto.protobuf")
local parser = import(".proto.parser")
local tmProto = import(".proto.protos")

local M = {}

--注册proto
for _, name in ipairs(tmProto.__loadlist__) do
     local buffer = cc.HelperFunc:getFileData("proto/"..name) 
     protobuf.register_buffer(buffer)
end

--注册每个字段的类型
for _, proto in pairs(tmProto) do
    if proto.type == "message" then
        for _, field in pairs(proto.tmField) do
            local proto = tmProto[field.type]
            if proto and proto.type == "message" then
                field.ismessage = true
            end
            if proto and proto.type == "enum" then
                field.isenum = true
            end
        end
    end
end

local M = {}

--编码
function M.encode(protoName, data)
    local proto = M.getProto(protoName)
    return protobuf.encode(proto.fullName, data)
end

--解码
function M.decode(protoName, data)
    local proto = M.getProto(protoName)
    return protobuf.decode(proto, data)
end

--获取Proto的信息
function M.getProto(protoName)
    return tmProto[protoName]
end

--获取enumId
function M.getEnumId(protoName, enum)
    local proto = M.getProto(protoName)
    return proto.enums[enum]
end

--获取enum
function M.getEnum(protoName, enumId)
    local proto = M.getProto(protoName)
    for _enum,_enumId in pairs(proto.enums) do
        if _enumId == enumId then
            return _enum
        end
    end 
    return nil
end

--注册新的协议
function M.regist(doc)
    local t = parser.parser(doc, "cmdData.proto")
    local pbencode = protobuf.encode("google.protobuf.FileDescriptorSet" , { 
        file = {
            t
        } 
    })
    protobuf.register(pbencode)

    --enum
    for _, enum in pairs(t.enum_type) do 
        local enums = {}
        for _, value in pairs(enum.value) do
            enums[value.name] = value.number
        end
        tmProto[enum.name] = {
            fullName = t.package.."."..enum.name,
            type = "enum",
            name = enum.name,
            enums = enums,
        }
    end

    --message
    for _, message in pairs(t.message_type) do 
        local tmField = {}
        for _, value in pairs(message.field) do
            local field = {}
            tmField[value.name] = field
            field.name = value.name
            field.type = value.type --需要优化
            field.prefix = value.label --需要优化
        end
        tmProto[message.name] = {
            fullName = t.package.."."..message.name,
            type = "message",
            name = message.name,
            tmField = tmField,
        }
    end
end

-- 把cmdX_new的数据更新到 cmdX_old上
function M.updateProto(protoName, cmdX_old, cmdX_new, isloop)
    
    local proto = M.getProto(protoName)

    local tmFieldChange = {}
    if isloop then
        for _, field in pairs(proto.tmField) do
            -- if field.prefix == "repeated" then
            --     cmdX_old[field.name] = cmdX_new[field.name]
            --     tmFieldChange[field.name] = true
            -- else

                local fieldname = field.name
                local old = cmdX_old[fieldname]
                local new = cmdX_new[fieldname]             
                if field.ismessage then
                    if new == nil or old == nil then
                        cmdX_old[fieldname] = new
                        if new ~= old then
                            tmFieldChange[fieldname] = true
                        end
                    else
                        tmFieldChange[fieldname] = M.updateProto( field.type, old, new, true )
                    end
                else
                    cmdX_old[field.name] = new
                end
            end
            
        -- end
    else
        for _, field in pairs(proto.tmField) do
            local fieldname = field.name
            local old = cmdX_old[fieldname]
            local new = cmdX_new[fieldname]
            cmdX_old[fieldname] = new
            if old ~= new then
                tmFieldChange[fieldname] = true
            end
        end
    end

    if next(tmFieldChange) then
        return tmFieldChange
    end
end

--数据格式简单检查
function M.easycheck(protoName, data)
	--检查每个字段
	local proto = M.getProto(protoName)
	local tmField = proto.tmField
	for fieldName, field in pairs(tmField) do
		if field.prefix ~= "optional" then
			if data[fieldName] == nil then
				return false
			end
		end
	end
	return true
end

--数据格式快照
function M.easyprint(protoName, data, text)
	--打印每个字段
	print("******")
    if text then
        print(tostring(text))
    end
	print("protoName:", protoName)
	local proto = M.getProto(protoName)
	local tmField = proto.tmField
	for fieldName, field in pairs(tmField) do
		local value = data[fieldName]
		print( 
			string.format("    %s = %s", fieldName, tostring(value) ) 
		)
	end
	print("******")
end


--生成一个完整的table
function M.build(protoName, data)
    
    local proto = M.getProto(protoName)
    local tmField = proto.tmField
    local copy = {}

    for fieldName, field in pairs(tmField) do

        local value = data[fieldName]

        --如果是message 展开之
        if value then
            if field.prefix == "repeated" then
                local temp = {}
                if field.ismessage == true then
                    for index, item in ipairs(value) do
                        temp[index] = M.build(field.type, item)
                    end
                else
                    for index, item in ipairs(value) do
                        temp[index] = item
                    end
                end
                value = temp
            else
                if field.ismessage == true then
                    value = M.build(field.type, value)
                end
            end
        end

        copy[fieldName] = value
    end
    return copy
end










return M



