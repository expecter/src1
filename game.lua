
require("game.Startup")
-- define global module
game = {}

function game.startup()
    cc.FileUtils:getInstance():addSearchPath("res/")
    GameSceneMgr.replaceLayer("game.gameScenes.login.loginLayer")    
    -- game.enterMainScene()
end

function game.exit()
    os.exit()
end
return game