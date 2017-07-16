--
-- Author: Your Name
-- Date: 2017-04-13 17:50:38
--存放各个页面的标签页,如果该标签不需要其他界面使用，则不必加在这里
--以及每个标签页相关index，方便查找(后来想想其实也可以用ref配置文件就好了)
local M = {}
--武将界面标签页
M.loginLayer = {
	--
	hero = 1,
	card = 2,
	--
	xxx = 1,
}

return M