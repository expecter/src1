--
-- Author: Your Name
-- Date: 2016-01-07 16:48:44
--
local M = {}
M.observers = {}
function M.getobserverss(  )
	return M.observers
end

function M.addObserver( target,selector,name )
    for k,v in pairs(M.observers) do
        if name == v.name and target == v.target then
            return
        end
    end
    M.observers[#M.observers+1] = {target = target,selector = selector,name = name}
end
function M.postNotification( name,params )
	for k,v in pairs(M.observers) do
		if v.name == name then
			v.selector(v.target,params)
			return
		end
	end
end
function M.removeObserverByTarget( target )
    for k,v in pairs(M.observers) do
        if target == v.target then
            M.observers[k] = nil
        end
    end
end
function M.removeObserver( target,selector )
    for k,v in pairs(M.observers) do
        if target == v.target and selector == v.selector then
            M.observers[k] = nil
            return
        end
    end
end
function M.removeAllObserver(  )
	M.observers = {}
end

return M