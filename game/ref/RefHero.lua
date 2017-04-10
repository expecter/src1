--
-- Author: Your Name
-- Date: 2017-04-07 17:37:27
--
local M = {}

function M.getHeroById( id )
	return ref.hero.getRef({id =id})
end

return M