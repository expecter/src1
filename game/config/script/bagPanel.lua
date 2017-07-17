--
-- Author: Your Name
-- Date: 2017-07-17 22:53:50
--
local M = {}
function M.handlerIndex( target,index )
	local tlData = ref.item.getTlRef{type = index}
	target:setTlData(tlData)
	target:updateView()
end

return M