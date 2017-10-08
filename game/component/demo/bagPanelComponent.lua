--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--没什么问题是一个脚本搞不定的，如果有就再加一个
local M = class(...,componentBase)
function M:ctor( params)
	M.super.ctor(self,params)
end
--对应onenter
function M:enterView(  )
	local layerIndex = GameSceneMgr.getIndexByUserData(target)
	local tlGameNode = GameSceneMgr.getGameNodeByIndex(layerIndex)
	local switchMenu = tlGameNode.switchMenu
	local switchNode = tlGameNode.switchNode   
	switchMenu:setViewCallback(function ( params,index )
		-- switchNode:handlerIndex(index)
		local tlData = ref.item.getTlRef{type = index}
		switchNode:setTlData(tlData)
		switchNode:updateView()
	end)
end
return M