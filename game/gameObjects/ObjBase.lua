local M = {}
M.className = "MsgPlayer"

function M.request( data )
	static_Listener:dispatchEvent{
        name = "CmdAppend",
        data = data,
        className = M.className,
    }
end

return M
