local M = {}

--文字颜色
TEXT_COLOR_WHITE    = cc.c3b(255, 255, 255)
TEXT_COLOR_BLACK    = cc.c3b(0, 0, 0)


TEXT_COLOR_SOIL = cc.c3b(218,146,75)  --0号 土黄
TEXT_COLOR_YELLOW = cc.c3b(255, 234, 152)  --1号 黄色
TEXT_COLOR_BROWN = cc.c3b(57,25,0)    --2号 棕色
TEXT_COLOR_MAGENTA  = cc.c3b(189,72,9)   --3号 棕红
TEXT_COLOR_TURPLE = cc.c3b(144,115,99)   --4号  灰色
TEXT_COLOR_PURPLE = cc.c3b(238,144,255)  --5号  紫色
TEXT_COLOR_GREEN    = cc.c3b(77, 239, 69) --6号 绿色
TEXT_COLOR_BLUE     = cc.c3b(71,234,244)  --7号 蓝色
TEXT_COLOR_RED      = cc.c3b(251, 64, 64) --8号 红色
TEXT_COLOR_ORANGE = cc.c3b(255,180,0) --9号 橘色
TEXT_COLOR_DARK_GREEN = cc.c3b(14,153,7) --10号 深绿
TEXT_COLOR_DEEPRED = cc.c3b(220,17,17) --11号 深红

TEXT_COLOR_QUALITY={
	TEXT_COLOR_WHITE,
	TEXT_COLOR_GREEN,
	TEXT_COLOR_BLUE,
	TEXT_COLOR_PURPLE,                  
	TEXT_COLOR_ORANGE,
	TEXT_COLOR_RED,
}


--@ ui路径
--path表示路径，condition表示开启条件
--condition改为使用id查找条件，不用传参数
M.HeroLayer = {path = "HeroLayer",condition = {path = "",funcName = "",params = {}}}
M.PlayerLayer = {path = "HeroLayer",condition = {}}
M.testLayer = {path = "HeroLayer",condition = {}}
--[[一些数据模型
{path = "",funcName = "",params = {}} --获取obj里面的方法返回值
{dispatch}--消息传递模板（只用于界面沟通）
{}--
]]


return M