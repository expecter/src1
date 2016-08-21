--源码搜索路径
package.path = package.path .. ";src/"
cc.FileUtils:getInstance():setPopupNotify(false)
--载入框架
require("config") 
require("cocos.init")
require("framework.init") 
require("extend")
--版本更新
local ccfile = cc.FileUtils:getInstance()

--添加res搜索路径
ccfile:addSearchPath("res/")

function __G__TRACKBACK__(errorMessage)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(errorMessage) .. "\n")
    print(debug.traceback("", 2))
    print("----------------------------------------")
end
xpcall( function()
	require("game").startup()
end, __G__TRACKBACK__)
