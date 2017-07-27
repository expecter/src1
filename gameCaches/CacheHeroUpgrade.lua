--
-- Author: Your Name
-- Date: 2017-07-27 21:04:28
--升级槽相关数据
local M = class(...,require("gameCaches.GameCache"))

local dataModel = {
	id = 1,
	heroId = 0,
	upgradeTime = 1,--添加进升级槽的时间点
}
local tlKey = {"heroId"}
function M:ctor(  )
	local params = {
		cacheName = "CmdUpgrade",
		isRepeat = true,
		dataModel = dataModel,
		tlKey = tlKey,
	}
	M.super.ctor(self,params)
	
end
--每次升级后，计算使用的经验更新升级时间
function M:updateUpgradeTime( params )
	
end

return M