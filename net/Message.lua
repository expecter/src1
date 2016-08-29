-----------------------------------------------------------------------------------------------  
-- @description Message相关类
-- @author  ny
-- @coryright  蜂鸟工作室
-- @release  2014/9/8
--------------------------------------------------------------------------------------------

local tmProto = import(".proto.protos")

local M = {}

--消息名字 和 消息Id的映射
--
local tmMessageId_MessageName = {}

--消息Id 和 消息名字的映射
local tmMessageName_MessageId = {}

--初始化协议
for name, proto in pairs(tmProto) do

    if string.sub(name, 1,7) == "Message" and proto.type == "enum" then
        
        for messageName, messageId in pairs(proto.enums) do
            tmMessageId_MessageName[messageName] = messageId
            tmMessageName_MessageId[messageId] = messageName
        end
    end

end


function M.getMessageName(messageId)
    return tmMessageName_MessageId[messageId]
end

function M.getMessageId(messageName)
    return tmMessageId_MessageName[messageName]
end

function M.getReqMessageName(messageId)
    return tmMessageName_MessageId[messageId].."ReqMsg"
end

function M.getRspMessageName(messageId)
    return tmMessageName_MessageId[messageId].."RspMsg"
end




return M



