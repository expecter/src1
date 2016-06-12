local M = {}

function M.appendCmdX( cmdX )
	if cmdX then
        if cmdX.class and cmdX.class~="" then
            local superCmdX = CmdCommon[cmdX.class]
            for k,v in pairs(superCmdX) do
                if not cmdX[k] then
                    cmdX[k] = v
                end
            end
            cmdX.class = superCmdX.class
            if cmdX.class~="" then
                cmdX =M.appendCmdX(cmdX)
            end
        end   
        if cmdX.children then
            local cmd = {}
            local childCmdX = CmdCommon[cmdX.children]
            table.insert(cmd,clone(childCmdX))
            cmdX = cmd            
        end
        if type(cmdX)=="table" then
            for k,v in pairs(cmdX) do
                if v.children or v.class then
                    cmdX[k] = M.appendCmdX(v)
                end                
            end
        end
                
    end
    return cmdX
end

return M