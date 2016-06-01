
function __G__TRACKBACK__(errorMessage)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(errorMessage) .. "\n")
    print(debug.traceback("", 2))
    print("----------------------------------------")
end
require("cocos.init")
require("framework.init")
require("extend")
package.path = package.path .. ";src/"
cc.FileUtils:getInstance():setPopupNotify(false)
require("game")
game.startup()
