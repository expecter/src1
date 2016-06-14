local M = {}
M.className = "MsgPlayer"

function M.request( className,data )
	static_Listener:dispatchEvent{
        name = "CmdAppend",
        data = data,
        className = className,
    }
end

return M
