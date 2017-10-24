local M = class(...)
cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()
local MessageName = GameMessage.MessageName
function M:ctor(  )
	
end
--
function M.DefaultData(  )
	return {}
end

function M:hash(  )
	
end

function M:bind(  )
	
end

function M:bindOne(  )
	
end

function M:dispatchAddEvent(  )
	
end

function M:dispatchUpdateEvent(  )
	
end

function M:dispatchDeleteEvent(  )
	
end

return M
