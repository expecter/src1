--
-- Author: Your Name
-- Date: 2016-01-07 16:48:44
--
local M = {}
M.observers = {}
function M.init()
    for k,v in pairs(message_type) do
        M.observers[v] = {}
    end
end
function M.addObserver( target,callback,name )
    for k,v in pairs(M.observers) do
        if name == v.name and target == v.target then
            return
        end
    end
    M.observers[name][view] = callback

end
function M.postNotification( name,data )
    M.cleanUnUsedView(name)
	for target,callback in pairs(M.observers[name]) do
        callback(target,data)
	end
end
function M.cleanUnUsedView( name )
    for view,_ in pairs(M.observers[name]) do
            if type(view) == "userdata" and tolua.isnull(view) then
                M.observers[name][view] = nil
        end
        
    end
end

return M