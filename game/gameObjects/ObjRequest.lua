--
-- Author: yj
-- Date: 2016-05-26 00:48:18
--网络和本地请求基类
local M = {}
function M.request( data )
	static_Listener:dispatchEvent{
        name = "CmdAppend",
        data = data,
    }
end

return M