--
-- Author: Your Name
-- Date: 2017-05-02 17:56:12
--
local M = {}
local cache = {
	cmdPlayer,
	cmdHero,
	CmdItem,
	CmdTask
}
local request = {
	chouka,
	fenjie,
	levelup,
}
--hero有碎片，每个等级需要每一等级的碎片升级
--道具有技能书，每个hero可学习固定某几个技能，
--战斗先以回合制为测试基本
return M