--
-- Author: Your Name
-- Date: 2016-11-16 21:47:08
--
local M = {}
-- GameMgr:addEventListener("enterGame",function()
-- end)

-- GameMgr:addEventListener("exitGame",function()
-- end)
--数据筛选层
function M.getCacheData(  )
	return M.cache
end
--界面数据请求层

function M.newHero(  )	
	return CmdData.appendCmdX(clone(CmdCommon["CmdHero"]))
end
function M.createNewObject(  )
	local index = #M.getHeroCaches()+1
	M.request(M.className,M.newHero())
end
function M.request( className,data )
	static_Listener:dispatchEvent{
        name = "CmdAppend",
        data = data,
        className = className,
    }
end
return M