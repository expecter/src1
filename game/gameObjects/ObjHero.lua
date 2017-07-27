--
-- Author: Your Name
-- Date: 2017-05-09 14:38:59
--
local M = {}
cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()
function M.getIsOpenXXX(  )
	
end
--拿获取途径
function M.getFromPath( heroId )
end
function M.getHeroById( id )
	return ref.item.getTlRef{}
end

function M.getTlHeroExp(  )
end
--获取当前的经验
function M.getExpByHeroId( heroId )
	local cmdX = CacheHero.get{id = heroId}
	local cmdUpgrade = CacheHeroUpgrade.get{id = heroId}
	local curTime = GameObj.ObjTime.getCurTime()
	return cmdX.exp+(curTime-cmdUpgrade.upgradeTime)/100
end
return M