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
	chouka,--获取hero碎片
	breakout,--获得该武将可分解技能
	levelup,
	fight,--暂无数据只返回胜利
	learn,--武将学习技能
	edit,--编辑上阵
}
--hero有碎片，每个等级需要每一等级的碎片升级
--道具有技能书，每个hero可学习固定某几个技能，
--战斗先以回合制为测试基本
return M