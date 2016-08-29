
local M = 

{
	CmdBroCityRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdBroCityRspMsg',
		type = 'message',
		name = 'CmdBroCityRspMsg'
	},
	CmdEditUnionReqMsg = 
	{
		tmField = 
		{
			icon = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'string',
				name = 'icon'
			},
			declaration = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'string',
				name = 'declaration'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdEditUnionReqMsg',
		type = 'message',
		name = 'CmdEditUnionReqMsg'
	},
	CmdItem_Key = 
	{
		tmField = 
		{
			id = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'id'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdItem_Key',
		type = 'message',
		name = 'CmdItem_Key'
	},
	CmdNoticeFlag = 
	{
		tmField = 
		{
			mail = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'bool',
				name = 'mail'
			},
			task = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'bool',
				name = 'task'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdNoticeFlag',
		type = 'message',
		name = 'CmdNoticeFlag'
	},
	CmdActiveBag = 
	{
		tmField = 
		{
			refId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			},
			isTake = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'bool',
				name = 'isTake'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTask.CmdActiveBag',
		type = 'message',
		name = 'CmdActiveBag'
	},
	CmdShieldPlayerData = 
	{
		tmField = 
		{
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			imageId = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'string',
				name = 'imageId'
			},
			name = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'name'
			},
			day = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'int32',
				name = 'day'
			},
			level = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'level'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdShieldPlayerData',
		type = 'message',
		name = 'CmdShieldPlayerData'
	},
	CmdCampPlayerReport = 
	{
		tmField = 
		{
			battleData = 
			{
				fieldNumber = 7,
				prefix = 'optional',
				type = 'bytes',
				name = 'battleData'
			},
			targetPlayerName = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'targetPlayerName'
			},
			isWin = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'bool',
				name = 'isWin'
			},
			targetPlayerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'targetPlayerId'
			},
			battleSavePath = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'string',
				name = 'battleSavePath'
			},
			isAtk = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'bool',
				name = 'isAtk'
			},
			time = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'int64',
				name = 'time'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdCampPlayerReport',
		type = 'message',
		name = 'CmdCampPlayerReport'
	},
	CmdDrawSalaryRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdDrawSalaryRspMsg',
		type = 'message',
		name = 'CmdDrawSalaryRspMsg'
	},
	CmdQueryBattleFieldReqMsg = 
	{
		tmField = 
		{
			pos = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'pos'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdQueryBattleFieldReqMsg',
		type = 'message',
		name = 'CmdQueryBattleFieldReqMsg'
	},
	CmdBuyUnionArmyReqMsg = 
	{
		tmField = 
		{
			armyRefId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'armyRefId'
			},
			amount = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'amount'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdBuyUnionArmyReqMsg',
		type = 'message',
		name = 'CmdBuyUnionArmyReqMsg'
	},
	CmdCacheUpdateField = 
	{
		tmField = 
		{
			data = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'bytes',
				name = 'data'
			},
			fieldNumber = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'fieldNumber'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCommon.CmdCacheUpdateField',
		type = 'message',
		name = 'CmdCacheUpdateField'
	},
	CmdLeadeBoardData = 
	{
		tmField = 
		{
			playerId = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			value = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int32',
				name = 'value'
			},
			type = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'LeaderboardType',
				name = 'type'
			},
			name = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'string',
				name = 'name'
			},
			rank = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'rank'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdLeadeBoardData',
		type = 'message',
		name = 'CmdLeadeBoardData'
	},
	CmdSendUnionMailReqMsg = 
	{
		tmField = 
		{
			content = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'content'
			},
			title = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'string',
				name = 'title'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdSendUnionMailReqMsg',
		type = 'message',
		name = 'CmdSendUnionMailReqMsg'
	},
	CmdExtraInfoAcademy = 
	{
		tmField = 
		{
			tlCmdAcademyProduction = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdAcademyProduction',
				name = 'tlCmdAcademyProduction'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdExtraInfoAcademy',
		type = 'message',
		name = 'CmdExtraInfoAcademy'
	},
	MarchMark = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.MarchMark',
		enums = 
		{
			MM_ALLIED_INV = 4,
			MM_MINE_INV = 2,
			MM_ALLIED_DEF = 3,
			MM_NEARBY_DEF = 5,
			MM_MINE_DEF = 1
		},
		type = 'enum',
		name = 'MarchMark'
	},
	ArmyType = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCommon.ArmyType',
		enums = 
		{
			GongBing = 2,
			NONE = 0,
			BuBing = 1,
			QiBing = 3,
			QiXie = 4
		},
		type = 'enum',
		name = 'ArmyType'
	},
	CmdGetShieldPlayerRspMsg = 
	{
		tmField = 
		{
			cmdShieldPlayerData = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdShieldPlayerData',
				name = 'cmdShieldPlayerData'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdGetShieldPlayerRspMsg',
		type = 'message',
		name = 'CmdGetShieldPlayerRspMsg'
	},
	CmdGetCampReportRspMsg = 
	{
		tmField = 
		{
			tlCmdCampReport = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdCampReport',
				name = 'tlCmdCampReport'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGetCampReportRspMsg',
		type = 'message',
		name = 'CmdGetCampReportRspMsg'
	},
	EnumWorldObjType = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.EnumWorldObjType',
		enums = 
		{
			WT_NONE = 5,
			WT_RESOURCE = 1,
			WT_MARCH = 4,
			WT_NPCCITY = 3,
			WT_PLAYERCITY = 2
		},
		type = 'enum',
		name = 'EnumWorldObjType'
	},
	CmdGetCampShopInfoRspMsg = 
	{
		tmField = 
		{
			tlCmdCampShopInfo = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'CmdCampShopInfo',
				name = 'tlCmdCampShopInfo'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGetCampShopInfoRspMsg',
		type = 'message',
		name = 'CmdGetCampShopInfoRspMsg'
	},
	CmdPlayerLimitLeaderBoardExtraInfo = 
	{
		tmField = 
		{
			tlCmdPlayerLimitLeaderBoardData = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdPlayerLimitLeaderBoardData',
				name = 'tlCmdPlayerLimitLeaderBoardData'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdPlayerLimitLeaderBoardExtraInfo',
		type = 'message',
		name = 'CmdPlayerLimitLeaderBoardExtraInfo'
	},
	ActivityLeaderBoardSubKind = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.ActivityLeaderBoardSubKind',
		enums = 
		{
			Limit_Rank_Army = 1,
			Limit_Rank_Arane = 4,
			Limit_Rank_Build = 3,
			Cok_Rank_Army = 10,
			Limit_Rank_Fuben = 2
		},
		type = 'enum',
		name = 'ActivityLeaderBoardSubKind'
	},
	CmdSetDefendRuleReqMsg = 
	{
		tmField = 
		{
			autoDefend = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'bool',
				name = 'autoDefend'
			},
			helpPowerLimitRefId = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'int32',
				name = 'helpPowerLimitRefId'
			},
			allowHelp = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'bool',
				name = 'allowHelp'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdSetDefendRuleReqMsg',
		type = 'message',
		name = 'CmdSetDefendRuleReqMsg'
	},
	CmdPanicBuyReqMsg = 
	{
		tmField = 
		{
			contentId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'contentId'
			},
			activityId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'activityId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdPanicBuyReqMsg',
		type = 'message',
		name = 'CmdPanicBuyReqMsg'
	},
	CmdUpgradeUnionTechReqMsg = 
	{
		tmField = 
		{
			techId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'techId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdUpgradeUnionTechReqMsg',
		type = 'message',
		name = 'CmdUpgradeUnionTechReqMsg'
	},
	CmdGetActiveTaskRspMsg = 
	{
		tmField = 
		{
			cmdActiveTask = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdActiveTask',
				name = 'cmdActiveTask'
			},
			cmdActiveBag = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdActiveBag',
				name = 'cmdActiveBag'
			},
			allActiveNum = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'allActiveNum'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTask.CmdGetActiveTaskRspMsg',
		type = 'message',
		name = 'CmdGetActiveTaskRspMsg'
	},
	CmdPlayerResourceSpyDetail = 
	{
		tmField = 
		{
			gridLandForm = 
			{
				fieldNumber = 8,
				prefix = 'required',
				type = 'GridLandForm',
				name = 'gridLandForm'
			},
			cmdDefenderTroop = 
			{
				fieldNumber = 7,
				prefix = 'required',
				type = 'CmdDefenderTroop',
				name = 'cmdDefenderTroop'
			},
			level = 
			{
				fieldNumber = 9,
				prefix = 'required',
				type = 'int32',
				name = 'level'
			},
			hasCollectNum = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'int32',
				name = 'hasCollectNum'
			},
			targetPlayerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'targetPlayerId'
			},
			collectEndTime = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int64',
				name = 'collectEndTime'
			},
			y = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'y'
			},
			x = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'x'
			},
			targetName = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'string',
				name = 'targetName'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdPlayerResourceSpyDetail',
		type = 'message',
		name = 'CmdPlayerResourceSpyDetail'
	},
	CmdQueryUnionCallupReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdQueryUnionCallupReqMsg',
		type = 'message',
		name = 'CmdQueryUnionCallupReqMsg'
	},
	CmdCloseBattleFieldInterfaceReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdCloseBattleFieldInterfaceReqMsg',
		type = 'message',
		name = 'CmdCloseBattleFieldInterfaceReqMsg'
	},
	CmdQuitUnionReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdQuitUnionReqMsg',
		type = 'message',
		name = 'CmdQuitUnionReqMsg'
	},
	CmdGetAllItemRspMsg = 
	{
		tmField = 
		{
			cmdItems = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdItem',
				name = 'cmdItems'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdGetAllItemRspMsg',
		type = 'message',
		name = 'CmdGetAllItemRspMsg'
	},
	CmdPvpBattleHelperReportDetail = 
	{
		tmField = 
		{
			killSoldierNum = 
			{
				fieldNumber = 8,
				prefix = 'required',
				type = 'int32',
				name = 'killSoldierNum'
			},
			atkTotalSoldierNum = 
			{
				fieldNumber = 14,
				prefix = 'required',
				type = 'int32',
				name = 'atkTotalSoldierNum'
			},
			firstAttackerPos = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'firstAttackerPos'
			},
			ownerPlayerId = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'ownerPlayerId'
			},
			defTotalSoldierNum = 
			{
				fieldNumber = 17,
				prefix = 'required',
				type = 'int32',
				name = 'defTotalSoldierNum'
			},
			atkTroopCount = 
			{
				fieldNumber = 13,
				prefix = 'required',
				type = 'int32',
				name = 'atkTroopCount'
			},
			tlCmdMailBattleDetail = 
			{
				fieldNumber = 12,
				prefix = 'repeated',
				type = 'CmdMailBattleDetail',
				name = 'tlCmdMailBattleDetail'
			},
			defTotalLoseSoldier = 
			{
				fieldNumber = 18,
				prefix = 'required',
				type = 'int32',
				name = 'defTotalLoseSoldier'
			},
			gainCampPoint = 
			{
				fieldNumber = 10,
				prefix = 'required',
				type = 'int32',
				name = 'gainCampPoint'
			},
			isSuccess = 
			{
				fieldNumber = 7,
				prefix = 'required',
				type = 'bool',
				name = 'isSuccess'
			},
			loseArmy = 
			{
				fieldNumber = 11,
				prefix = 'repeated',
				type = 'CmdReward',
				name = 'loseArmy'
			},
			atkTotalLoseSoldier = 
			{
				fieldNumber = 15,
				prefix = 'required',
				type = 'int32',
				name = 'atkTotalLoseSoldier'
			},
			firstAttackerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'firstAttackerId'
			},
			ownerPlayerName = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'string',
				name = 'ownerPlayerName'
			},
			defTroopCount = 
			{
				fieldNumber = 16,
				prefix = 'required',
				type = 'int32',
				name = 'defTroopCount'
			},
			ownerPlayerPos = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'int32',
				name = 'ownerPlayerPos'
			},
			firstAttackerName = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'firstAttackerName'
			},
			loseSoldierNum = 
			{
				fieldNumber = 9,
				prefix = 'required',
				type = 'int32',
				name = 'loseSoldierNum'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdPvpBattleHelperReportDetail',
		type = 'message',
		name = 'CmdPvpBattleHelperReportDetail'
	},
	CmdQueryUnionInfoReqMsg = 
	{
		tmField = 
		{
			withMyData = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'bool',
				name = 'withMyData'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdQueryUnionInfoReqMsg',
		type = 'message',
		name = 'CmdQueryUnionInfoReqMsg'
	},
	CmdGetHasSendTimesRspMsg = 
	{
		tmField = 
		{
			hasSendCityTimes = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'hasSendCityTimes'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCityBattle.CmdGetHasSendTimesRspMsg',
		type = 'message',
		name = 'CmdGetHasSendTimesRspMsg'
	},
	CmdInjuryArmy_Key = 
	{
		tmField = 
		{
			refId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgArmy.CmdInjuryArmy_Key',
		type = 'message',
		name = 'CmdInjuryArmy_Key'
	},
	CmdHeroEquipShard_Key = 
	{
		tmField = 
		{
			refId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroEquipShard_Key',
		type = 'message',
		name = 'CmdHeroEquipShard_Key'
	},
	CmdGetPlayerInfoReqMsg = 
	{
		tmField = 
		{
			targetPlayerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'targetPlayerId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdGetPlayerInfoReqMsg',
		type = 'message',
		name = 'CmdGetPlayerInfoReqMsg'
	},
	CmdCloseWorldInterfaceRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdCloseWorldInterfaceRspMsg',
		type = 'message',
		name = 'CmdCloseWorldInterfaceRspMsg'
	},
	CmdCampReport = 
	{
		tmField = 
		{
			atkPlayerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'atkPlayerId'
			},
			defPlayerId = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'defPlayerId'
			},
			battleData = 
			{
				fieldNumber = 7,
				prefix = 'optional',
				type = 'bytes',
				name = 'battleData'
			},
			atkPlayerName = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'atkPlayerName'
			},
			battleSavePath = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'string',
				name = 'battleSavePath'
			},
			time = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int64',
				name = 'time'
			},
			defPlayerName = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'string',
				name = 'defPlayerName'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdCampReport',
		type = 'message',
		name = 'CmdCampReport'
	},
	CmdExtraInfoTraining = 
	{
		tmField = 
		{
			tlCmdTrainingProduction = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdTrainingProduction',
				name = 'tlCmdTrainingProduction'
			},
			queueNum = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int32',
				name = 'queueNum'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdExtraInfoTraining',
		type = 'message',
		name = 'CmdExtraInfoTraining'
	},
	CmdReadMailReqMsg = 
	{
		tmField = 
		{
			id = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'id'
			},
			mailType = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'MailType',
				name = 'mailType'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdReadMailReqMsg',
		type = 'message',
		name = 'CmdReadMailReqMsg'
	},
	CmdBuildUnionHallReqMsg = 
	{
		tmField = 
		{
			buildType = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'buildType'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdBuildUnionHallReqMsg',
		type = 'message',
		name = 'CmdBuildUnionHallReqMsg'
	},
	CmdBuildUpgradeReqMsg = 
	{
		tmField = 
		{
			lotId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'lotId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuildUpgradeReqMsg',
		type = 'message',
		name = 'CmdBuildUpgradeReqMsg'
	},
	CmdGetPlayerInfoRspMsg = 
	{
		tmField = 
		{
			cmdSimplePlayer = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'CmdSimplePlayer',
				name = 'cmdSimplePlayer'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdGetPlayerInfoRspMsg',
		type = 'message',
		name = 'CmdGetPlayerInfoRspMsg'
	},
	CmdTakeActivityAwardReqMsg = 
	{
		tmField = 
		{
			contentId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'contentId'
			},
			activityId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'activityId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdTakeActivityAwardReqMsg',
		type = 'message',
		name = 'CmdTakeActivityAwardReqMsg'
	},
	CmdBroCompleteActiveTaskRspMsg = 
	{
		tmField = 
		{
			cmdActiveTask = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'CmdActiveTask',
				name = 'cmdActiveTask'
			},
			cmdActiveBag = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdActiveBag',
				name = 'cmdActiveBag'
			},
			allActiveNum = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'allActiveNum'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTask.CmdBroCompleteActiveTaskRspMsg',
		type = 'message',
		name = 'CmdBroCompleteActiveTaskRspMsg'
	},
	CmdPrivateChat = 
	{
		tmField = 
		{
			friendPlayerId = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'int32',
				name = 'friendPlayerId'
			},
			playerName = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'string',
				name = 'playerName'
			},
			imageId = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'string',
				name = 'imageId'
			},
			receiveName = 
			{
				fieldNumber = 7,
				prefix = 'optional',
				type = 'string',
				name = 'receiveName'
			},
			msg = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'string',
				name = 'msg'
			},
			unread = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'int32',
				name = 'unread'
			},
			createTime = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'int64',
				name = 'createTime'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChat.CmdPrivateChat',
		type = 'message',
		name = 'CmdPrivateChat'
	},
	CmdBuildProduceCancelReqMsg = 
	{
		tmField = 
		{
			lotId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'lotId'
			},
			id = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'id'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuildProduceCancelReqMsg',
		type = 'message',
		name = 'CmdBuildProduceCancelReqMsg'
	},
	CmdDeclareBattleReqMsg = 
	{
		tmField = 
		{
			y = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'y'
			},
			x = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'x'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdDeclareBattleReqMsg',
		type = 'message',
		name = 'CmdDeclareBattleReqMsg'
	},
	CmdOpenBagNumRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdOpenBagNumRspMsg',
		type = 'message',
		name = 'CmdOpenBagNumRspMsg'
	},
	CmdPlayerReSignData = 
	{
		tmField = 
		{
			contentId = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'int32',
				name = 'contentId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdPlayerReSignData',
		type = 'message',
		name = 'CmdPlayerReSignData'
	},
	CmdBroAppendChangeRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdBroAppendChangeRspMsg',
		type = 'message',
		name = 'CmdBroAppendChangeRspMsg'
	},
	CmdGetChoukaInfoReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChouka.CmdGetChoukaInfoReqMsg',
		type = 'message',
		name = 'CmdGetChoukaInfoReqMsg'
	},
	CmdChangeUnionPositionRspMsg = 
	{
		tmField = 
		{
			success = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'bool',
				name = 'success'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdChangeUnionPositionRspMsg',
		type = 'message',
		name = 'CmdChangeUnionPositionRspMsg'
	},
	CmdSpeedUpRecallReqMsg = 
	{
		tmField = 
		{
			troopId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'troopId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdSpeedUpRecallReqMsg',
		type = 'message',
		name = 'CmdSpeedUpRecallReqMsg'
	},
	CmdTroopReliveRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdTroopReliveRspMsg',
		type = 'message',
		name = 'CmdTroopReliveRspMsg'
	},
	CmdUnionMemberStatus = 
	{
		tmField = 
		{
			lastLogoutTime = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int64',
				name = 'lastLogoutTime'
			},
			memberId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'memberId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdUnionMemberStatus',
		type = 'message',
		name = 'CmdUnionMemberStatus'
	},
	CmdGiveUpCampTaskReqMsg = 
	{
		tmField = 
		{
			taskId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'taskId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGiveUpCampTaskReqMsg',
		type = 'message',
		name = 'CmdGiveUpCampTaskReqMsg'
	},
	CmdBuyItemReqMsg = 
	{
		tmField = 
		{
			num = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'num'
			},
			isUse = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'bool',
				name = 'isUse'
			},
			refId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			},
			goodsType = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'GoodsType',
				name = 'goodsType'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdBuyItemReqMsg',
		type = 'message',
		name = 'CmdBuyItemReqMsg'
	},
	CmdBuyUnionArmyRspMsg = 
	{
		tmField = 
		{
			modifyBarrack = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'CmdUnionBarrack',
				name = 'modifyBarrack'
			},
			success = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'bool',
				name = 'success'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdBuyUnionArmyRspMsg',
		type = 'message',
		name = 'CmdBuyUnionArmyRspMsg'
	},
	CmdTrainingProduceReqMsg = 
	{
		tmField = 
		{
			tlCmdArmy = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdArmy',
				name = 'tlCmdArmy'
			},
			lotId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'lotId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdTrainingProduceReqMsg',
		type = 'message',
		name = 'CmdTrainingProduceReqMsg'
	},
	CmdTakeOffEquipRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdTakeOffEquipRspMsg',
		type = 'message',
		name = 'CmdTakeOffEquipRspMsg'
	},
	CmdBroDeclareBattleRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdBroDeclareBattleRspMsg',
		type = 'message',
		name = 'CmdBroDeclareBattleRspMsg'
	},
	CmdHeroShard = 
	{
		tmField = 
		{
			num = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'num'
			},
			refId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroShard',
		type = 'message',
		name = 'CmdHeroShard'
	},
	CmdBuild = 
	{
		tmField = 
		{
			extraInfo = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'bytes',
				name = 'extraInfo'
			},
			lotId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'lotId'
			},
			refId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			},
			level = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'level'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuild',
		type = 'message',
		name = 'CmdBuild'
	},
	CmdSyncPlayerResourceReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdSyncPlayerResourceReqMsg',
		type = 'message',
		name = 'CmdSyncPlayerResourceReqMsg'
	},
	CmdTakeTaskReqMsg = 
	{
		tmField = 
		{
			refId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTask.CmdTakeTaskReqMsg',
		type = 'message',
		name = 'CmdTakeTaskReqMsg'
	},
	CmdTech_Key = 
	{
		tmField = 
		{
			techId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'techId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTech.CmdTech_Key',
		type = 'message',
		name = 'CmdTech_Key'
	},
	CmdGetCampShopInfoReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGetCampShopInfoReqMsg',
		type = 'message',
		name = 'CmdGetCampShopInfoReqMsg'
	},
	CmdEquipExchangeRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdEquipExchangeRspMsg',
		type = 'message',
		name = 'CmdEquipExchangeRspMsg'
	},
	CmdCollectTaxRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCityBattle.CmdCollectTaxRspMsg',
		type = 'message',
		name = 'CmdCollectTaxRspMsg'
	},
	CmdBuildCancelReqMsg = 
	{
		tmField = 
		{
			lotId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'lotId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuildCancelReqMsg',
		type = 'message',
		name = 'CmdBuildCancelReqMsg'
	},
	CmdGainCampTaskRewardReqMsg = 
	{
		tmField = 
		{
			taskId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'taskId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGainCampTaskRewardReqMsg',
		type = 'message',
		name = 'CmdGainCampTaskRewardReqMsg'
	},
	CmdGetVipBagRspMsg = 
	{
		tmField = 
		{
			cmdVipBag = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdVipBag',
				name = 'cmdVipBag'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdGetVipBagRspMsg',
		type = 'message',
		name = 'CmdGetVipBagRspMsg'
	},
	CmdUseHeroExpBallReqMsg = 
	{
		tmField = 
		{
			heroId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'heroId'
			},
			num = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'num'
			},
			itemRefId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'itemRefId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdUseHeroExpBallReqMsg',
		type = 'message',
		name = 'CmdUseHeroExpBallReqMsg'
	},
	CmdGetAllItemReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdGetAllItemReqMsg',
		type = 'message',
		name = 'CmdGetAllItemReqMsg'
	},
	CmdReward = 
	{
		tmField = 
		{
			num = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'int32',
				name = 'num'
			},
			refId = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int32',
				name = 'refId'
			},
			goodsType = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'GoodsType',
				name = 'goodsType'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCommon.CmdReward',
		type = 'message',
		name = 'CmdReward'
	},
	CmdCompoundEquipRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdCompoundEquipRspMsg',
		type = 'message',
		name = 'CmdCompoundEquipRspMsg'
	},
	CmdMail = 
	{
		tmField = 
		{
			mailId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'mailId'
			},
			detail = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'bytes',
				name = 'detail'
			},
			isRead = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'bool',
				name = 'isRead'
			},
			sendTime = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int64',
				name = 'sendTime'
			},
			mailSubType = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'MailSubType',
				name = 'mailSubType'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdMail',
		type = 'message',
		name = 'CmdMail'
	},
	CmdPveBattleReportDetail = 
	{
		tmField = 
		{
			killSoldierNum = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'killSoldierNum'
			},
			resource = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'CmdReward',
				name = 'resource'
			},
			isAttack = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'bool',
				name = 'isAttack'
			},
			gridLandForm = 
			{
				fieldNumber = 7,
				prefix = 'required',
				type = 'GridLandForm',
				name = 'gridLandForm'
			},
			level = 
			{
				fieldNumber = 8,
				prefix = 'required',
				type = 'int32',
				name = 'level'
			},
			selfLoseSoldier = 
			{
				fieldNumber = 5,
				prefix = 'repeated',
				type = 'CmdReward',
				name = 'selfLoseSoldier'
			},
			cmdMailBattleDtail = 
			{
				fieldNumber = 9,
				prefix = 'required',
				type = 'CmdMailBattleDetail',
				name = 'cmdMailBattleDtail'
			},
			y = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'y'
			},
			x = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'x'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdPveBattleReportDetail',
		type = 'message',
		name = 'CmdPveBattleReportDetail'
	},
	BattleAnima = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.BattleAnima',
		enums = 
		{
			BA_BLOCK = 4,
			BA_CRITED = 2,
			BA_REFLECT = 5,
			BA_RESIST = 1,
			BA_REFLECTED = 6,
			BA_DODGE = 3
		},
		type = 'enum',
		name = 'BattleAnima'
	},
	CmdPlayerExpend_Update = 
	{
		tmField = 
		{
			cmdPlayerExpend = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'CmdPlayerExpend',
				name = 'cmdPlayerExpend'
			},
			cmdCacheUpdateByField = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'CmdCacheUpdateByField',
				name = 'cmdCacheUpdateByField'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdPlayerExpend_Update',
		type = 'message',
		name = 'CmdPlayerExpend_Update'
	},
	CmdEquipXilianReqMsg = 
	{
		tmField = 
		{
			index = 
			{
				fieldNumber = 3,
				prefix = 'repeated',
				type = 'int32',
				name = 'index'
			},
			equipId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'equipId'
			},
			xilianMode = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'xilianMode'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdEquipXilianReqMsg',
		type = 'message',
		name = 'CmdEquipXilianReqMsg'
	},
	CmdFubenBoxStatus = 
	{
		tmField = 
		{
			index = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'index'
			},
			isTake = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'bool',
				name = 'isTake'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgFuben.CmdFubenBoxStatus',
		type = 'message',
		name = 'CmdFubenBoxStatus'
	},
	CmdPvpBattleOwnerReportDetail = 
	{
		tmField = 
		{
			killSoldierNum = 
			{
				fieldNumber = 7,
				prefix = 'required',
				type = 'int32',
				name = 'killSoldierNum'
			},
			atkTotalSoldierNum = 
			{
				fieldNumber = 14,
				prefix = 'required',
				type = 'int32',
				name = 'atkTotalSoldierNum'
			},
			firstAttackerPos = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'firstAttackerPos'
			},
			defTotalSoldierNum = 
			{
				fieldNumber = 17,
				prefix = 'required',
				type = 'int32',
				name = 'defTotalSoldierNum'
			},
			atkTroopCount = 
			{
				fieldNumber = 13,
				prefix = 'required',
				type = 'int32',
				name = 'atkTroopCount'
			},
			defTotalLoseSoldier = 
			{
				fieldNumber = 18,
				prefix = 'required',
				type = 'int32',
				name = 'defTotalLoseSoldier'
			},
			gainCampPoint = 
			{
				fieldNumber = 9,
				prefix = 'required',
				type = 'int32',
				name = 'gainCampPoint'
			},
			leftProsperity = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'int32',
				name = 'leftProsperity'
			},
			isSuccess = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'bool',
				name = 'isSuccess'
			},
			tlCmdMailBattleDetail = 
			{
				fieldNumber = 12,
				prefix = 'repeated',
				type = 'CmdMailBattleDetail',
				name = 'tlCmdMailBattleDetail'
			},
			atkTotalLoseSoldier = 
			{
				fieldNumber = 15,
				prefix = 'required',
				type = 'int32',
				name = 'atkTotalLoseSoldier'
			},
			resources = 
			{
				fieldNumber = 10,
				prefix = 'repeated',
				type = 'CmdReward',
				name = 'resources'
			},
			firstAttackerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'firstAttackerId'
			},
			loseArmy = 
			{
				fieldNumber = 11,
				prefix = 'repeated',
				type = 'CmdReward',
				name = 'loseArmy'
			},
			defTroopCount = 
			{
				fieldNumber = 16,
				prefix = 'required',
				type = 'int32',
				name = 'defTroopCount'
			},
			firstAttackerName = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'firstAttackerName'
			},
			loseSoldierNum = 
			{
				fieldNumber = 8,
				prefix = 'required',
				type = 'int32',
				name = 'loseSoldierNum'
			},
			decProsperity = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int32',
				name = 'decProsperity'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdPvpBattleOwnerReportDetail',
		type = 'message',
		name = 'CmdPvpBattleOwnerReportDetail'
	},
	CmdCancelEquipXilianRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdCancelEquipXilianRspMsg',
		type = 'message',
		name = 'CmdCancelEquipXilianRspMsg'
	},
	MessageBuild = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.MessageBuild',
		enums = 
		{
			CmdBuildProduceSpeed = 11211,
			CmdHospitalProduce = 11212,
			CmdBuildProduceCancel = 11210,
			CmdBuildCancel = 11206,
			CmdGetBuildQueue = 11204,
			CmdTrainingProduce = 11213,
			CmdBuildConstruct = 11201,
			CmdCityExpand = 11215,
			CmdOpenProduceQueue = 11214,
			CmdBuildUpgrade = 11202,
			CmdAbandonInjuryArmy = 11216,
			CmdBarrackProduce = 11207,
			CmdAcademyProduce = 11209,
			CmdBuildSpeed = 11203,
			CmdBuyBuildQueue = 11205,
			CmdGetProduceQueue = 11208
		},
		type = 'enum',
		name = 'MessageBuild'
	},
	CmdHandleUnionApplicationRspMsg = 
	{
		tmField = 
		{
			success = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'bool',
				name = 'success'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdHandleUnionApplicationRspMsg',
		type = 'message',
		name = 'CmdHandleUnionApplicationRspMsg'
	},
	CmdBuildQueue_Update = 
	{
		tmField = 
		{
			cmdBuildQueue = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdBuildQueue',
				name = 'cmdBuildQueue'
			},
			cmdBuildQueue_Key = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdBuildQueue_Key',
				name = 'cmdBuildQueue_Key'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuildQueue_Update',
		type = 'message',
		name = 'CmdBuildQueue_Update'
	},
	CmdCityExpandRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdCityExpandRspMsg',
		type = 'message',
		name = 'CmdCityExpandRspMsg'
	},
	MarchStatus = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.MarchStatus',
		enums = 
		{
			MS_MARCH_INTO = 1,
			MS_DEFENDING = 0,
			MS_RETURN_HOME = 11,
			MS_COLLECTING = 4,
			MS_DEAD = 10,
			MS_COLLECT = 3,
			MS_BATTLE_FIELD = 2
		},
		type = 'enum',
		name = 'MarchStatus'
	},
	CmdGetBuildQueueRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdGetBuildQueueRspMsg',
		type = 'message',
		name = 'CmdGetBuildQueueRspMsg'
	},
	CmdBattleFieldTroop = 
	{
		tmField = 
		{
			activeTime = 
			{
				fieldNumber = 12,
				prefix = 'optional',
				type = 'int64',
				name = 'activeTime'
			},
			playerLevel = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'int32',
				name = 'playerLevel'
			},
			playerName = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'string',
				name = 'playerName'
			},
			troopId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'troopId'
			},
			unionId = 
			{
				fieldNumber = 10,
				prefix = 'required',
				type = 'int32',
				name = 'unionId'
			},
			commandingGeneralRefId = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'int32',
				name = 'commandingGeneralRefId'
			},
			commandingGeneralLevel = 
			{
				fieldNumber = 7,
				prefix = 'optional',
				type = 'int32',
				name = 'commandingGeneralLevel'
			},
			playerImageId = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'string',
				name = 'playerImageId'
			},
			playerId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			commandingGeneralStep = 
			{
				fieldNumber = 8,
				prefix = 'optional',
				type = 'int32',
				name = 'commandingGeneralStep'
			},
			totalAmount = 
			{
				fieldNumber = 9,
				prefix = 'required',
				type = 'int32',
				name = 'totalAmount'
			},
			unionIcon = 
			{
				fieldNumber = 11,
				prefix = 'optional',
				type = 'int32',
				name = 'unionIcon'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdBattleFieldTroop',
		type = 'message',
		name = 'CmdBattleFieldTroop'
	},
	CmdLoginRspMsg = 
	{
		tmField = 
		{
			playerId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			responseWithBattleData = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'bool',
				name = 'responseWithBattleData'
			},
			sessionId = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'string',
				name = 'sessionId'
			},
			channelId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'channelId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgLogin.CmdLoginRspMsg',
		type = 'message',
		name = 'CmdLoginRspMsg'
	},
	CmdQueryNoticeFlagReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdQueryNoticeFlagReqMsg',
		type = 'message',
		name = 'CmdQueryNoticeFlagReqMsg'
	},
	CmdArmyInfo = 
	{
		tmField = 
		{
			index = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'index'
			},
			cmdArmy = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'CmdArmy',
				name = 'cmdArmy'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdArmyInfo',
		type = 'message',
		name = 'CmdArmyInfo'
	},
	CmdDefenderTroop = 
	{
		tmField = 
		{
			isHelpArmy = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'bool',
				name = 'isHelpArmy'
			},
			commandingGeneralRefId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'commandingGeneralRefId'
			},
			soldierNum = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'soldierNum'
			},
			level = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'level'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCommon.CmdDefenderTroop',
		type = 'message',
		name = 'CmdDefenderTroop'
	},
	CmdGetResourceInfoRspMsg = 
	{
		tmField = 
		{
			tlCmdBuffInfo = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdBuffInfo',
				name = 'tlCmdBuffInfo'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdGetResourceInfoRspMsg',
		type = 'message',
		name = 'CmdGetResourceInfoRspMsg'
	},
	CmdGetCampTaskTimesReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGetCampTaskTimesReqMsg',
		type = 'message',
		name = 'CmdGetCampTaskTimesReqMsg'
	},
	CmdReconnaissanceOfPlayerCityReqMsg = 
	{
		tmField = 
		{
			pos = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'pos'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdReconnaissanceOfPlayerCityReqMsg',
		type = 'message',
		name = 'CmdReconnaissanceOfPlayerCityReqMsg'
	},
	MessageCityBattle = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCityBattle.MessageCityBattle',
		enums = 
		{
			CmdSendCity = 11302,
			CmdGetAllCityInfo = 11305,
			CmdGetCityReport = 11304,
			CmdGetHasSendTimes = 11307,
			CmdCollectTax = 11301,
			CmdGetNpcCityTroop = 11306,
			CmdGrantCity = 11303
		},
		type = 'enum',
		name = 'MessageCityBattle'
	},
	CmdAbandonInjuryArmyRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdAbandonInjuryArmyRspMsg',
		type = 'message',
		name = 'CmdAbandonInjuryArmyRspMsg'
	},
	CmdQueryNoticeFlagRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdQueryNoticeFlagRspMsg',
		type = 'message',
		name = 'CmdQueryNoticeFlagRspMsg'
	},
	CmdGetProduceQueueRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdGetProduceQueueRspMsg',
		type = 'message',
		name = 'CmdGetProduceQueueRspMsg'
	},
	CmdYinChoukaRspMsg = 
	{
		tmField = 
		{
			cmdChoukaInfo = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'CmdChoukaInfo',
				name = 'cmdChoukaInfo'
			},
			cmdReward = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdReward',
				name = 'cmdReward'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChouka.CmdYinChoukaRspMsg',
		type = 'message',
		name = 'CmdYinChoukaRspMsg'
	},
	CmdGetBuildQueueReqMsg = 
	{
		tmField = 
		{
			lotId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'lotId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdGetBuildQueueReqMsg',
		type = 'message',
		name = 'CmdGetBuildQueueReqMsg'
	},
	MessageHero = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.MessageHero',
		enums = 
		{
			CmdHeroVeinUpgrade = 10309,
			CmdHeroBreakDown = 10307,
			CmdEquipExchange = 10312,
			CmdCompoundEquip = 10311,
			CmdEquipBreakDown = 10314,
			CmdHeroVeinTupo = 10310,
			CmdCompoundHero = 10303,
			CmdHeroRebirth = 10308,
			CmdEquipXilian = 10304,
			CmdHeroStep = 10301,
			CmdHeroEquipLevel = 10302,
			CmdConfirmEquipXilian = 10305,
			CmdTakeOffEquip = 10313,
			CmdCancelEquipXilian = 10306
		},
		type = 'enum',
		name = 'MessageHero'
	},
	CmdUnionMemberData = 
	{
		tmField = 
		{
			hallBuildDailyCount = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'int32',
				name = 'hallBuildDailyCount'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdUnionMemberData',
		type = 'message',
		name = 'CmdUnionMemberData'
	},
	CmdPlayerSpyDetail = 
	{
		tmField = 
		{
			resource = 
			{
				fieldNumber = 7,
				prefix = 'repeated',
				type = 'CmdReward',
				name = 'resource'
			},
			army = 
			{
				fieldNumber = 6,
				prefix = 'repeated',
				type = 'CmdReward',
				name = 'army'
			},
			targetPlayerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'targetPlayerId'
			},
			tlCmdDefenderTroop = 
			{
				fieldNumber = 5,
				prefix = 'repeated',
				type = 'CmdDefenderTroop',
				name = 'tlCmdDefenderTroop'
			},
			y = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'y'
			},
			x = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'x'
			},
			targetName = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'targetName'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdPlayerSpyDetail',
		type = 'message',
		name = 'CmdPlayerSpyDetail'
	},
	CmdGetLeaderboardRspMsg = 
	{
		tmField = 
		{
			myCmdLeadeBoardData = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdLeadeBoardData',
				name = 'myCmdLeadeBoardData'
			},
			CmdLeadeBoardDatas = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdLeadeBoardData',
				name = 'CmdLeadeBoardDatas'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdGetLeaderboardRspMsg',
		type = 'message',
		name = 'CmdGetLeaderboardRspMsg'
	},
	CmdJinChoukaReqMsg = 
	{
		tmField = 
		{
			tenChou = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'bool',
				name = 'tenChou'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChouka.CmdJinChoukaReqMsg',
		type = 'message',
		name = 'CmdJinChoukaReqMsg'
	},
	CmdGrantCityRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCityBattle.CmdGrantCityRspMsg',
		type = 'message',
		name = 'CmdGrantCityRspMsg'
	},
	CmdVipBag = 
	{
		tmField = 
		{
			vipLevel = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'vipLevel'
			},
			isBuy = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'bool',
				name = 'isBuy'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdVipBag',
		type = 'message',
		name = 'CmdVipBag'
	},
	CmdActivityInfoListReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdActivityInfoListReqMsg',
		type = 'message',
		name = 'CmdActivityInfoListReqMsg'
	},
	CmdBuild_Update = 
	{
		tmField = 
		{
			cmdBuild = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdBuild',
				name = 'cmdBuild'
			},
			cmdBuild_Key = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdBuild_Key',
				name = 'cmdBuild_Key'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuild_Update',
		type = 'message',
		name = 'CmdBuild_Update'
	},
	CmdQueryAlliedTroopOnResourceGridReqMsg = 
	{
		tmField = 
		{
			pos = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'pos'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdQueryAlliedTroopOnResourceGridReqMsg',
		type = 'message',
		name = 'CmdQueryAlliedTroopOnResourceGridReqMsg'
	},
	CmdHeroRebirthRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroRebirthRspMsg',
		type = 'message',
		name = 'CmdHeroRebirthRspMsg'
	},
	CmdSevenDayPlayerStatusData = 
	{
		tmField = 
		{
			process = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'int32',
				name = 'process'
			},
			contentId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'contentId'
			},
			curBuyNum = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int32',
				name = 'curBuyNum'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdSevenDayPlayerStatusData',
		type = 'message',
		name = 'CmdSevenDayPlayerStatusData'
	},
	CmdArmy_Key = 
	{
		tmField = 
		{
			refId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgArmy.CmdArmy_Key',
		type = 'message',
		name = 'CmdArmy_Key'
	},
	CmdBuild_Key = 
	{
		tmField = 
		{
			lotId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'lotId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuild_Key',
		type = 'message',
		name = 'CmdBuild_Key'
	},
	CmdDrawSalaryReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdDrawSalaryReqMsg',
		type = 'message',
		name = 'CmdDrawSalaryReqMsg'
	},
	EnumErrorType = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgAppend.EnumErrorType',
		enums = 
		{
			SERVER_ERROR = 3,
			NO_ROLE = 6,
			BAGS_NOENOUGH = 5,
			NO_ERROR = 1,
			ERROR = 2,
			GOLD_NOT_ENOUGH = 4
		},
		type = 'enum',
		name = 'EnumErrorType'
	},
	MessageWorld = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.MessageWorld',
		enums = 
		{
			CmdCollectCoordinate = 10216,
			CmdMarchIntoCity = 10211,
			CmdSpeedUpRecall = 10215,
			CmdBroMarch = 10203,
			CmdDelCoordinate = 10217,
			CmdReconnaissanceOfResourceGrid = 10205,
			CmdQueryWorldObjInSight = 10202,
			CmdMoveCity = 10222,
			CmdRecall = 10208,
			CmdCloseWorldInterface = 10210,
			CmdQueryAlliedTroopOnResourceGrid = 10207,
			CmdQueryResourceGrid = 10206,
			CmdGetEnemyMarch = 10228,
			CmdRepatriateHelpTroop = 10225,
			CmdCollect = 10204,
			CmdBroPlayerWorldObj = 10221,
			CmdGetCoordinate = 10218,
			CmdSetDefendRule = 10226,
			CmdBroCity = 10209,
			CmdCheckCoordinate = 10219,
			CmdQueryBattleField = 10212,
			CmdBroBattleFieldEvent = 10213,
			CmdCloseBattleFieldInterface = 10214,
			CmdQueryHelpTroop = 10224,
			CmdQueryHelpTroopSummaries = 10223,
			CmdGetDefendRule = 10227,
			CmdReconnaissanceOfPlayerCity = 10220
		},
		type = 'enum',
		name = 'MessageWorld'
	},
	CmdCampTask_Key = 
	{
		tmField = 
		{
			taskId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'taskId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdCampTask_Key',
		type = 'message',
		name = 'CmdCampTask_Key'
	},
	CmdGetChatRspMsg = 
	{
		tmField = 
		{
			cmdChat = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdChat',
				name = 'cmdChat'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChat.CmdGetChatRspMsg',
		type = 'message',
		name = 'CmdGetChatRspMsg'
	},
	CmdBattleRound = 
	{
		tmField = 
		{
			beforeRoundEvent = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdBattleEvent',
				name = 'beforeRoundEvent'
			},
			afterRoundEvent = 
			{
				fieldNumber = 3,
				prefix = 'repeated',
				type = 'CmdBattleEvent',
				name = 'afterRoundEvent'
			},
			attackEvent = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdBattleAttack',
				name = 'attackEvent'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.CmdBattleRound',
		type = 'message',
		name = 'CmdBattleRound'
	},
	CmdLimitLeaderBoardRankData = 
	{
		tmField = 
		{
			kind = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'ActivityLeaderBoardSubKind',
				name = 'kind'
			},
			level = 
			{
				fieldNumber = 7,
				prefix = 'optional',
				type = 'int32',
				name = 'level'
			},
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			value = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'value'
			},
			imageId = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'string',
				name = 'imageId'
			},
			playerName = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'playerName'
			},
			rank = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'rank'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdLimitLeaderBoardRankData',
		type = 'message',
		name = 'CmdLimitLeaderBoardRankData'
	},
	CmdGetVipBagReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdGetVipBagReqMsg',
		type = 'message',
		name = 'CmdGetVipBagReqMsg'
	},
	CmdHeroVeinInfo = 
	{
		tmField = 
		{
			tlCmdHeroVein = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdHeroVein',
				name = 'tlCmdHeroVein'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroVeinInfo',
		type = 'message',
		name = 'CmdHeroVeinInfo'
	},
	CmdTech = 
	{
		tmField = 
		{
			techId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'techId'
			},
			level = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'level'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTech.CmdTech',
		type = 'message',
		name = 'CmdTech'
	},
	CmdCampOfficeInfo = 
	{
		tmField = 
		{
			playerLv = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'int32',
				name = 'playerLv'
			},
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			officeIndex = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'int32',
				name = 'officeIndex'
			},
			playerImageId = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'string',
				name = 'playerImageId'
			},
			playerName = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'string',
				name = 'playerName'
			},
			officeId = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int32',
				name = 'officeId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdCampOfficeInfo',
		type = 'message',
		name = 'CmdCampOfficeInfo'
	},
	CmdIndexRankInfo = 
	{
		tmField = 
		{
			index = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'index'
			},
			cmdSimplePlayerInfo = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'CmdSimplePlayerInfo',
				name = 'cmdSimplePlayerInfo'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdIndexRankInfo',
		type = 'message',
		name = 'CmdIndexRankInfo'
	},
	EnumCacheName = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgAppend.EnumCacheName',
		enums = 
		{
			CmdTroop = 7,
			CmdBuild = 9,
			CmdUnionMember = 17,
			CmdBuildQueue = 10,
			CmdNoticeFlag = 11,
			CmdTech = 13,
			CmdCampData = 15,
			CmdHeroEquip = 20,
			CmdArmy = 4,
			CmdHeroEquipShard = 21,
			CmdHero = 3,
			CmdWorldObj = 8,
			CmdPlayerExpend = 16,
			CmdUserGuideTask = 19,
			CmdDeclareBattleInfo = 14,
			CmdPlayer = 1,
			CmdTask = 6,
			CmdItem = 2,
			CmdInjuryArmy = 12,
			CmdHeroShard = 5,
			CmdCampTask = 18
		},
		type = 'enum',
		name = 'EnumCacheName'
	},
	CmdHeroRebirthReqMsg = 
	{
		tmField = 
		{
			heroId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'heroId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroRebirthReqMsg',
		type = 'message',
		name = 'CmdHeroRebirthReqMsg'
	},
	CmdQueryHelpTroopSummariesRspMsg = 
	{
		tmField = 
		{
			summary = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdTroop',
				name = 'summary'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdQueryHelpTroopSummariesRspMsg',
		type = 'message',
		name = 'CmdQueryHelpTroopSummariesRspMsg'
	},
	CmdDelCoordinateRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdDelCoordinateRspMsg',
		type = 'message',
		name = 'CmdDelCoordinateRspMsg'
	},
	CmdSimplePlayer = 
	{
		tmField = 
		{
			name = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'name'
			},
			power = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'int32',
				name = 'power'
			},
			level = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'level'
			},
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			arenaRank = 
			{
				fieldNumber = 7,
				prefix = 'optional',
				type = 'int32',
				name = 'arenaRank'
			},
			imageId = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'string',
				name = 'imageId'
			},
			isShield = 
			{
				fieldNumber = 9,
				prefix = 'optional',
				type = 'bool',
				name = 'isShield'
			},
			vipLevel = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int32',
				name = 'vipLevel'
			},
			unionName = 
			{
				fieldNumber = 8,
				prefix = 'optional',
				type = 'string',
				name = 'unionName'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdSimplePlayer',
		type = 'message',
		name = 'CmdSimplePlayer'
	},
	CmdHeroShard_Key = 
	{
		tmField = 
		{
			refId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroShard_Key',
		type = 'message',
		name = 'CmdHeroShard_Key'
	},
	CmdHeroBreakDownRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroBreakDownRspMsg',
		type = 'message',
		name = 'CmdHeroBreakDownRspMsg'
	},
	CmdRaidsFubenReqMsg = 
	{
		tmField = 
		{
			fubenId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'fubenId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgFuben.CmdRaidsFubenReqMsg',
		type = 'message',
		name = 'CmdRaidsFubenReqMsg'
	},
	CmdWorldObj = 
	{
		tmField = 
		{
			enumWorldObjType = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'EnumWorldObjType',
				name = 'enumWorldObjType'
			},
			worldObjDetail = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'bytes',
				name = 'worldObjDetail'
			},
			worldObjId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'string',
				name = 'worldObjId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdWorldObj',
		type = 'message',
		name = 'CmdWorldObj'
	},
	CmdGrowthFundBuyRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdGrowthFundBuyRspMsg',
		type = 'message',
		name = 'CmdGrowthFundBuyRspMsg'
	},
	CmdBuySoulShopGoodsRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChouka.CmdBuySoulShopGoodsRspMsg',
		type = 'message',
		name = 'CmdBuySoulShopGoodsRspMsg'
	},
	CmdBroBuffInfoRspMsg = 
	{
		tmField = 
		{
			tlCmdBuffInfo = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'CmdBuffInfo',
				name = 'tlCmdBuffInfo'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdBroBuffInfoRspMsg',
		type = 'message',
		name = 'CmdBroBuffInfoRspMsg'
	},
	CmdRefreshSoulShopReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChouka.CmdRefreshSoulShopReqMsg',
		type = 'message',
		name = 'CmdRefreshSoulShopReqMsg'
	},
	CmdPublishUnionCallupReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdPublishUnionCallupReqMsg',
		type = 'message',
		name = 'CmdPublishUnionCallupReqMsg'
	},
	MessageTroop = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.MessageTroop',
		enums = 
		{
			CmdExchangeArmy = 10805,
			CmdEditArmy = 10803,
			CmdDismissTroop = 10804,
			CmdExchangeHero = 10807,
			CmdTroopRelive = 10808,
			CmdEditTroop = 10802,
			CmdGetAllTroop = 10801,
			CmdAutoArmy = 10806
		},
		type = 'enum',
		name = 'MessageTroop'
	},
	CmdDeleteItemReqMsg = 
	{
		tmField = 
		{
			num = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'num'
			},
			id = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'id'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdDeleteItemReqMsg',
		type = 'message',
		name = 'CmdDeleteItemReqMsg'
	},
	CmdGetAllMailReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdGetAllMailReqMsg',
		type = 'message',
		name = 'CmdGetAllMailReqMsg'
	},
	CmdHeroBreakDownReqMsg = 
	{
		tmField = 
		{
			heroIds = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'int32',
				name = 'heroIds'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroBreakDownReqMsg',
		type = 'message',
		name = 'CmdHeroBreakDownReqMsg'
	},
	CmdQueryUnionCallupRspMsg = 
	{
		tmField = 
		{
			acceptable = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'bool',
				name = 'acceptable'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdQueryUnionCallupRspMsg',
		type = 'message',
		name = 'CmdQueryUnionCallupRspMsg'
	},
	CmdAcceptCampTaskReqMsg = 
	{
		tmField = 
		{
			taskId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'taskId'
			},
			taskType = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'taskType'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdAcceptCampTaskReqMsg',
		type = 'message',
		name = 'CmdAcceptCampTaskReqMsg'
	},
	CmdBattleFieldBattle = 
	{
		tmField = 
		{
			atkPlayerId = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'atkPlayerId'
			},
			defPlayerId = 
			{
				fieldNumber = 7,
				prefix = 'required',
				type = 'int32',
				name = 'defPlayerId'
			},
			winnerIndex = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'winnerIndex'
			},
			atkPlayerName = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'string',
				name = 'atkPlayerName'
			},
			atkHeroRefId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'atkHeroRefId'
			},
			defHeroRefId = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'int32',
				name = 'defHeroRefId'
			},
			atkTroopAmount = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int32',
				name = 'atkTroopAmount'
			},
			defPlayerName = 
			{
				fieldNumber = 8,
				prefix = 'optional',
				type = 'string',
				name = 'defPlayerName'
			},
			defTroopAmount = 
			{
				fieldNumber = 9,
				prefix = 'required',
				type = 'int32',
				name = 'defTroopAmount'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdBattleFieldBattle',
		type = 'message',
		name = 'CmdBattleFieldBattle'
	},
	CmdUserGuideTask = 
	{
		tmField = 
		{
			progress = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'progress'
			},
			taskId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'taskId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUserGuideTask.CmdUserGuideTask',
		type = 'message',
		name = 'CmdUserGuideTask'
	},
	CmdGetDefendRuleRspMsg = 
	{
		tmField = 
		{
			autoDefend = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'bool',
				name = 'autoDefend'
			},
			helpPowerLimitRefId = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'helpPowerLimitRefId'
			},
			allowHelp = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'bool',
				name = 'allowHelp'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdGetDefendRuleRspMsg',
		type = 'message',
		name = 'CmdGetDefendRuleRspMsg'
	},
	CmdHeroEquipShard = 
	{
		tmField = 
		{
			num = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'num'
			},
			refId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroEquipShard',
		type = 'message',
		name = 'CmdHeroEquipShard'
	},
	MessagePlayer = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.MessagePlayer',
		enums = 
		{
			CmdGetShieldPlayer = 10105,
			CmdLogout = 10101,
			CmdBuyVipBag = 10106,
			CmdPlayerRename = 10110,
			CmdUnShieldPlayer = 10104,
			CmdBroBuffInfo = 10113,
			CmdGetPlayerInfo = 10102,
			CmdGetResourceInfo = 10112,
			CmdGetVipBag = 10107,
			CmdShieldPlayer = 10103,
			CmdGetLeaderboard = 10109,
			CmdSyncPlayerResource = 10111,
			CmdQueryNoticeFlag = 10108
		},
		type = 'enum',
		name = 'MessagePlayer'
	},
	CmdTroop_Key = 
	{
		tmField = 
		{
			troopId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'troopId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdTroop_Key',
		type = 'message',
		name = 'CmdTroop_Key'
	},
	CmdBroPlayerWorldObjRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdBroPlayerWorldObjRspMsg',
		type = 'message',
		name = 'CmdBroPlayerWorldObjRspMsg'
	},
	CmdQueryHelpTroopSummariesReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdQueryHelpTroopSummariesReqMsg',
		type = 'message',
		name = 'CmdQueryHelpTroopSummariesReqMsg'
	},
	CmdTakeOffEquipReqMsg = 
	{
		tmField = 
		{
			equipId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'equipId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdTakeOffEquipReqMsg',
		type = 'message',
		name = 'CmdTakeOffEquipReqMsg'
	},
	CmdGetCoordinateReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdGetCoordinateReqMsg',
		type = 'message',
		name = 'CmdGetCoordinateReqMsg'
	},
	CmdChangeProvinceRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdChangeProvinceRspMsg',
		type = 'message',
		name = 'CmdChangeProvinceRspMsg'
	},
	CmdSendChatReqMsg = 
	{
		tmField = 
		{
			chatKind = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'ChatKind',
				name = 'chatKind'
			},
			receivePlayerId = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int32',
				name = 'receivePlayerId'
			},
			expandMsg = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'string',
				name = 'expandMsg'
			},
			msg = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'string',
				name = 'msg'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChat.CmdSendChatReqMsg',
		type = 'message',
		name = 'CmdSendChatReqMsg'
	},
	CmdGetCityReportRspMsg = 
	{
		tmField = 
		{
			tlCmdCityBattleReports = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdCityBattleReport',
				name = 'tlCmdCityBattleReports'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCityBattle.CmdGetCityReportRspMsg',
		type = 'message',
		name = 'CmdGetCityReportRspMsg'
	},
	CmdTroopReliveReqMsg = 
	{
		tmField = 
		{
			troopId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'troopId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdTroopReliveReqMsg',
		type = 'message',
		name = 'CmdTroopReliveReqMsg'
	},
	CmdActivityTag = 
	{
		tmField = 
		{
			activityContent = 
			{
				fieldNumber = 3,
				prefix = 'repeated',
				type = 'CmdActivityContent',
				name = 'activityContent'
			},
			tagId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'tagId'
			},
			extraInfo = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'bytes',
				name = 'extraInfo'
			},
			name = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'string',
				name = 'name'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdActivityTag',
		type = 'message',
		name = 'CmdActivityTag'
	},
	CmdBattleUnit = 
	{
		tmField = 
		{
			armyId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'armyId'
			},
			amount = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int32',
				name = 'amount'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.CmdBattleUnit',
		type = 'message',
		name = 'CmdBattleUnit'
	},
	CmdBuyBuildQueueRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuyBuildQueueRspMsg',
		type = 'message',
		name = 'CmdBuyBuildQueueRspMsg'
	},
	CmdRefreshCampTaskReqMsg = 
	{
		tmField = 
		{
			taskType = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'taskType'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdRefreshCampTaskReqMsg',
		type = 'message',
		name = 'CmdRefreshCampTaskReqMsg'
	},
	CmdUserGuideTask_Key = 
	{
		tmField = 
		{
			taskId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'taskId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUserGuideTask.CmdUserGuideTask_Key',
		type = 'message',
		name = 'CmdUserGuideTask_Key'
	},
	CmdOpenKingFightPanelReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdOpenKingFightPanelReqMsg',
		type = 'message',
		name = 'CmdOpenKingFightPanelReqMsg'
	},
	CmdBuffInfo = 
	{
		tmField = 
		{
			goodsId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'goodsId'
			},
			endTime = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int64',
				name = 'endTime'
			},
			extraInfo = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'bytes',
				name = 'extraInfo'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdBuffInfo',
		type = 'message',
		name = 'CmdBuffInfo'
	},
	CmdCompoundHeroRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdCompoundHeroRspMsg',
		type = 'message',
		name = 'CmdCompoundHeroRspMsg'
	},
	CmdCityBattleReport = 
	{
		tmField = 
		{
			attackerImageId = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'string',
				name = 'attackerImageId'
			},
			attackerSoldierNum = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'int32',
				name = 'attackerSoldierNum'
			},
			saveBattlePath = 
			{
				fieldNumber = 15,
				prefix = 'required',
				type = 'string',
				name = 'saveBattlePath'
			},
			attackerProvinceId = 
			{
				fieldNumber = 7,
				prefix = 'required',
				type = 'int32',
				name = 'attackerProvinceId'
			},
			defenderPlayerId = 
			{
				fieldNumber = 8,
				prefix = 'required',
				type = 'int32',
				name = 'defenderPlayerId'
			},
			defenderLv = 
			{
				fieldNumber = 10,
				prefix = 'required',
				type = 'int32',
				name = 'defenderLv'
			},
			defenderImageId = 
			{
				fieldNumber = 11,
				prefix = 'optional',
				type = 'string',
				name = 'defenderImageId'
			},
			attackerLv = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'attackerLv'
			},
			atkCommandingRefId = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int32',
				name = 'atkCommandingRefId'
			},
			attackerWin = 
			{
				fieldNumber = 17,
				prefix = 'required',
				type = 'bool',
				name = 'attackerWin'
			},
			battleTime = 
			{
				fieldNumber = 16,
				prefix = 'required',
				type = 'int64',
				name = 'battleTime'
			},
			battleData = 
			{
				fieldNumber = 18,
				prefix = 'optional',
				type = 'bytes',
				name = 'battleData'
			},
			defCommandingRefId = 
			{
				fieldNumber = 12,
				prefix = 'required',
				type = 'int32',
				name = 'defCommandingRefId'
			},
			defenderSoldierNum = 
			{
				fieldNumber = 13,
				prefix = 'required',
				type = 'int32',
				name = 'defenderSoldierNum'
			},
			defenderName = 
			{
				fieldNumber = 9,
				prefix = 'optional',
				type = 'string',
				name = 'defenderName'
			},
			attackerName = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'attackerName'
			},
			attackerPlayerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'attackerPlayerId'
			},
			defenderProvinceId = 
			{
				fieldNumber = 14,
				prefix = 'required',
				type = 'int32',
				name = 'defenderProvinceId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCityBattle.CmdCityBattleReport',
		type = 'message',
		name = 'CmdCityBattleReport'
	},
	CmdLimitLeaderBoardRewardData = 
	{
		tmField = 
		{
			endRank = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'endRank'
			},
			rewardList = 
			{
				fieldNumber = 3,
				prefix = 'repeated',
				type = 'CmdReward',
				name = 'rewardList'
			},
			titleId = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'int32',
				name = 'titleId'
			},
			startRank = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'startRank'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdLimitLeaderBoardRewardData',
		type = 'message',
		name = 'CmdLimitLeaderBoardRewardData'
	},
	CmdOpenProduceQueueReqMsg = 
	{
		tmField = 
		{
			lotId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'lotId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdOpenProduceQueueReqMsg',
		type = 'message',
		name = 'CmdOpenProduceQueueReqMsg'
	},
	CmdAppendReq = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgAppend.CmdAppendReq',
		type = 'message',
		name = 'CmdAppendReq'
	},
	CmdEditArmyReqMsg = 
	{
		tmField = 
		{
			troopId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'troopId'
			},
			index = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'index'
			},
			cmdArmyInfo = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'CmdArmyInfo',
				name = 'cmdArmyInfo'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdEditArmyReqMsg',
		type = 'message',
		name = 'CmdEditArmyReqMsg'
	},
	CmdUnionBarrack = 
	{
		tmField = 
		{
			armyId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'armyId'
			},
			amount = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'amount'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdUnionBarrack',
		type = 'message',
		name = 'CmdUnionBarrack'
	},
	CmdPlayerRenameReqMsg = 
	{
		tmField = 
		{
			name = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'string',
				name = 'name'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdPlayerRenameReqMsg',
		type = 'message',
		name = 'CmdPlayerRenameReqMsg'
	},
	CmdPlayerTitleData = 
	{
		tmField = 
		{
			titleId = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'int32',
				name = 'titleId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdPlayerTitleData',
		type = 'message',
		name = 'CmdPlayerTitleData'
	},
	CmdGetFubenInfoReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgFuben.CmdGetFubenInfoReqMsg',
		type = 'message',
		name = 'CmdGetFubenInfoReqMsg'
	},
	CmdGetChoukaInfoRspMsg = 
	{
		tmField = 
		{
			cmdChoukaInfo = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdChoukaInfo',
				name = 'cmdChoukaInfo'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChouka.CmdGetChoukaInfoRspMsg',
		type = 'message',
		name = 'CmdGetChoukaInfoRspMsg'
	},
	CmdGetNpcCityTroopRspMsg = 
	{
		tmField = 
		{
			tlCmdCityBattleTroop = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdCityBattleTroop',
				name = 'tlCmdCityBattleTroop'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCityBattle.CmdGetNpcCityTroopRspMsg',
		type = 'message',
		name = 'CmdGetNpcCityTroopRspMsg'
	},
	CmdGrowthFundCondition = 
	{
		tmField = 
		{
			level = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'int32',
				name = 'level'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdGrowthFundCondition',
		type = 'message',
		name = 'CmdGrowthFundCondition'
	},
	CmdBuildSpeedReqMsg = 
	{
		tmField = 
		{
			lotId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'lotId'
			},
			num = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'num'
			},
			refId = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			},
			goodsType = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'GoodsType',
				name = 'goodsType'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuildSpeedReqMsg',
		type = 'message',
		name = 'CmdBuildSpeedReqMsg'
	},
	ChoukaType = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChouka.ChoukaType',
		enums = 
		{
			Jin = 1,
			Yin = 2
		},
		type = 'enum',
		name = 'ChoukaType'
	},
	CmdResource = 
	{
		tmField = 
		{
			cmdWorldObjOwnerInfo = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'CmdWorldObjOwnerInfo',
				name = 'cmdWorldObjOwnerInfo'
			},
			gridLandForm = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'GridLandForm',
				name = 'gridLandForm'
			},
			hasEnemy = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'bool',
				name = 'hasEnemy'
			},
			pos = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'pos'
			},
			level = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'level'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdResource',
		type = 'message',
		name = 'CmdResource'
	},
	CmdChangeStatusReqMsg = 
	{
		tmField = 
		{
			isTargetDeclare = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'bool',
				name = 'isTargetDeclare'
			},
			targetPlayerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'targetPlayerId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdChangeStatusReqMsg',
		type = 'message',
		name = 'CmdChangeStatusReqMsg'
	},
	CmdRegisterPlayerReqMsg = 
	{
		tmField = 
		{
			openId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'openId'
			},
			ver = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'int32',
				name = 'ver'
			},
			channelSimpleName = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'string',
				name = 'channelSimpleName'
			},
			imei = 
			{
				fieldNumber = 7,
				prefix = 'optional',
				type = 'string',
				name = 'imei'
			},
			timestamp = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'string',
				name = 'timestamp'
			},
			imageId = 
			{
				fieldNumber = 10,
				prefix = 'required',
				type = 'string',
				name = 'imageId'
			},
			userType = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'userType'
			},
			ip = 
			{
				fieldNumber = 11,
				prefix = 'optional',
				type = 'string',
				name = 'ip'
			},
			serverSign = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'string',
				name = 'serverSign'
			},
			serverId = 
			{
				fieldNumber = 8,
				prefix = 'required',
				type = 'int32',
				name = 'serverId'
			},
			playerName = 
			{
				fieldNumber = 9,
				prefix = 'required',
				type = 'string',
				name = 'playerName'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgLogin.CmdRegisterPlayerReqMsg',
		type = 'message',
		name = 'CmdRegisterPlayerReqMsg'
	},
	CmdCampTask = 
	{
		tmField = 
		{
			hasGainReward = 
			{
				fieldNumber = 8,
				prefix = 'required',
				type = 'bool',
				name = 'hasGainReward'
			},
			hasAccept = 
			{
				fieldNumber = 9,
				prefix = 'required',
				type = 'bool',
				name = 'hasAccept'
			},
			subType = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'subType'
			},
			taskId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'taskId'
			},
			taskType = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'taskType'
			},
			progress = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int32',
				name = 'progress'
			},
			quality = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'quality'
			},
			condition = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'int32',
				name = 'condition'
			},
			extraCondition = 
			{
				fieldNumber = 7,
				prefix = 'required',
				type = 'int32',
				name = 'extraCondition'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdCampTask',
		type = 'message',
		name = 'CmdCampTask'
	},
	CmdCollectCoordinateReqMsg = 
	{
		tmField = 
		{
			pos = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'pos'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdCollectCoordinateReqMsg',
		type = 'message',
		name = 'CmdCollectCoordinateReqMsg'
	},
	CmdCollectTaxReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCityBattle.CmdCollectTaxReqMsg',
		type = 'message',
		name = 'CmdCollectTaxReqMsg'
	},
	CmdBuildConstructReqMsg = 
	{
		tmField = 
		{
			lotId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'lotId'
			},
			refId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuildConstructReqMsg',
		type = 'message',
		name = 'CmdBuildConstructReqMsg'
	},
	CmdGetOfficeListRspMsg = 
	{
		tmField = 
		{
			tlCmdCampOfficeInfo = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdCampOfficeInfo',
				name = 'tlCmdCampOfficeInfo'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGetOfficeListRspMsg',
		type = 'message',
		name = 'CmdGetOfficeListRspMsg'
	},
	CmdGetAllCityInfoRspMsg = 
	{
		tmField = 
		{
			tlCmdCityBattleInfo = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdCityBattleInfo',
				name = 'tlCmdCityBattleInfo'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCityBattle.CmdGetAllCityInfoRspMsg',
		type = 'message',
		name = 'CmdGetAllCityInfoRspMsg'
	},
	CmdCheckPrivateChatRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChat.CmdCheckPrivateChatRspMsg',
		type = 'message',
		name = 'CmdCheckPrivateChatRspMsg'
	},
	CmdUseHeroExpBallRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdUseHeroExpBallRspMsg',
		type = 'message',
		name = 'CmdUseHeroExpBallRspMsg'
	},
	CmdAcademyProduceReqMsg = 
	{
		tmField = 
		{
			techId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'techId'
			},
			lotId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'lotId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdAcademyProduceReqMsg',
		type = 'message',
		name = 'CmdAcademyProduceReqMsg'
	},
	CmdReconnaissanceOfResourceGridRspMsg = 
	{
		tmField = 
		{
			mailId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'mailId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdReconnaissanceOfResourceGridRspMsg',
		type = 'message',
		name = 'CmdReconnaissanceOfResourceGridRspMsg'
	},
	CmdGetCampMemberReqMsg = 
	{
		tmField = 
		{
			firstRecord = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'firstRecord'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGetCampMemberReqMsg',
		type = 'message',
		name = 'CmdGetCampMemberReqMsg'
	},
	CmdHeroEquipXilian = 
	{
		tmField = 
		{
			index = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'index'
			},
			propertyKind = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'propertyKind'
			},
			value = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'string',
				name = 'value'
			},
			isRate = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'bool',
				name = 'isRate'
			},
			isSelect = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'bool',
				name = 'isSelect'
			},
			quality = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'quality'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroEquipXilian',
		type = 'message',
		name = 'CmdHeroEquipXilian'
	},
	CmdConfirmEquipXilianRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdConfirmEquipXilianRspMsg',
		type = 'message',
		name = 'CmdConfirmEquipXilianRspMsg'
	},
	BattleDamageType = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.BattleDamageType',
		enums = 
		{
			BDT_NORMAL_ATTACK = 1,
			BDT_DIRECT = 2
		},
		type = 'enum',
		name = 'BattleDamageType'
	},
	CmdAppointOfficeReqMsg = 
	{
		tmField = 
		{
			officeIndex = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'officeIndex'
			},
			targetPlayerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'targetPlayerId'
			},
			officeId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'officeId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdAppointOfficeReqMsg',
		type = 'message',
		name = 'CmdAppointOfficeReqMsg'
	},
	CmdBroActivityRspMsg = 
	{
		tmField = 
		{
			tlCmdActivity = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'CmdActivity',
				name = 'tlCmdActivity'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdBroActivityRspMsg',
		type = 'message',
		name = 'CmdBroActivityRspMsg'
	},
	CmdRecallReqMsg = 
	{
		tmField = 
		{
			troopId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'troopId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdRecallReqMsg',
		type = 'message',
		name = 'CmdRecallReqMsg'
	},
	CmdGetActiveTaskReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTask.CmdGetActiveTaskReqMsg',
		type = 'message',
		name = 'CmdGetActiveTaskReqMsg'
	},
	CmdBuyBuildQueueReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuyBuildQueueReqMsg',
		type = 'message',
		name = 'CmdBuyBuildQueueReqMsg'
	},
	CmdFubenBox = 
	{
		tmField = 
		{
			chapterId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'chapterId'
			},
			cmdFubenBoxStatus = 
			{
				fieldNumber = 3,
				prefix = 'repeated',
				type = 'CmdFubenBoxStatus',
				name = 'cmdFubenBoxStatus'
			},
			curStar = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'curStar'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgFuben.CmdFubenBox',
		type = 'message',
		name = 'CmdFubenBox'
	},
	CmdTroopSummary = 
	{
		tmField = 
		{
			playerLevel = 
			{
				fieldNumber = 7,
				prefix = 'required',
				type = 'int32',
				name = 'playerLevel'
			},
			playerId = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			playerIcon = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'string',
				name = 'playerIcon'
			},
			commandingGeneralRefId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'commandingGeneralRefId'
			},
			campId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'campId'
			},
			li = 
			{
				fieldNumber = 9,
				prefix = 'optional',
				type = 'int32',
				name = 'li'
			},
			playerName = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'string',
				name = 'playerName'
			},
			soldierNum = 
			{
				fieldNumber = 8,
				prefix = 'required',
				type = 'int32',
				name = 'soldierNum'
			},
			su = 
			{
				fieldNumber = 11,
				prefix = 'optional',
				type = 'int32',
				name = 'su'
			},
			zhi = 
			{
				fieldNumber = 10,
				prefix = 'optional',
				type = 'int32',
				name = 'zhi'
			},
			provinceId = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'provinceId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdTroopSummary',
		type = 'message',
		name = 'CmdTroopSummary'
	},
	CmdCityBattleTroop = 
	{
		tmField = 
		{
			cmdTroopHeroDetail = 
			{
				fieldNumber = 10,
				prefix = 'required',
				type = 'CmdTroopHeroDetail',
				name = 'cmdTroopHeroDetail'
			},
			cmdArmyInfos = 
			{
				fieldNumber = 8,
				prefix = 'repeated',
				type = 'CmdArmyInfo',
				name = 'cmdArmyInfos'
			},
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			maxArmyNum = 
			{
				fieldNumber = 9,
				prefix = 'required',
				type = 'int32',
				name = 'maxArmyNum'
			},
			commandingGeneralRefId = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'commandingGeneralRefId'
			},
			deputyGeneralId1 = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'int32',
				name = 'deputyGeneralId1'
			},
			playerName = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'string',
				name = 'playerName'
			},
			troopId = 
			{
				fieldNumber = 11,
				prefix = 'required',
				type = 'int32',
				name = 'troopId'
			},
			commandingGeneralLv = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int32',
				name = 'commandingGeneralLv'
			},
			provinceId = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'provinceId'
			},
			deputyGeneralId2 = 
			{
				fieldNumber = 7,
				prefix = 'optional',
				type = 'int32',
				name = 'deputyGeneralId2'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCityBattle.CmdCityBattleTroop',
		type = 'message',
		name = 'CmdCityBattleTroop'
	},
	CmdQueryBattleRspMsg = 
	{
		tmField = 
		{
			battle = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'CmdBattle',
				name = 'battle'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.CmdQueryBattleRspMsg',
		type = 'message',
		name = 'CmdQueryBattleRspMsg'
	},
	CmdUnShieldPlayerReqMsg = 
	{
		tmField = 
		{
			targetPlayerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'targetPlayerId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdUnShieldPlayerReqMsg',
		type = 'message',
		name = 'CmdUnShieldPlayerReqMsg'
	},
	CmdCloseKingFightPanelRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdCloseKingFightPanelRspMsg',
		type = 'message',
		name = 'CmdCloseKingFightPanelRspMsg'
	},
	CmdCheckCoordinateRspMsg = 
	{
		tmField = 
		{
			cmdCoordinateContent = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'CmdCoordinateContent',
				name = 'cmdCoordinateContent'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdCheckCoordinateRspMsg',
		type = 'message',
		name = 'CmdCheckCoordinateRspMsg'
	},
	CmdQueryResourceGridReqMsg = 
	{
		tmField = 
		{
			pos = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'pos'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdQueryResourceGridReqMsg',
		type = 'message',
		name = 'CmdQueryResourceGridReqMsg'
	},
	CmdApplyToJoinUnionRspMsg = 
	{
		tmField = 
		{
			success = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'bool',
				name = 'success'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdApplyToJoinUnionRspMsg',
		type = 'message',
		name = 'CmdApplyToJoinUnionRspMsg'
	},
	CmdBuildConstructRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuildConstructRspMsg',
		type = 'message',
		name = 'CmdBuildConstructRspMsg'
	},
	CmdActivityContent = 
	{
		tmField = 
		{
			limitTiemes = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int32',
				name = 'limitTiemes'
			},
			conTitle = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'string',
				name = 'conTitle'
			},
			rewardList = 
			{
				fieldNumber = 6,
				prefix = 'repeated',
				type = 'CmdReward',
				name = 'rewardList'
			},
			activityCondition = 
			{
				fieldNumber = 7,
				prefix = 'optional',
				type = 'bytes',
				name = 'activityCondition'
			},
			order = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int32',
				name = 'order'
			},
			id = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'id'
			},
			description = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'string',
				name = 'description'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdActivityContent',
		type = 'message',
		name = 'CmdActivityContent'
	},
	CmdCancelUnionApplicationReqMsg = 
	{
		tmField = 
		{
			unionId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'unionId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdCancelUnionApplicationReqMsg',
		type = 'message',
		name = 'CmdCancelUnionApplicationReqMsg'
	},
	CmdHitAnima = 
	{
		tmField = 
		{
			attackHitAnima = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'BattleAnima',
				name = 'attackHitAnima'
			},
			pos = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'pos'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.CmdHitAnima',
		type = 'message',
		name = 'CmdHitAnima'
	},
	CmdData = 
	{
		tmField = 
		{
			appendData = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'bytes',
				name = 'appendData'
			},
			compress = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'bool',
				name = 'compress'
			},
			message = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'CmdMessage',
				name = 'message'
			},
			data = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'bytes',
				name = 'data'
			},
			appendCode = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'sint32',
				name = 'appendCode'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.CmdData',
		type = 'message',
		name = 'CmdData'
	},
	CmdKingBetRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdKingBetRspMsg',
		type = 'message',
		name = 'CmdKingBetRspMsg'
	},
	CmdHospitalProduceReqMsg = 
	{
		tmField = 
		{
			tlCmdArmy = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdArmy',
				name = 'tlCmdArmy'
			},
			lotId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'lotId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdHospitalProduceReqMsg',
		type = 'message',
		name = 'CmdHospitalProduceReqMsg'
	},
	CmdHeroEquipLevelReqMsg = 
	{
		tmField = 
		{
			equipId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'equipId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroEquipLevelReqMsg',
		type = 'message',
		name = 'CmdHeroEquipLevelReqMsg'
	},
	CmdWorldObj_Update = 
	{
		tmField = 
		{
			cmdWorldObj = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdWorldObj',
				name = 'cmdWorldObj'
			},
			cmdWorldObj_Key = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdWorldObj_Key',
				name = 'cmdWorldObj_Key'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdWorldObj_Update',
		type = 'message',
		name = 'CmdWorldObj_Update'
	},
	CmdShieldPlayerRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdShieldPlayerRspMsg',
		type = 'message',
		name = 'CmdShieldPlayerRspMsg'
	},
	CmdAppointOfficeRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdAppointOfficeRspMsg',
		type = 'message',
		name = 'CmdAppointOfficeRspMsg'
	},
	CmdTakeActivityAwardRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdTakeActivityAwardRspMsg',
		type = 'message',
		name = 'CmdTakeActivityAwardRspMsg'
	},
	BuildType = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.BuildType',
		enums = 
		{
			NONGTIAN = 11,
			MINJU = 6,
			YIYUAN = 7,
			SHILIAOCHANG = 9,
			MUCAICHANG = 8,
			HANLINYUAN = 3,
			ZHUCHENG = 1,
			XUNLIANCHANG = 5,
			BINGYING = 2,
			TIEKUANGCHANG = 10,
			JIAOCHANG = 4,
			CANGKU = 12
		},
		type = 'enum',
		name = 'BuildType'
	},
	MessageChat = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChat.MessageChat',
		enums = 
		{
			CmdPrivateChatList = 10704,
			CmdSendChat = 10702,
			CmdDelPrivateChat = 10705,
			CmdGetChat = 10701,
			CmdBroChat = 10703,
			CmdCheckPrivateChat = 10706
		},
		type = 'enum',
		name = 'MessageChat'
	},
	CmdQuitUnionRspMsg = 
	{
		tmField = 
		{
			success = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'bool',
				name = 'success'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdQuitUnionRspMsg',
		type = 'message',
		name = 'CmdQuitUnionRspMsg'
	},
	CmdUnionMember_Key = 
	{
		tmField = 
		{
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdUnionMember_Key',
		type = 'message',
		name = 'CmdUnionMember_Key'
	},
	CmdBroCampTaskRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdBroCampTaskRspMsg',
		type = 'message',
		name = 'CmdBroCampTaskRspMsg'
	},
	ChatKind = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCommon.ChatKind',
		enums = 
		{
			JUNTUAN = 3,
			WORLD = 1,
			PRIVATE = 4,
			COUNTRY = 2
		},
		type = 'enum',
		name = 'ChatKind'
	},
	CmdTrainingProduction = 
	{
		tmField = 
		{
			tlCmdArmy = 
			{
				fieldNumber = 4,
				prefix = 'repeated',
				type = 'CmdArmy',
				name = 'tlCmdArmy'
			},
			endTime = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int64',
				name = 'endTime'
			},
			id = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'id'
			},
			startTime = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int64',
				name = 'startTime'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdTrainingProduction',
		type = 'message',
		name = 'CmdTrainingProduction'
	},
	__loadlist__ = {
		'msgCommon.proto','msgChatData.proto','msgArmy.proto','msgWorldData.proto','msgPlayerData.proto','msgPlayer.proto','msgChoukaData.proto','msgItemData.proto','msgTaskData.proto','msgTask.proto','msgHeroData.proto','msgArmyData.proto','msgBuildData.proto','msgTroopData.proto','msgBattleData.proto','msgCityBattleData.proto','msgWorld.proto','msgTroop.proto','msgHero.proto','msgUserGuideTaskData.proto','msgMailData.proto','msgMail.proto','msgActivityData.proto','msgActivity.proto','msgFubenData.proto','msgAppend.proto','msgFuben.proto','msgUnionData.proto','msgChat.proto','msgBuild.proto','msgTechData.proto','msgUnion.proto','cmd.proto','msgCityBattle.proto','msgCampData.proto','msgCamp.proto','msgLogin.proto','msgChouka.proto','msgItem.proto','msgBattle.proto'
	},
	CmdConfirmEquipXilianReqMsg = 
	{
		tmField = 
		{
			index = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'int32',
				name = 'index'
			},
			equipId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'equipId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdConfirmEquipXilianReqMsg',
		type = 'message',
		name = 'CmdConfirmEquipXilianReqMsg'
	},
	CmdPlayer = 
	{
		tmField = 
		{
			gold = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int32',
				name = 'gold'
			},
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			energy = 
			{
				fieldNumber = 17,
				prefix = 'optional',
				type = 'int32',
				name = 'energy'
			},
			pos = 
			{
				fieldNumber = 21,
				prefix = 'required',
				type = 'int32',
				name = 'pos'
			},
			imageId = 
			{
				fieldNumber = 16,
				prefix = 'optional',
				type = 'string',
				name = 'imageId'
			},
			soulNum = 
			{
				fieldNumber = 25,
				prefix = 'required',
				type = 'int32',
				name = 'soulNum'
			},
			bagNum = 
			{
				fieldNumber = 11,
				prefix = 'required',
				type = 'int32',
				name = 'bagNum'
			},
			payGoldTotal = 
			{
				fieldNumber = 19,
				prefix = 'optional',
				type = 'int32',
				name = 'payGoldTotal'
			},
			cityLevel = 
			{
				fieldNumber = 24,
				prefix = 'required',
				type = 'int32',
				name = 'cityLevel'
			},
			wood = 
			{
				fieldNumber = 7,
				prefix = 'required',
				type = 'int32',
				name = 'wood'
			},
			vipLevel = 
			{
				fieldNumber = 12,
				prefix = 'required',
				type = 'int32',
				name = 'vipLevel'
			},
			buildQueueNum = 
			{
				fieldNumber = 20,
				prefix = 'optional',
				type = 'int32',
				name = 'buildQueueNum'
			},
			exp = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'exp'
			},
			power = 
			{
				fieldNumber = 15,
				prefix = 'optional',
				type = 'int32',
				name = 'power'
			},
			food = 
			{
				fieldNumber = 10,
				prefix = 'required',
				type = 'int32',
				name = 'food'
			},
			unionId = 
			{
				fieldNumber = 14,
				prefix = 'optional',
				type = 'int32',
				name = 'unionId'
			},
			coin = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'int32',
				name = 'coin'
			},
			unionName = 
			{
				fieldNumber = 23,
				prefix = 'optional',
				type = 'string',
				name = 'unionName'
			},
			stone = 
			{
				fieldNumber = 9,
				prefix = 'required',
				type = 'int32',
				name = 'stone'
			},
			name = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'name'
			},
			arenaRank = 
			{
				fieldNumber = 13,
				prefix = 'optional',
				type = 'int32',
				name = 'arenaRank'
			},
			level = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'level'
			},
			equipBagNum = 
			{
				fieldNumber = 28,
				prefix = 'required',
				type = 'int32',
				name = 'equipBagNum'
			},
			tlCmdPlayerTitleData = 
			{
				fieldNumber = 27,
				prefix = 'optional',
				type = 'bytes',
				name = 'tlCmdPlayerTitleData'
			},
			iron = 
			{
				fieldNumber = 8,
				prefix = 'required',
				type = 'int32',
				name = 'iron'
			},
			campPoint = 
			{
				fieldNumber = 26,
				prefix = 'required',
				type = 'int32',
				name = 'campPoint'
			},
			energyTime = 
			{
				fieldNumber = 18,
				prefix = 'optional',
				type = 'int64',
				name = 'energyTime'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdPlayer',
		type = 'message',
		name = 'CmdPlayer'
	},
	CmdDelCoordinateReqMsg = 
	{
		tmField = 
		{
			pos = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'pos'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdDelCoordinateReqMsg',
		type = 'message',
		name = 'CmdDelCoordinateReqMsg'
	},
	CmdChangeStatusRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdChangeStatusRspMsg',
		type = 'message',
		name = 'CmdChangeStatusRspMsg'
	},
	CmdTroop_Update = 
	{
		tmField = 
		{
			cmdTroop = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdTroop',
				name = 'cmdTroop'
			},
			cmdTroop_Key = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdTroop_Key',
				name = 'cmdTroop_Key'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdTroop_Update',
		type = 'message',
		name = 'CmdTroop_Update'
	},
	CmdBuildSpeedRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuildSpeedRspMsg',
		type = 'message',
		name = 'CmdBuildSpeedRspMsg'
	},
	CmdCityBattleInfo = 
	{
		tmField = 
		{
			cityId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'cityId'
			},
			playerId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			isFire = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'bool',
				name = 'isFire'
			},
			campId = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'campId'
			},
			playerName = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'string',
				name = 'playerName'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCityBattle.CmdCityBattleInfo',
		type = 'message',
		name = 'CmdCityBattleInfo'
	},
	CmdBuySoulShopGoodsReqMsg = 
	{
		tmField = 
		{
			goodsId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'goodsId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChouka.CmdBuySoulShopGoodsReqMsg',
		type = 'message',
		name = 'CmdBuySoulShopGoodsReqMsg'
	},
	CmdBroUnionNoticeRspMsg = 
	{
		tmField = 
		{
			modifyTech = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'CmdTech',
				name = 'modifyTech'
			},
			quitUnionId = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'int32',
				name = 'quitUnionId'
			},
			modifyUnion = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'CmdUnion',
				name = 'modifyUnion'
			},
			unionApplication = 
			{
				fieldNumber = 4,
				prefix = 'repeated',
				type = 'CmdUnionApplication',
				name = 'unionApplication'
			},
			removeUnionApplicationId = 
			{
				fieldNumber = 3,
				prefix = 'repeated',
				type = 'int32',
				name = 'removeUnionApplicationId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdBroUnionNoticeRspMsg',
		type = 'message',
		name = 'CmdBroUnionNoticeRspMsg'
	},
	CmdQueryUnionBarracksReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdQueryUnionBarracksReqMsg',
		type = 'message',
		name = 'CmdQueryUnionBarracksReqMsg'
	},
	CmdWorldObj_Key = 
	{
		tmField = 
		{
			worldObjId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'string',
				name = 'worldObjId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdWorldObj_Key',
		type = 'message',
		name = 'CmdWorldObj_Key'
	},
	CmdQueryHelpTroopRspMsg = 
	{
		tmField = 
		{
			troop = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'CmdTroop',
				name = 'troop'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdQueryHelpTroopRspMsg',
		type = 'message',
		name = 'CmdQueryHelpTroopRspMsg'
	},
	MessageActivity = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.MessageActivity',
		enums = 
		{
			CmdPanicBuy = 11506,
			CmdGrowthFundBuy = 11507,
			CmdBroPlayerActivity = 11504,
			CmdPlayerActivityList = 11502,
			CmdBroActivity = 11508,
			CmdActivityInfoList = 11501,
			CmdTakeActivityAward = 11503,
			CmdReSignActivity = 11505
		},
		type = 'enum',
		name = 'MessageActivity'
	},
	CmdKingFightRspMsg = 
	{
		tmField = 
		{
			result = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'bool',
				name = 'result'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdKingFightRspMsg',
		type = 'message',
		name = 'CmdKingFightRspMsg'
	},
	CmdTask = 
	{
		tmField = 
		{
			process = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'process'
			},
			refId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			},
			isComplete = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'bool',
				name = 'isComplete'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTask.CmdTask',
		type = 'message',
		name = 'CmdTask'
	},
	CmdDelPrivateChatReqMsg = 
	{
		tmField = 
		{
			targetPlayerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'targetPlayerId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChat.CmdDelPrivateChatReqMsg',
		type = 'message',
		name = 'CmdDelPrivateChatReqMsg'
	},
	CmdCoordinateContent = 
	{
		tmField = 
		{
			enumWorldObjType = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'EnumWorldObjType',
				name = 'enumWorldObjType'
			},
			pos = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'pos'
			},
			detail = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'bytes',
				name = 'detail'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdCoordinateContent',
		type = 'message',
		name = 'CmdCoordinateContent'
	},
	CmdRepatriateHelpTroopRspMsg = 
	{
		tmField = 
		{
			success = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'bool',
				name = 'success'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdRepatriateHelpTroopRspMsg',
		type = 'message',
		name = 'CmdRepatriateHelpTroopRspMsg'
	},
	CmdArmy = 
	{
		tmField = 
		{
			num = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'num'
			},
			refId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgArmy.CmdArmy',
		type = 'message',
		name = 'CmdArmy'
	},
	CmdGetCampReportReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGetCampReportReqMsg',
		type = 'message',
		name = 'CmdGetCampReportReqMsg'
	},
	CmdCheckCoordinateReqMsg = 
	{
		tmField = 
		{
			pos = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'pos'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdCheckCoordinateReqMsg',
		type = 'message',
		name = 'CmdCheckCoordinateReqMsg'
	},
	CmdDisbandUnionReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdDisbandUnionReqMsg',
		type = 'message',
		name = 'CmdDisbandUnionReqMsg'
	},
	CmdReSignActivityRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdReSignActivityRspMsg',
		type = 'message',
		name = 'CmdReSignActivityRspMsg'
	},
	CmdQueryBattleReqMsg = 
	{
		tmField = 
		{
			battleId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'string',
				name = 'battleId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.CmdQueryBattleReqMsg',
		type = 'message',
		name = 'CmdQueryBattleReqMsg'
	},
	CmdSevenDayTag = 
	{
		tmField = 
		{
			tlCmdSevenDayTagData = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdSevenDayTagData',
				name = 'tlCmdSevenDayTagData'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdSevenDayTag',
		type = 'message',
		name = 'CmdSevenDayTag'
	},
	CmdDelMailRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdDelMailRspMsg',
		type = 'message',
		name = 'CmdDelMailRspMsg'
	},
	CmdGetProduceQueueReqMsg = 
	{
		tmField = 
		{
			lotId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'lotId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdGetProduceQueueReqMsg',
		type = 'message',
		name = 'CmdGetProduceQueueReqMsg'
	},
	CmdPlayerCityDetail = 
	{
		tmField = 
		{
			name = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'string',
				name = 'name'
			},
			level = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'level'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdPlayerCityDetail',
		type = 'message',
		name = 'CmdPlayerCityDetail'
	},
	MessageItem = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.MessageItem',
		enums = 
		{
			CmdDeleteItem = 10502,
			CmdUseBuffBall = 10508,
			CmdUseHeroExpBall = 10506,
			CmdUsePacket = 10503,
			CmdBuyResource = 10509,
			CmdBuyItem = 10507,
			CmdGetAllItem = 10501,
			CmdOpenBagNum = 10505,
			CmdBroAppendChange = 10504
		},
		type = 'enum',
		name = 'MessageItem'
	},
	CmdBroMarchRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdBroMarchRspMsg',
		type = 'message',
		name = 'CmdBroMarchRspMsg'
	},
	CmdPlayer_Update = 
	{
		tmField = 
		{
			cmdCacheUpdateByField = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'CmdCacheUpdateByField',
				name = 'cmdCacheUpdateByField'
			},
			cmdPlayer = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'CmdPlayer',
				name = 'cmdPlayer'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdPlayer_Update',
		type = 'message',
		name = 'CmdPlayer_Update'
	},
	BattleProp = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.BattleProp',
		enums = 
		{
			BP_VAL_HEAL = 100011,
			BP_VAL_EXT_DMG = 100028,
			BP_RATE_CRIT_DMG = 100121,
			BP_RATE_ALL_UNIT_HP = 100110,
			BP_VAL_DMG = 100012,
			BP_RATE_ALL_DMG = 100119,
			BP_VAL_EXT_HP = 100029,
			BP_VAL_ZHI = 100002,
			BP_PROB_CRIT = 100144,
			BP_VAL_SU = 100006,
			BP_VAL_LI = 100001,
			BP_PROB_DODGE = 100145,
			BP_PROB_TOUGH = 100146,
			BP_RATE_ALL_ADVANTAGE = 100123,
			BP_RATE_REDUCE_CRIT_HURT = 100122,
			BP_PROB_HIT = 100143,
			BP_VAL_UNIT_AMOUNT = 100013,
			BP_RATE_ALL_UNIT_DMG = 100109,
			BP_RATE_ALL_REDUCE_HURT = 100120,
			BP_VAL_TONG = 100003,
			BP_RATE_MOVE = 100005
		},
		type = 'enum',
		name = 'BattleProp'
	},
	CmdHeroVeinUpgradeReqMsg = 
	{
		tmField = 
		{
			heroId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'heroId'
			},
			isAuto = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'bool',
				name = 'isAuto'
			},
			index = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'index'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroVeinUpgradeReqMsg',
		type = 'message',
		name = 'CmdHeroVeinUpgradeReqMsg'
	},
	CmdAppendRsp = 
	{
		tmField = 
		{
			tlCmdCacheUpdate = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdCacheUpdate',
				name = 'tlCmdCacheUpdate'
			},
			cmdError = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'CmdError',
				name = 'cmdError'
			},
			tlCmdReward = 
			{
				fieldNumber = 4,
				prefix = 'repeated',
				type = 'CmdReward',
				name = 'tlCmdReward'
			},
			cmdTips = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'CmdTips',
				name = 'cmdTips'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgAppend.CmdAppendRsp',
		type = 'message',
		name = 'CmdAppendRsp'
	},
	CmdQueryResourceGridRspMsg = 
	{
		tmField = 
		{
			hourlyOutput = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'hourlyOutput'
			},
			totalTime = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int64',
				name = 'totalTime'
			},
			playerName = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'string',
				name = 'playerName'
			},
			playerId = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'int32',
				name = 'playerId'
			},
			endTime = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int64',
				name = 'endTime'
			},
			totalLoad = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'totalLoad'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdQueryResourceGridRspMsg',
		type = 'message',
		name = 'CmdQueryResourceGridRspMsg'
	},
	CmdEquipBreakDownReqMsg = 
	{
		tmField = 
		{
			equipIds = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'int32',
				name = 'equipIds'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdEquipBreakDownReqMsg',
		type = 'message',
		name = 'CmdEquipBreakDownReqMsg'
	},
	CmdChangeProvinceReqMsg = 
	{
		tmField = 
		{
			provinceId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'provinceId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdChangeProvinceReqMsg',
		type = 'message',
		name = 'CmdChangeProvinceReqMsg'
	},
	CmdResetFubenRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgFuben.CmdResetFubenRspMsg',
		type = 'message',
		name = 'CmdResetFubenRspMsg'
	},
	CmdGetHasSendTimesReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCityBattle.CmdGetHasSendTimesReqMsg',
		type = 'message',
		name = 'CmdGetHasSendTimesReqMsg'
	},
	CmdTakeActiveTaskRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTask.CmdTakeActiveTaskRspMsg',
		type = 'message',
		name = 'CmdTakeActiveTaskRspMsg'
	},
	CmdDeclareBattleInfo_Key = 
	{
		tmField = 
		{
			isSelfDeclare = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'bool',
				name = 'isSelfDeclare'
			},
			targetPlayerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'targetPlayerId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdDeclareBattleInfo_Key',
		type = 'message',
		name = 'CmdDeclareBattleInfo_Key'
	},
	CmdNpcCity = 
	{
		tmField = 
		{
			cmdWorldObjOwnerInfo = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'CmdWorldObjOwnerInfo',
				name = 'cmdWorldObjOwnerInfo'
			},
			isFire = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'bool',
				name = 'isFire'
			},
			hasEnemy = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'bool',
				name = 'hasEnemy'
			},
			npcCityId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'npcCityId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdNpcCity',
		type = 'message',
		name = 'CmdNpcCity'
	},
	CmdHospitalProduceRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdHospitalProduceRspMsg',
		type = 'message',
		name = 'CmdHospitalProduceRspMsg'
	},
	CmdEnemyMarch = 
	{
		tmField = 
		{
			totalTime = 
			{
				fieldNumber = 10,
				prefix = 'required',
				type = 'int64',
				name = 'totalTime'
			},
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			armyCount = 
			{
				fieldNumber = 8,
				prefix = 'required',
				type = 'int32',
				name = 'armyCount'
			},
			toPos = 
			{
				fieldNumber = 7,
				prefix = 'required',
				type = 'int32',
				name = 'toPos'
			},
			commandingGeneralRefId = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'commandingGeneralRefId'
			},
			playerName = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'playerName'
			},
			heroLv = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int32',
				name = 'heroLv'
			},
			homePos = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'int32',
				name = 'homePos'
			},
			endTime = 
			{
				fieldNumber = 9,
				prefix = 'required',
				type = 'int64',
				name = 'endTime'
			},
			provinceId = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'provinceId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdEnemyMarch',
		type = 'message',
		name = 'CmdEnemyMarch'
	},
	CmdChangeUnionPositionReqMsg = 
	{
		tmField = 
		{
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			position = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'UnionPosition',
				name = 'position'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdChangeUnionPositionReqMsg',
		type = 'message',
		name = 'CmdChangeUnionPositionReqMsg'
	},
	CmdTakeFubenBoxReqMsg = 
	{
		tmField = 
		{
			chapterId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'chapterId'
			},
			index = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'index'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgFuben.CmdTakeFubenBoxReqMsg',
		type = 'message',
		name = 'CmdTakeFubenBoxReqMsg'
	},
	CmdMailBattleDetail = 
	{
		tmField = 
		{
			atkCommandingGenerateRefId = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'atkCommandingGenerateRefId'
			},
			isAtkWin = 
			{
				fieldNumber = 9,
				prefix = 'required',
				type = 'bool',
				name = 'isAtkWin'
			},
			defArmyCount = 
			{
				fieldNumber = 7,
				prefix = 'required',
				type = 'int32',
				name = 'defArmyCount'
			},
			atkCampId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'atkCampId'
			},
			atkArmyCount = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'atkArmyCount'
			},
			defPlayerInfo = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'CmdSimplePlayerInfo',
				name = 'defPlayerInfo'
			},
			atkPlayerInfo = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'CmdSimplePlayerInfo',
				name = 'atkPlayerInfo'
			},
			defCampId = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'int32',
				name = 'defCampId'
			},
			saveBattlePath = 
			{
				fieldNumber = 10,
				prefix = 'optional',
				type = 'string',
				name = 'saveBattlePath'
			},
			battleData = 
			{
				fieldNumber = 11,
				prefix = 'optional',
				type = 'bytes',
				name = 'battleData'
			},
			defCommandingGenerateRefId = 
			{
				fieldNumber = 8,
				prefix = 'required',
				type = 'int32',
				name = 'defCommandingGenerateRefId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdMailBattleDetail',
		type = 'message',
		name = 'CmdMailBattleDetail'
	},
	CmdReadMailRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdReadMailRspMsg',
		type = 'message',
		name = 'CmdReadMailRspMsg'
	},
	CmdUserGuideTask_Update = 
	{
		tmField = 
		{
			tlCmdUserGuideTask = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdUserGuideTask',
				name = 'tlCmdUserGuideTask'
			},
			tlCmdUserGuideTask_Key = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdUserGuideTask_Key',
				name = 'tlCmdUserGuideTask_Key'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUserGuideTask.CmdUserGuideTask_Update',
		type = 'message',
		name = 'CmdUserGuideTask_Update'
	},
	CmdDeclareBattleInfo = 
	{
		tmField = 
		{
			isSelfDeclare = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'bool',
				name = 'isSelfDeclare'
			},
			time = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int64',
				name = 'time'
			},
			targetPlayerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'targetPlayerId'
			},
			targetPlayerName = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'targetPlayerName'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdDeclareBattleInfo',
		type = 'message',
		name = 'CmdDeclareBattleInfo'
	},
	CmdKingFightReqMsg = 
	{
		tmField = 
		{
			index = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'index'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdKingFightReqMsg',
		type = 'message',
		name = 'CmdKingFightReqMsg'
	},
	CmdGetAllTroopReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdGetAllTroopReqMsg',
		type = 'message',
		name = 'CmdGetAllTroopReqMsg'
	},
	CmdBroAddMailRspMsg = 
	{
		tmField = 
		{
			cmdMail = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'CmdMail',
				name = 'cmdMail'
			},
			mailType = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'MailType',
				name = 'mailType'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdBroAddMailRspMsg',
		type = 'message',
		name = 'CmdBroAddMailRspMsg'
	},
	CmdCollectCoordinateRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdCollectCoordinateRspMsg',
		type = 'message',
		name = 'CmdCollectCoordinateRspMsg'
	},
	CmdPlayerCity = 
	{
		tmField = 
		{
			cmdWorldObjOwnerInfo = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'CmdWorldObjOwnerInfo',
				name = 'cmdWorldObjOwnerInfo'
			},
			hasEnemy = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'bool',
				name = 'hasEnemy'
			},
			pos = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'pos'
			},
			level = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'level'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdPlayerCity',
		type = 'message',
		name = 'CmdPlayerCity'
	},
	CmdRefreshSoulShopRspMsg = 
	{
		tmField = 
		{
			goods = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdSoulShopGoods',
				name = 'goods'
			},
			freeRefreshCount = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'freeRefreshCount'
			},
			yuanbaoRefreshCount = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'int32',
				name = 'yuanbaoRefreshCount'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChouka.CmdRefreshSoulShopRspMsg',
		type = 'message',
		name = 'CmdRefreshSoulShopRspMsg'
	},
	CmdGetAllCityInfoReqMsg = 
	{
		tmField = 
		{
			npcCityType = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'int32',
				name = 'npcCityType'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCityBattle.CmdGetAllCityInfoReqMsg',
		type = 'message',
		name = 'CmdGetAllCityInfoReqMsg'
	},
	CmdGetOfficeListReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGetOfficeListReqMsg',
		type = 'message',
		name = 'CmdGetOfficeListReqMsg'
	},
	CmdArmy_Update = 
	{
		tmField = 
		{
			cmdArmy_Key = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdArmy_Key',
				name = 'cmdArmy_Key'
			},
			cmdArmy = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdArmy',
				name = 'cmdArmy'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgArmy.CmdArmy_Update',
		type = 'message',
		name = 'CmdArmy_Update'
	},
	CmdNpcResourceSpyDetail = 
	{
		tmField = 
		{
			gridLandForm = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'GridLandForm',
				name = 'gridLandForm'
			},
			level = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'int32',
				name = 'level'
			},
			army = 
			{
				fieldNumber = 4,
				prefix = 'repeated',
				type = 'CmdReward',
				name = 'army'
			},
			y = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'y'
			},
			x = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'x'
			},
			heroRefIdAndLvs = 
			{
				fieldNumber = 3,
				prefix = 'repeated',
				type = 'int32',
				name = 'heroRefIdAndLvs'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdNpcResourceSpyDetail',
		type = 'message',
		name = 'CmdNpcResourceSpyDetail'
	},
	CmdSendCityRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCityBattle.CmdSendCityRspMsg',
		type = 'message',
		name = 'CmdSendCityRspMsg'
	},
	CmdEquipExchangeReqMsg = 
	{
		tmField = 
		{
			targetHeroId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'targetHeroId'
			},
			equipId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'equipId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdEquipExchangeReqMsg',
		type = 'message',
		name = 'CmdEquipExchangeReqMsg'
	},
	CmdQueryBattleFieldRspMsg = 
	{
		tmField = 
		{
			battle = 
			{
				fieldNumber = 4,
				prefix = 'repeated',
				type = 'CmdBattleFieldBattle',
				name = 'battle'
			},
			nextBattleTime = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int64',
				name = 'nextBattleTime'
			},
			neutTroop = 
			{
				fieldNumber = 3,
				prefix = 'repeated',
				type = 'CmdBattleFieldTroop',
				name = 'neutTroop'
			},
			atkTroop = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdBattleFieldTroop',
				name = 'atkTroop'
			},
			defTroop = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdBattleFieldTroop',
				name = 'defTroop'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdQueryBattleFieldRspMsg',
		type = 'message',
		name = 'CmdQueryBattleFieldRspMsg'
	},
	TargetSelectType = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.TargetSelectType',
		enums = 
		{
			BTST_DI_QUAN = 4,
			BTST_DI_SHU = 3,
			BTST_DI_RANDOM_2 = 12,
			BTST_DI_HENG = 2,
			BTST_DI_RANDOM_1 = 11,
			BTST_DI_DAN = 1
		},
		type = 'enum',
		name = 'TargetSelectType'
	},
	MessageUnion = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.MessageUnion',
		enums = 
		{
			CmdDisbandUnion = 11603,
			CmdQueryUnionBarracks = 11622,
			CmdBroUnionNotice = 11616,
			CmdBuyUnionArmy = 11613,
			CmdHandleUnionApplication = 11609,
			CmdAcceptUnionCallup = 11615,
			CmdBuildUnionHall = 11607,
			CmdListUnionApplications = 11617,
			CmdQuitUnion = 11604,
			CmdKickOutUnionMember = 11610,
			CmdChangeUnionPosition = 11606,
			CmdListUnionMemberStatus = 11620,
			CmdUpgradeUnionTech = 11612,
			CmdApplyToJoinUnion = 11602,
			CmdQueryUnionTeches = 11621,
			CmdCancelUnionApplication = 11618,
			CmdSendUnionMail = 11611,
			CmdQueryUnionInfo = 11619,
			CmdCreateUnion = 11601,
			CmdListUnions = 11605,
			CmdEditUnion = 11608,
			CmdQueryUnionCallup = 11623,
			CmdPublishUnionCallup = 11614
		},
		type = 'enum',
		name = 'MessageUnion'
	},
	CmdAbandonInjuryArmyReqMsg = 
	{
		tmField = 
		{
			tlCmdArmy = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdArmy',
				name = 'tlCmdArmy'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdAbandonInjuryArmyReqMsg',
		type = 'message',
		name = 'CmdAbandonInjuryArmyReqMsg'
	},
	CmdSevenDayPlayerStatus = 
	{
		tmField = 
		{
			tlCmdSevenDayPlayerStatusData = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdSevenDayPlayerStatusData',
				name = 'tlCmdSevenDayPlayerStatusData'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdSevenDayPlayerStatus',
		type = 'message',
		name = 'CmdSevenDayPlayerStatus'
	},
	CmdHero_Update = 
	{
		tmField = 
		{
			cmdHero_Key = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdHero_Key',
				name = 'cmdHero_Key'
			},
			cmdHero = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdHero',
				name = 'cmdHero'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHero_Update',
		type = 'message',
		name = 'CmdHero_Update'
	},
	CmdBroBattleFieldEventRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdBroBattleFieldEventRspMsg',
		type = 'message',
		name = 'CmdBroBattleFieldEventRspMsg'
	},
	CmdUnShieldPlayerRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdUnShieldPlayerRspMsg',
		type = 'message',
		name = 'CmdUnShieldPlayerRspMsg'
	},
	CmdGetFubenInfoRspMsg = 
	{
		tmField = 
		{
			chapterId = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'chapterId'
			},
			fubenId = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'fubenId'
			},
			cmdFubenBox = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdFubenBox',
				name = 'cmdFubenBox'
			},
			cmdFuben = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdFuben',
				name = 'cmdFuben'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgFuben.CmdGetFubenInfoRspMsg',
		type = 'message',
		name = 'CmdGetFubenInfoRspMsg'
	},
	CmdLogoutRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdLogoutRspMsg',
		type = 'message',
		name = 'CmdLogoutRspMsg'
	},
	CmdCreateUnionReqMsg = 
	{
		tmField = 
		{
			name = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'string',
				name = 'name'
			},
			declaration = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'declaration'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdCreateUnionReqMsg',
		type = 'message',
		name = 'CmdCreateUnionReqMsg'
	},
	HeroEquipXilianType = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.HeroEquipXilianType',
		enums = 
		{
			CURRENT_SECONDPROPERTY = 1,
			NEW_SECONDPROPERTY = 2
		},
		type = 'enum',
		name = 'HeroEquipXilianType'
	},
	CmdBuyVipBagRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdBuyVipBagRspMsg',
		type = 'message',
		name = 'CmdBuyVipBagRspMsg'
	},
	CmdDelPrivateChatRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChat.CmdDelPrivateChatRspMsg',
		type = 'message',
		name = 'CmdDelPrivateChatRspMsg'
	},
	UnionApplicationStatus = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.UnionApplicationStatus',
		enums = 
		{
			UAS_CANCEL = 2,
			UAS_APPLYING = 1,
			UAS_REFUSED = 3
		},
		type = 'enum',
		name = 'UnionApplicationStatus'
	},
	CmdUseBuffBallReqMsg = 
	{
		tmField = 
		{
			num = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'num'
			},
			id = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'id'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdUseBuffBallReqMsg',
		type = 'message',
		name = 'CmdUseBuffBallReqMsg'
	},
	CmdSevenDayTagData = 
	{
		tmField = 
		{
			tagId = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'int32',
				name = 'tagId'
			},
			day = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int32',
				name = 'day'
			},
			name = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'string',
				name = 'name'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdSevenDayTagData',
		type = 'message',
		name = 'CmdSevenDayTagData'
	},
	CmdRegisterPlayerRspMsg = 
	{
		tmField = 
		{
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgLogin.CmdRegisterPlayerRspMsg',
		type = 'message',
		name = 'CmdRegisterPlayerRspMsg'
	},
	CmdEditTroopRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdEditTroopRspMsg',
		type = 'message',
		name = 'CmdEditTroopRspMsg'
	},
	CmdCancelEquipXilianReqMsg = 
	{
		tmField = 
		{
			index = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'int32',
				name = 'index'
			},
			equipId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'equipId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdCancelEquipXilianReqMsg',
		type = 'message',
		name = 'CmdCancelEquipXilianReqMsg'
	},
	CmdGetShieldPlayerReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdGetShieldPlayerReqMsg',
		type = 'message',
		name = 'CmdGetShieldPlayerReqMsg'
	},
	CmdShieldPlayerReqMsg = 
	{
		tmField = 
		{
			targetPlayerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'targetPlayerId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdShieldPlayerReqMsg',
		type = 'message',
		name = 'CmdShieldPlayerReqMsg'
	},
	CmdGrantCityReqMsg = 
	{
		tmField = 
		{
			y = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'y'
			},
			x = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'x'
			},
			targetPlayerId = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'targetPlayerId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCityBattle.CmdGrantCityReqMsg',
		type = 'message',
		name = 'CmdGrantCityReqMsg'
	},
	CmdPlayerRenameRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdPlayerRenameRspMsg',
		type = 'message',
		name = 'CmdPlayerRenameRspMsg'
	},
	CmdHeroVeinUpgradeRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroVeinUpgradeRspMsg',
		type = 'message',
		name = 'CmdHeroVeinUpgradeRspMsg'
	},
	CmdYinChoukaReqMsg = 
	{
		tmField = 
		{
			tenChou = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'bool',
				name = 'tenChou'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChouka.CmdYinChoukaReqMsg',
		type = 'message',
		name = 'CmdYinChoukaReqMsg'
	},
	CmdTestBattleRspMsg = 
	{
		tmField = 
		{
			battle = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'CmdBattle',
				name = 'battle'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.CmdTestBattleRspMsg',
		type = 'message',
		name = 'CmdTestBattleRspMsg'
	},
	CmdMoveCityReqMsg = 
	{
		tmField = 
		{
			targetPos = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'targetPos'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdMoveCityReqMsg',
		type = 'message',
		name = 'CmdMoveCityReqMsg'
	},
	CmdQueryAlliedTroopOnResourceGridRspMsg = 
	{
		tmField = 
		{
			cmdTroop = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'CmdTroop',
				name = 'cmdTroop'
			},
			cmdHero = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdHero',
				name = 'cmdHero'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdQueryAlliedTroopOnResourceGridRspMsg',
		type = 'message',
		name = 'CmdQueryAlliedTroopOnResourceGridRspMsg'
	},
	CmdSevenDayRechargeCondition = 
	{
		tmField = 
		{
			day = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'int32',
				name = 'day'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdSevenDayRechargeCondition',
		type = 'message',
		name = 'CmdSevenDayRechargeCondition'
	},
	CmdHeroEquip_Key = 
	{
		tmField = 
		{
			equipId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'equipId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroEquip_Key',
		type = 'message',
		name = 'CmdHeroEquip_Key'
	},
	CmdFuben = 
	{
		tmField = 
		{
			chapterId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'chapterId'
			},
			fubenId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'fubenId'
			},
			star = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'star'
			},
			dayResetNum = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'int32',
				name = 'dayResetNum'
			},
			dayAttackNum = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'int32',
				name = 'dayAttackNum'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgFuben.CmdFuben',
		type = 'message',
		name = 'CmdFuben'
	},
	CmdHeroEquip_Update = 
	{
		tmField = 
		{
			cmdHeroEquip = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdHeroEquip',
				name = 'cmdHeroEquip'
			},
			cmdHeroEquip_Key = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdHeroEquip_Key',
				name = 'cmdHeroEquip_Key'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroEquip_Update',
		type = 'message',
		name = 'CmdHeroEquip_Update'
	},
	MarchType = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.MarchType',
		enums = 
		{
			MT_NPC_CITY = 2,
			MT_DEFAULT = 4,
			MT_COLLECT = 1,
			MT_PLAYER_CITY = 3
		},
		type = 'enum',
		name = 'MarchType'
	},
	CmdResourceExtraInfo = 
	{
		tmField = 
		{
			costNum = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'int32',
				name = 'costNum'
			},
			capacity = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'int32',
				name = 'capacity'
			},
			produceNum = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int32',
				name = 'produceNum'
			},
			buyNum = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'int32',
				name = 'buyNum'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdResourceExtraInfo',
		type = 'message',
		name = 'CmdResourceExtraInfo'
	},
	CmdQueryUnionTechesReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdQueryUnionTechesReqMsg',
		type = 'message',
		name = 'CmdQueryUnionTechesReqMsg'
	},
	CmdBuyItemRspMsg = 
	{
		tmField = 
		{
			endTime = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'int64',
				name = 'endTime'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdBuyItemRspMsg',
		type = 'message',
		name = 'CmdBuyItemRspMsg'
	},
	CmdCreateUnionRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdCreateUnionRspMsg',
		type = 'message',
		name = 'CmdCreateUnionRspMsg'
	},
	CmdLogoutReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdLogoutReqMsg',
		type = 'message',
		name = 'CmdLogoutReqMsg'
	},
	CmdLoginReqMsg = 
	{
		tmField = 
		{
			openId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'openId'
			},
			ver = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'int32',
				name = 'ver'
			},
			channelSimpleName = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'string',
				name = 'channelSimpleName'
			},
			imei = 
			{
				fieldNumber = 7,
				prefix = 'required',
				type = 'string',
				name = 'imei'
			},
			timestamp = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'string',
				name = 'timestamp'
			},
			userType = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'userType'
			},
			sdkType = 
			{
				fieldNumber = 8,
				prefix = 'optional',
				type = 'int32',
				name = 'sdkType'
			},
			ip = 
			{
				fieldNumber = 10,
				prefix = 'optional',
				type = 'string',
				name = 'ip'
			},
			serverSign = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'string',
				name = 'serverSign'
			},
			serverId = 
			{
				fieldNumber = 9,
				prefix = 'required',
				type = 'int32',
				name = 'serverId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgLogin.CmdLoginReqMsg',
		type = 'message',
		name = 'CmdLoginReqMsg'
	},
	CmdExchangeHeroReqMsg = 
	{
		tmField = 
		{
			heroId = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'int32',
				name = 'heroId'
			},
			targetHeroId = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int32',
				name = 'targetHeroId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdExchangeHeroReqMsg',
		type = 'message',
		name = 'CmdExchangeHeroReqMsg'
	},
	CmdSendUnionMailRspMsg = 
	{
		tmField = 
		{
			success = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'bool',
				name = 'success'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdSendUnionMailRspMsg',
		type = 'message',
		name = 'CmdSendUnionMailRspMsg'
	},
	CmdFightFubenReqMsg = 
	{
		tmField = 
		{
			troopId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'troopId'
			},
			fubenId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'fubenId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgFuben.CmdFightFubenReqMsg',
		type = 'message',
		name = 'CmdFightFubenReqMsg'
	},
	CmdQueryUnionTechesRspMsg = 
	{
		tmField = 
		{
			tech = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdTech',
				name = 'tech'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdQueryUnionTechesRspMsg',
		type = 'message',
		name = 'CmdQueryUnionTechesRspMsg'
	},
	CmdSoulShopGoods = 
	{
		tmField = 
		{
			goodsNum = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'goodsNum'
			},
			price = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int32',
				name = 'price'
			},
			refId = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			},
			goodsId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'goodsId'
			},
			soldOut = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'bool',
				name = 'soldOut'
			},
			goodsType = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'goodsType'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChouka.CmdSoulShopGoods',
		type = 'message',
		name = 'CmdSoulShopGoods'
	},
	CmdKingBetReqMsg = 
	{
		tmField = 
		{
			coinIndex = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'coinIndex'
			},
			index = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'index'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdKingBetReqMsg',
		type = 'message',
		name = 'CmdKingBetReqMsg'
	},
	CmdEquipXilianRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdEquipXilianRspMsg',
		type = 'message',
		name = 'CmdEquipXilianRspMsg'
	},
	CmdGetCampPlayerReportReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGetCampPlayerReportReqMsg',
		type = 'message',
		name = 'CmdGetCampPlayerReportReqMsg'
	},
	CmdTakeFubenBoxRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgFuben.CmdTakeFubenBoxRspMsg',
		type = 'message',
		name = 'CmdTakeFubenBoxRspMsg'
	},
	MessageLogin = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgLogin.MessageLogin',
		enums = 
		{
			CmdRegisterPlayer = 10002,
			CmdLogin = 10001
		},
		type = 'enum',
		name = 'MessageLogin'
	},
	CmdBattle = 
	{
		tmField = 
		{
			savePath = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'string',
				name = 'savePath'
			},
			bout = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdBattleBout',
				name = 'bout'
			},
			settlement = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'CmdBattleSettlement',
				name = 'settlement'
			},
			troop = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdTroop',
				name = 'troop'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.CmdBattle',
		type = 'message',
		name = 'CmdBattle'
	},
	CmdCacheUpdateByField = 
	{
		tmField = 
		{
			tlCmdCacheUpdateField = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdCacheUpdateField',
				name = 'tlCmdCacheUpdateField'
			},
			cmdX_Key = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'bytes',
				name = 'cmdX_Key'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCommon.CmdCacheUpdateByField',
		type = 'message',
		name = 'CmdCacheUpdateByField'
	},
	CmdSpeedUpRecallRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdSpeedUpRecallRspMsg',
		type = 'message',
		name = 'CmdSpeedUpRecallRspMsg'
	},
	MailSubType = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCommon.MailSubType',
		enums = 
		{
			PvpBattleAttacker = 2,
			PlayerSpy = 5,
			Union = 8,
			NpcResourceSpy = 7,
			System = 0,
			PvpBattleHelper = 3,
			ResourceBattle = 4,
			PvpBattleOwner = 1,
			PlayerResourceSpy = 6
		},
		type = 'enum',
		name = 'MailSubType'
	},
	CmdTask_Update = 
	{
		tmField = 
		{
			cmdTask = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdTask',
				name = 'cmdTask'
			},
			cmdTask_Key = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdTask_Key',
				name = 'cmdTask_Key'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTask.CmdTask_Update',
		type = 'message',
		name = 'CmdTask_Update'
	},
	CmdCampShopInfo = 
	{
		tmField = 
		{
			tlCmdCampShopNumData = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdCampShopNumData',
				name = 'tlCmdCampShopNumData'
			},
			refreshTime = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int64',
				name = 'refreshTime'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdCampShopInfo',
		type = 'message',
		name = 'CmdCampShopInfo'
	},
	CmdSendChatRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChat.CmdSendChatRspMsg',
		type = 'message',
		name = 'CmdSendChatRspMsg'
	},
	CmdExtraInfoBarrack = 
	{
		tmField = 
		{
			tlCmdArmyProduction = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdArmyProduction',
				name = 'tlCmdArmyProduction'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdExtraInfoBarrack',
		type = 'message',
		name = 'CmdExtraInfoBarrack'
	},
	CmdGetEnemyMarchRspMsg = 
	{
		tmField = 
		{
			tlCmdEnemyMarch = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdEnemyMarch',
				name = 'tlCmdEnemyMarch'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdGetEnemyMarchRspMsg',
		type = 'message',
		name = 'CmdGetEnemyMarchRspMsg'
	},
	CmdListUnionsRspMsg = 
	{
		tmField = 
		{
			union = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdUnion',
				name = 'union'
			},
			appliedUnionId = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'int32',
				name = 'appliedUnionId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdListUnionsRspMsg',
		type = 'message',
		name = 'CmdListUnionsRspMsg'
	},
	CmdPlayerClashOfKingsExtraInfo = 
	{
		tmField = 
		{
			tlCmdPlayerLimitLeaderBoardData = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'CmdPlayerLimitLeaderBoardData',
				name = 'tlCmdPlayerLimitLeaderBoardData'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdPlayerClashOfKingsExtraInfo',
		type = 'message',
		name = 'CmdPlayerClashOfKingsExtraInfo'
	},
	CmdHospitalProduction = 
	{
		tmField = 
		{
			tlCmdArmy = 
			{
				fieldNumber = 4,
				prefix = 'repeated',
				type = 'CmdArmy',
				name = 'tlCmdArmy'
			},
			endTime = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int64',
				name = 'endTime'
			},
			id = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'id'
			},
			startTime = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int64',
				name = 'startTime'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdHospitalProduction',
		type = 'message',
		name = 'CmdHospitalProduction'
	},
	ActiveTaskType = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTask.ActiveTaskType',
		enums = 
		{
			Active_MakeArmy = 5,
			Active_ChouKa = 1,
			Active_CollectResource = 3,
			Active_OccupyNpc = 7,
			Active_Fuben = 2,
			Active_Tech = 8,
			Active_CuteArmy = 4,
			Active_BuildUpgrade = 6
		},
		type = 'enum',
		name = 'ActiveTaskType'
	},
	CmdChat = 
	{
		tmField = 
		{
			juntuanName = 
			{
				fieldNumber = 7,
				prefix = 'optional',
				type = 'string',
				name = 'juntuanName'
			},
			playerCountryId = 
			{
				fieldNumber = 8,
				prefix = 'optional',
				type = 'int32',
				name = 'playerCountryId'
			},
			playerName = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'string',
				name = 'playerName'
			},
			receivePlayerName = 
			{
				fieldNumber = 11,
				prefix = 'optional',
				type = 'string',
				name = 'receivePlayerName'
			},
			isRead = 
			{
				fieldNumber = 12,
				prefix = 'optional',
				type = 'bool',
				name = 'isRead'
			},
			imageId = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'string',
				name = 'imageId'
			},
			chatKind = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'ChatKind',
				name = 'chatKind'
			},
			msg = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'string',
				name = 'msg'
			},
			sendPlayerId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'sendPlayerId'
			},
			receivePlayerId = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'int32',
				name = 'receivePlayerId'
			},
			expandMsg = 
			{
				fieldNumber = 10,
				prefix = 'optional',
				type = 'string',
				name = 'expandMsg'
			},
			createTime = 
			{
				fieldNumber = 9,
				prefix = 'optional',
				type = 'int64',
				name = 'createTime'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChat.CmdChat',
		type = 'message',
		name = 'CmdChat'
	},
	CmdBattleBout = 
	{
		tmField = 
		{
			round = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdBattleRound',
				name = 'round'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.CmdBattleBout',
		type = 'message',
		name = 'CmdBattleBout'
	},
	CmdBuyResourceRspMsg = 
	{
		tmField = 
		{
			crit = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'int32',
				name = 'crit'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdBuyResourceRspMsg',
		type = 'message',
		name = 'CmdBuyResourceRspMsg'
	},
	CmdHeroVeinTupoRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroVeinTupoRspMsg',
		type = 'message',
		name = 'CmdHeroVeinTupoRspMsg'
	},
	CmdListUnionMemberStatusReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdListUnionMemberStatusReqMsg',
		type = 'message',
		name = 'CmdListUnionMemberStatusReqMsg'
	},
	CmdSevenDayTaskRefData = 
	{
		tmField = 
		{
			openId = 
			{
				fieldNumber = 12,
				prefix = 'optional',
				type = 'int32',
				name = 'openId'
			},
			title = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'string',
				name = 'title'
			},
			nums = 
			{
				fieldNumber = 10,
				prefix = 'optional',
				type = 'int32',
				name = 'nums'
			},
			detail = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'string',
				name = 'detail'
			},
			day = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'int32',
				name = 'day'
			},
			tag = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'int32',
				name = 'tag'
			},
			param2 = 
			{
				fieldNumber = 8,
				prefix = 'optional',
				type = 'int32',
				name = 'param2'
			},
			param1 = 
			{
				fieldNumber = 7,
				prefix = 'optional',
				type = 'int32',
				name = 'param1'
			},
			rewardList = 
			{
				fieldNumber = 9,
				prefix = 'repeated',
				type = 'CmdReward',
				name = 'rewardList'
			},
			type = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'int32',
				name = 'type'
			},
			id = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'int32',
				name = 'id'
			},
			viewGoto = 
			{
				fieldNumber = 11,
				prefix = 'optional',
				type = 'string',
				name = 'viewGoto'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdSevenDayTaskRefData',
		type = 'message',
		name = 'CmdSevenDayTaskRefData'
	},
	CmdBuildQueue = 
	{
		tmField = 
		{
			charge = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'bool',
				name = 'charge'
			},
			lotId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'lotId'
			},
			startTime = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int64',
				name = 'startTime'
			},
			endTime = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int64',
				name = 'endTime'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuildQueue',
		type = 'message',
		name = 'CmdBuildQueue'
	},
	BattleBuffType = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.BattleBuffType',
		enums = 
		{
			BBT_YUN_XUAN = 1,
			BBT_ZHONG_DU = 3,
			BBT_ZHUO_SHAO = 2,
			BBT_TIE_JI = 5,
			BBT_FAN_JI_XIU_ZHENG = 1001,
			BBT_LIAN_JI_XIU_ZHENG = 1002,
			BBT_QING_GUO = 6,
			BBT_LIU_XUE = 4
		},
		type = 'enum',
		name = 'BattleBuffType'
	},
	CmdCacheUpdate = 
	{
		tmField = 
		{
			data = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'bytes',
				name = 'data'
			},
			enumCacheName = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'EnumCacheName',
				name = 'enumCacheName'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgAppend.CmdCacheUpdate',
		type = 'message',
		name = 'CmdCacheUpdate'
	},
	CmdTakeActiveTaskReqMsg = 
	{
		tmField = 
		{
			refId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTask.CmdTakeActiveTaskReqMsg',
		type = 'message',
		name = 'CmdTakeActiveTaskReqMsg'
	},
	CmdUnion = 
	{
		tmField = 
		{
			callupX = 
			{
				fieldNumber = 13,
				prefix = 'optional',
				type = 'int32',
				name = 'callupX'
			},
			callupY = 
			{
				fieldNumber = 14,
				prefix = 'optional',
				type = 'int32',
				name = 'callupY'
			},
			leaderName = 
			{
				fieldNumber = 8,
				prefix = 'optional',
				type = 'string',
				name = 'leaderName'
			},
			name = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'string',
				name = 'name'
			},
			level = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'int32',
				name = 'level'
			},
			memberCount = 
			{
				fieldNumber = 7,
				prefix = 'optional',
				type = 'int32',
				name = 'memberCount'
			},
			material = 
			{
				fieldNumber = 10,
				prefix = 'optional',
				type = 'int32',
				name = 'material'
			},
			callupStartTime = 
			{
				fieldNumber = 15,
				prefix = 'optional',
				type = 'int64',
				name = 'callupStartTime'
			},
			campId = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'int32',
				name = 'campId'
			},
			hallBuildPoint = 
			{
				fieldNumber = 9,
				prefix = 'optional',
				type = 'int32',
				name = 'hallBuildPoint'
			},
			declaration = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'string',
				name = 'declaration'
			},
			leaderId = 
			{
				fieldNumber = 11,
				prefix = 'optional',
				type = 'int32',
				name = 'leaderId'
			},
			leaderProvinceId = 
			{
				fieldNumber = 12,
				prefix = 'optional',
				type = 'int32',
				name = 'leaderProvinceId'
			},
			id = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'id'
			},
			icon = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'int32',
				name = 'icon'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdUnion',
		type = 'message',
		name = 'CmdUnion'
	},
	CmdCityExpandReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdCityExpandReqMsg',
		type = 'message',
		name = 'CmdCityExpandReqMsg'
	},
	CmdHandleUnionApplicationReqMsg = 
	{
		tmField = 
		{
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			pass = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'bool',
				name = 'pass'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdHandleUnionApplicationReqMsg',
		type = 'message',
		name = 'CmdHandleUnionApplicationReqMsg'
	},
	CmdUsePacketRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdUsePacketRspMsg',
		type = 'message',
		name = 'CmdUsePacketRspMsg'
	},
	CmdNeutCityDetail = 
	{
		tmField = 
		{
			cityType = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'NpcCityType',
				name = 'cityType'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdNeutCityDetail',
		type = 'message',
		name = 'CmdNeutCityDetail'
	},
	CmdBroCampBattleRankInfoRspMsg = 
	{
		tmField = 
		{
			cmdIndexRankInfo = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'CmdIndexRankInfo',
				name = 'cmdIndexRankInfo'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdBroCampBattleRankInfoRspMsg',
		type = 'message',
		name = 'CmdBroCampBattleRankInfoRspMsg'
	},
	CmdActivity = 
	{
		tmField = 
		{
			awardStartTime = 
			{
				fieldNumber = 11,
				prefix = 'optional',
				type = 'int64',
				name = 'awardStartTime'
			},
			activityTag = 
			{
				fieldNumber = 13,
				prefix = 'repeated',
				type = 'CmdActivityTag',
				name = 'activityTag'
			},
			openTime = 
			{
				fieldNumber = 7,
				prefix = 'optional',
				type = 'int64',
				name = 'openTime'
			},
			headTitle = 
			{
				fieldNumber = 14,
				prefix = 'optional',
				type = 'string',
				name = 'headTitle'
			},
			description = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'string',
				name = 'description'
			},
			title = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'string',
				name = 'title'
			},
			image = 
			{
				fieldNumber = 16,
				prefix = 'optional',
				type = 'string',
				name = 'image'
			},
			extraInfo = 
			{
				fieldNumber = 17,
				prefix = 'optional',
				type = 'bytes',
				name = 'extraInfo'
			},
			closeTime = 
			{
				fieldNumber = 8,
				prefix = 'optional',
				type = 'int64',
				name = 'closeTime'
			},
			activityKind = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'ActivityKind',
				name = 'activityKind'
			},
			activityId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'activityId'
			},
			startTime = 
			{
				fieldNumber = 9,
				prefix = 'optional',
				type = 'int64',
				name = 'startTime'
			},
			awardEndTime = 
			{
				fieldNumber = 12,
				prefix = 'optional',
				type = 'int64',
				name = 'awardEndTime'
			},
			endTime = 
			{
				fieldNumber = 10,
				prefix = 'optional',
				type = 'int64',
				name = 'endTime'
			},
			open = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'bool',
				name = 'open'
			},
			order = 
			{
				fieldNumber = 15,
				prefix = 'optional',
				type = 'int32',
				name = 'order'
			},
			name = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'name'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdActivity',
		type = 'message',
		name = 'CmdActivity'
	},
	CmdAcceptCampTaskRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdAcceptCampTaskRspMsg',
		type = 'message',
		name = 'CmdAcceptCampTaskRspMsg'
	},
	CmdEditUnionRspMsg = 
	{
		tmField = 
		{
			success = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'bool',
				name = 'success'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdEditUnionRspMsg',
		type = 'message',
		name = 'CmdEditUnionRspMsg'
	},
	CmdTech_Update = 
	{
		tmField = 
		{
			cmdTech_Key = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdTech_Key',
				name = 'cmdTech_Key'
			},
			cmdTech = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdTech',
				name = 'cmdTech'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTech.CmdTech_Update',
		type = 'message',
		name = 'CmdTech_Update'
	},
	CmdActiveTask = 
	{
		tmField = 
		{
			isTake = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'bool',
				name = 'isTake'
			},
			isComplete = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'bool',
				name = 'isComplete'
			},
			refId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			},
			times = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'times'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTask.CmdActiveTask',
		type = 'message',
		name = 'CmdActiveTask'
	},
	CmdEditCampTroopRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdEditCampTroopRspMsg',
		type = 'message',
		name = 'CmdEditCampTroopRspMsg'
	},
	CmdResourceDetail = 
	{
		tmField = 
		{
			gridLandForm = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'GridLandForm',
				name = 'gridLandForm'
			},
			level = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'level'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdResourceDetail',
		type = 'message',
		name = 'CmdResourceDetail'
	},
	CmdEditTroopReqMsg = 
	{
		tmField = 
		{
			troopId = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int32',
				name = 'troopId'
			},
			heroId = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'int32',
				name = 'heroId'
			},
			type = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'int32',
				name = 'type'
			},
			index = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'int32',
				name = 'index'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdEditTroopReqMsg',
		type = 'message',
		name = 'CmdEditTroopReqMsg'
	},
	CmdMarch = 
	{
		tmField = 
		{
			status = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'MarchStatus',
				name = 'status'
			},
			totalTime = 
			{
				fieldNumber = 8,
				prefix = 'required',
				type = 'int64',
				name = 'totalTime'
			},
			toX = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'int32',
				name = 'toX'
			},
			toY = 
			{
				fieldNumber = 7,
				prefix = 'required',
				type = 'int32',
				name = 'toY'
			},
			troopId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int64',
				name = 'troopId'
			},
			fromY = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int32',
				name = 'fromY'
			},
			mark = 
			{
				fieldNumber = 10,
				prefix = 'optional',
				type = 'MarchMark',
				name = 'mark'
			},
			captainRefId = 
			{
				fieldNumber = 11,
				prefix = 'required',
				type = 'int32',
				name = 'captainRefId'
			},
			endTime = 
			{
				fieldNumber = 9,
				prefix = 'required',
				type = 'int64',
				name = 'endTime'
			},
			type = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'MarchType',
				name = 'type'
			},
			fromX = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'fromX'
			},
			playerId = 
			{
				fieldNumber = 12,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdMarch',
		type = 'message',
		name = 'CmdMarch'
	},
	CmdRaidsFubenRspMsg = 
	{
		tmField = 
		{
			tlCmdBattleReward = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'CmdBattleReward',
				name = 'tlCmdBattleReward'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgFuben.CmdRaidsFubenRspMsg',
		type = 'message',
		name = 'CmdRaidsFubenRspMsg'
	},
	CmdPlayerLimitLeaderBoardData = 
	{
		tmField = 
		{
			kind = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'ActivityLeaderBoardSubKind',
				name = 'kind'
			},
			rank = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'rank'
			},
			value = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'value'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdPlayerLimitLeaderBoardData',
		type = 'message',
		name = 'CmdPlayerLimitLeaderBoardData'
	},
	CmdMoveCityRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdMoveCityRspMsg',
		type = 'message',
		name = 'CmdMoveCityRspMsg'
	},
	CmdSearchCampMemberRspMsg = 
	{
		tmField = 
		{
			tlCmdSearchMemberInfo = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdSearchMemberInfo',
				name = 'tlCmdSearchMemberInfo'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdSearchCampMemberRspMsg',
		type = 'message',
		name = 'CmdSearchCampMemberRspMsg'
	},
	CmdKickOutUnionMemberReqMsg = 
	{
		tmField = 
		{
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdKickOutUnionMemberReqMsg',
		type = 'message',
		name = 'CmdKickOutUnionMemberReqMsg'
	},
	CmdExtraInfoHospital = 
	{
		tmField = 
		{
			tlCmdHospitalProduction = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdHospitalProduction',
				name = 'tlCmdHospitalProduction'
			},
			queueNum = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int32',
				name = 'queueNum'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdExtraInfoHospital',
		type = 'message',
		name = 'CmdExtraInfoHospital'
	},
	CmdListUnionMemberStatusRspMsg = 
	{
		tmField = 
		{
			status = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdUnionMemberStatus',
				name = 'status'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdListUnionMemberStatusRspMsg',
		type = 'message',
		name = 'CmdListUnionMemberStatusRspMsg'
	},
	CmdClashOfKingsTag = 
	{
		tmField = 
		{
			tlCmdLimitLeaderBoardRewardData = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdLimitLeaderBoardRewardData',
				name = 'tlCmdLimitLeaderBoardRewardData'
			},
			tlCmdLimitLeaderBoardRankData = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdLimitLeaderBoardRankData',
				name = 'tlCmdLimitLeaderBoardRankData'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdClashOfKingsTag',
		type = 'message',
		name = 'CmdClashOfKingsTag'
	},
	CmdBattleEvent = 
	{
		tmField = 
		{
			healValue = 
			{
				fieldNumber = 33,
				prefix = 'optional',
				type = 'int64',
				name = 'healValue'
			},
			attackHitAnima = 
			{
				fieldNumber = 13,
				prefix = 'repeated',
				type = 'CmdHitAnima',
				name = 'attackHitAnima'
			},
			recoverAmount = 
			{
				fieldNumber = 32,
				prefix = 'optional',
				type = 'int32',
				name = 'recoverAmount'
			},
			damageAnima = 
			{
				fieldNumber = 25,
				prefix = 'repeated',
				type = 'BattleAnima',
				name = 'damageAnima'
			},
			healAmount = 
			{
				fieldNumber = 31,
				prefix = 'optional',
				type = 'int32',
				name = 'healAmount'
			},
			eventType = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'BattleEventType',
				name = 'eventType'
			},
			modifyBuffId = 
			{
				fieldNumber = 61,
				prefix = 'optional',
				type = 'int32',
				name = 'modifyBuffId'
			},
			pos = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'pos'
			},
			targetTroopIndex = 
			{
				fieldNumber = 11,
				prefix = 'repeated',
				type = 'int32',
				name = 'targetTroopIndex'
			},
			damageValue = 
			{
				fieldNumber = 24,
				prefix = 'optional',
				type = 'int64',
				name = 'damageValue'
			},
			addBuffCountdown = 
			{
				fieldNumber = 42,
				prefix = 'optional',
				type = 'int32',
				name = 'addBuffCountdown'
			},
			removeBuffId = 
			{
				fieldNumber = 51,
				prefix = 'optional',
				type = 'int32',
				name = 'removeBuffId'
			},
			leftAmount = 
			{
				fieldNumber = 23,
				prefix = 'optional',
				type = 'int32',
				name = 'leftAmount'
			},
			targetPos = 
			{
				fieldNumber = 12,
				prefix = 'repeated',
				type = 'int32',
				name = 'targetPos'
			},
			damageType = 
			{
				fieldNumber = 21,
				prefix = 'optional',
				type = 'BattleDamageType',
				name = 'damageType'
			},
			addBuffId = 
			{
				fieldNumber = 43,
				prefix = 'optional',
				type = 'int32',
				name = 'addBuffId'
			},
			buffType = 
			{
				fieldNumber = 41,
				prefix = 'optional',
				type = 'BattleBuffType',
				name = 'buffType'
			},
			modifyBuffCountdown = 
			{
				fieldNumber = 62,
				prefix = 'optional',
				type = 'int32',
				name = 'modifyBuffCountdown'
			},
			troopIndex = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'troopIndex'
			},
			loseAmount = 
			{
				fieldNumber = 22,
				prefix = 'optional',
				type = 'int32',
				name = 'loseAmount'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.CmdBattleEvent',
		type = 'message',
		name = 'CmdBattleEvent'
	},
	CmdError = 
	{
		tmField = 
		{
			tips = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'string',
				name = 'tips'
			},
			code = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'EnumErrorType',
				name = 'code'
			},
			data = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'bytes',
				name = 'data'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgAppend.CmdError',
		type = 'message',
		name = 'CmdError'
	},
	CmdGetChatReqMsg = 
	{
		tmField = 
		{
			chatKind = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'ChatKind',
				name = 'chatKind'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChat.CmdGetChatReqMsg',
		type = 'message',
		name = 'CmdGetChatReqMsg'
	},
	CmdGetCampPlayerReportRspMsg = 
	{
		tmField = 
		{
			tlCmdCampPlayerReport = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdCampPlayerReport',
				name = 'tlCmdCampPlayerReport'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGetCampPlayerReportRspMsg',
		type = 'message',
		name = 'CmdGetCampPlayerReportRspMsg'
	},
	CmdReconnaissanceOfResourceGridReqMsg = 
	{
		tmField = 
		{
			pos = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'pos'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdReconnaissanceOfResourceGridReqMsg',
		type = 'message',
		name = 'CmdReconnaissanceOfResourceGridReqMsg'
	},
	CmdBroChatRspMsg = 
	{
		tmField = 
		{
			chatKind = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'ChatKind',
				name = 'chatKind'
			},
			cmdChat = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'CmdChat',
				name = 'cmdChat'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChat.CmdBroChatRspMsg',
		type = 'message',
		name = 'CmdBroChatRspMsg'
	},
	CmdTest = 
	{
		tmField = 
		{
			id = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'uint32',
				name = 'id'
			},
			name = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'name'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.CmdTest',
		type = 'message',
		name = 'CmdTest'
	},
	CmdGiveUpCampTaskRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGiveUpCampTaskRspMsg',
		type = 'message',
		name = 'CmdGiveUpCampTaskRspMsg'
	},
	CmdHeroEquipInfo = 
	{
		tmField = 
		{
			heroEquip = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdHeroEquip',
				name = 'heroEquip'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroEquipInfo',
		type = 'message',
		name = 'CmdHeroEquipInfo'
	},
	CmdReSignActivityReqMsg = 
	{
		tmField = 
		{
			contentId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'contentId'
			},
			activityId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'activityId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdReSignActivityReqMsg',
		type = 'message',
		name = 'CmdReSignActivityReqMsg'
	},
	CmdDismissTroopRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdDismissTroopRspMsg',
		type = 'message',
		name = 'CmdDismissTroopRspMsg'
	},
	CmdTakeTaskRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTask.CmdTakeTaskRspMsg',
		type = 'message',
		name = 'CmdTakeTaskRspMsg'
	},
	CmdQueryUnionBarracksRspMsg = 
	{
		tmField = 
		{
			barrack = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdUnionBarrack',
				name = 'barrack'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdQueryUnionBarracksRspMsg',
		type = 'message',
		name = 'CmdQueryUnionBarracksRspMsg'
	},
	CmdNoticeFlag_Update = 
	{
		tmField = 
		{
			cmdCacheUpdateByField = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'CmdCacheUpdateByField',
				name = 'cmdCacheUpdateByField'
			},
			cmdNoticeFlag = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'CmdNoticeFlag',
				name = 'cmdNoticeFlag'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdNoticeFlag_Update',
		type = 'message',
		name = 'CmdNoticeFlag_Update'
	},
	CmdGrowthFundBuyReqMsg = 
	{
		tmField = 
		{
			activityId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'activityId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdGrowthFundBuyReqMsg',
		type = 'message',
		name = 'CmdGrowthFundBuyReqMsg'
	},
	CmdJinChoukaRspMsg = 
	{
		tmField = 
		{
			cmdChoukaInfo = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'CmdChoukaInfo',
				name = 'cmdChoukaInfo'
			},
			cmdReward = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdReward',
				name = 'cmdReward'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChouka.CmdJinChoukaRspMsg',
		type = 'message',
		name = 'CmdJinChoukaRspMsg'
	},
	CmdResetFubenReqMsg = 
	{
		tmField = 
		{
			fubenId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'fubenId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgFuben.CmdResetFubenReqMsg',
		type = 'message',
		name = 'CmdResetFubenReqMsg'
	},
	CmdExchangeArmyRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdExchangeArmyRspMsg',
		type = 'message',
		name = 'CmdExchangeArmyRspMsg'
	},
	CmdGetCampTroopRspMsg = 
	{
		tmField = 
		{
			cmdCreateTroopInfo = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'CmdCreateTroopInfo',
				name = 'cmdCreateTroopInfo'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGetCampTroopRspMsg',
		type = 'message',
		name = 'CmdGetCampTroopRspMsg'
	},
	CmdCheckPrivateChatReqMsg = 
	{
		tmField = 
		{
			targetPlayerId = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'int32',
				name = 'targetPlayerId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChat.CmdCheckPrivateChatReqMsg',
		type = 'message',
		name = 'CmdCheckPrivateChatReqMsg'
	},
	CmdApplyToJoinUnionReqMsg = 
	{
		tmField = 
		{
			unionId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'unionId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdApplyToJoinUnionReqMsg',
		type = 'message',
		name = 'CmdApplyToJoinUnionReqMsg'
	},
	CmdUsePacketReqMsg = 
	{
		tmField = 
		{
			num = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'num'
			},
			id = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'id'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdUsePacketReqMsg',
		type = 'message',
		name = 'CmdUsePacketReqMsg'
	},
	MessageTask = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTask.MessageTask',
		enums = 
		{
			CmdGetActiveTask = 10902,
			CmdTakeActiveBag = 10904,
			CmdTakeTask = 10901,
			CmdBroCompleteActiveTask = 10905,
			CmdTakeActiveTask = 10903
		},
		type = 'enum',
		name = 'MessageTask'
	},
	CmdPlayerActivityListReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdPlayerActivityListReqMsg',
		type = 'message',
		name = 'CmdPlayerActivityListReqMsg'
	},
	CmdBuildProduceSpeedRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuildProduceSpeedRspMsg',
		type = 'message',
		name = 'CmdBuildProduceSpeedRspMsg'
	},
	CmdGetSoulShopInfoRspMsg = 
	{
		tmField = 
		{
			autoRefreshEndTime = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int64',
				name = 'autoRefreshEndTime'
			},
			goods = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdSoulShopGoods',
				name = 'goods'
			},
			freeRefreshCount = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'freeRefreshCount'
			},
			yuanbaoRefreshCount = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'yuanbaoRefreshCount'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChouka.CmdGetSoulShopInfoRspMsg',
		type = 'message',
		name = 'CmdGetSoulShopInfoRspMsg'
	},
	CmdUnionMailDetail = 
	{
		tmField = 
		{
			title = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'string',
				name = 'title'
			},
			isTake = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'bool',
				name = 'isTake'
			},
			content = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'content'
			},
			sendPlayerName = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'string',
				name = 'sendPlayerName'
			},
			isSystem = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'bool',
				name = 'isSystem'
			},
			fujians = 
			{
				fieldNumber = 6,
				prefix = 'repeated',
				type = 'CmdReward',
				name = 'fujians'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdUnionMailDetail',
		type = 'message',
		name = 'CmdUnionMailDetail'
	},
	CmdRefreshCampTaskRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdRefreshCampTaskRspMsg',
		type = 'message',
		name = 'CmdRefreshCampTaskRspMsg'
	},
	SevenDaySubKind = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.SevenDaySubKind',
		enums = 
		{
			EVERY_DAY_TASK = 3,
			EVERY_DAY_GIFT = 1,
			PANIC_BUYING = 4,
			EVERY_DAY_CHARGE = 2
		},
		type = 'enum',
		name = 'SevenDaySubKind'
	},
	CmdSearchCampMemberReqMsg = 
	{
		tmField = 
		{
			playerName = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'string',
				name = 'playerName'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdSearchCampMemberReqMsg',
		type = 'message',
		name = 'CmdSearchCampMemberReqMsg'
	},
	CmdItem = 
	{
		tmField = 
		{
			goodsType = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'GoodsType',
				name = 'goodsType'
			},
			num = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'num'
			},
			id = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'id'
			},
			refId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdItem',
		type = 'message',
		name = 'CmdItem'
	},
	CmdBuildProduceCancelRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuildProduceCancelRspMsg',
		type = 'message',
		name = 'CmdBuildProduceCancelRspMsg'
	},
	CmdAcademyProduceRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdAcademyProduceRspMsg',
		type = 'message',
		name = 'CmdAcademyProduceRspMsg'
	},
	CmdOpenBagNumReqMsg = 
	{
		tmField = 
		{
			num = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'num'
			},
			bagType = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'bagType'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdOpenBagNumReqMsg',
		type = 'message',
		name = 'CmdOpenBagNumReqMsg'
	},
	CmdSimplePlayerInfo = 
	{
		tmField = 
		{
			unionName = 
			{
				fieldNumber = 7,
				prefix = 'optional',
				type = 'string',
				name = 'unionName'
			},
			power = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'int32',
				name = 'power'
			},
			level = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'int32',
				name = 'level'
			},
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			unionId = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'int32',
				name = 'unionId'
			},
			imageId = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'string',
				name = 'imageId'
			},
			playerName = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'string',
				name = 'playerName'
			},
			campOfficeId = 
			{
				fieldNumber = 8,
				prefix = 'optional',
				type = 'int32',
				name = 'campOfficeId'
			},
			provinceId = 
			{
				fieldNumber = 9,
				prefix = 'optional',
				type = 'int32',
				name = 'provinceId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCommon.CmdSimplePlayerInfo',
		type = 'message',
		name = 'CmdSimplePlayerInfo'
	},
	CmdPlayerExpend = 
	{
		tmField = 
		{
			renameNum = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'int32',
				name = 'renameNum'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdPlayerExpend',
		type = 'message',
		name = 'CmdPlayerExpend'
	},
	CmdHero_Key = 
	{
		tmField = 
		{
			heroId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'heroId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHero_Key',
		type = 'message',
		name = 'CmdHero_Key'
	},
	CmdEditCampTroopReqMsg = 
	{
		tmField = 
		{
			cmdCreateTroopInfo = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'CmdCreateTroopInfo',
				name = 'cmdCreateTroopInfo'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdEditCampTroopReqMsg',
		type = 'message',
		name = 'CmdEditCampTroopReqMsg'
	},
	CmdOpenProduceQueueRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdOpenProduceQueueRspMsg',
		type = 'message',
		name = 'CmdOpenProduceQueueRspMsg'
	},
	CmdCompoundHeroReqMsg = 
	{
		tmField = 
		{
			refId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdCompoundHeroReqMsg',
		type = 'message',
		name = 'CmdCompoundHeroReqMsg'
	},
	CmdItem_Update = 
	{
		tmField = 
		{
			cmdItem = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdItem',
				name = 'cmdItem'
			},
			cmdItem_Key = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdItem_Key',
				name = 'cmdItem_Key'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdItem_Update',
		type = 'message',
		name = 'CmdItem_Update'
	},
	CmdTakeActiveBagReqMsg = 
	{
		tmField = 
		{
			refId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTask.CmdTakeActiveBagReqMsg',
		type = 'message',
		name = 'CmdTakeActiveBagReqMsg'
	},
	CmdCloseBattleFieldInterfaceRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdCloseBattleFieldInterfaceRspMsg',
		type = 'message',
		name = 'CmdCloseBattleFieldInterfaceRspMsg'
	},
	CmdSearchMemberInfo = 
	{
		tmField = 
		{
			lastOfficeId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'lastOfficeId'
			},
			cmdSimplePlayerInfo = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'CmdSimplePlayerInfo',
				name = 'cmdSimplePlayerInfo'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdSearchMemberInfo',
		type = 'message',
		name = 'CmdSearchMemberInfo'
	},
	CmdHeroStepRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroStepRspMsg',
		type = 'message',
		name = 'CmdHeroStepRspMsg'
	},
	CmdTips = 
	{
		tmField = 
		{
			tipsId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'tipsId'
			},
			desc = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'desc'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgAppend.CmdTips',
		type = 'message',
		name = 'CmdTips'
	},
	CmdTakeActiveBagRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTask.CmdTakeActiveBagRspMsg',
		type = 'message',
		name = 'CmdTakeActiveBagRspMsg'
	},
	CmdAutoArmyRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdAutoArmyRspMsg',
		type = 'message',
		name = 'CmdAutoArmyRspMsg'
	},
	CmdInjuryArmy = 
	{
		tmField = 
		{
			num = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'num'
			},
			refId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgArmy.CmdInjuryArmy',
		type = 'message',
		name = 'CmdInjuryArmy'
	},
	TroopDataType = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.TroopDataType',
		enums = 
		{
			BATTLE_TROOP = 1,
			TROOP = 0,
			HELP_TROOP = 3,
			HELP_TROOP_SUMMARY = 2
		},
		type = 'enum',
		name = 'TroopDataType'
	},
	CmdBroPlayerActivityRspMsg = 
	{
		tmField = 
		{
			tlCmdPlayerActivity = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'CmdPlayerActivity',
				name = 'tlCmdPlayerActivity'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdBroPlayerActivityRspMsg',
		type = 'message',
		name = 'CmdBroPlayerActivityRspMsg'
	},
	CmdFightFubenRspMsg = 
	{
		tmField = 
		{
			cmdBattle = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'CmdBattle',
				name = 'cmdBattle'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgFuben.CmdFightFubenRspMsg',
		type = 'message',
		name = 'CmdFightFubenRspMsg'
	},
	CmdCompoundEquipReqMsg = 
	{
		tmField = 
		{
			refId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdCompoundEquipReqMsg',
		type = 'message',
		name = 'CmdCompoundEquipReqMsg'
	},
	CmdGetSoulShopInfoReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChouka.CmdGetSoulShopInfoReqMsg',
		type = 'message',
		name = 'CmdGetSoulShopInfoReqMsg'
	},
	CmdPvpBattleAtkReportDetail = 
	{
		tmField = 
		{
			killSoldierNum = 
			{
				fieldNumber = 7,
				prefix = 'required',
				type = 'int32',
				name = 'killSoldierNum'
			},
			atkTotalSoldierNum = 
			{
				fieldNumber = 14,
				prefix = 'required',
				type = 'int32',
				name = 'atkTotalSoldierNum'
			},
			ownerPlayerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'ownerPlayerId'
			},
			defTotalSoldierNum = 
			{
				fieldNumber = 17,
				prefix = 'required',
				type = 'int32',
				name = 'defTotalSoldierNum'
			},
			atkTroopCount = 
			{
				fieldNumber = 13,
				prefix = 'required',
				type = 'int32',
				name = 'atkTroopCount'
			},
			tlCmdMailBattleDetail = 
			{
				fieldNumber = 12,
				prefix = 'repeated',
				type = 'CmdMailBattleDetail',
				name = 'tlCmdMailBattleDetail'
			},
			defTotalLoseSoldier = 
			{
				fieldNumber = 18,
				prefix = 'required',
				type = 'int32',
				name = 'defTotalLoseSoldier'
			},
			gainCampPoint = 
			{
				fieldNumber = 9,
				prefix = 'required',
				type = 'int32',
				name = 'gainCampPoint'
			},
			leftProsperity = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'int32',
				name = 'leftProsperity'
			},
			isSuccess = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'bool',
				name = 'isSuccess'
			},
			loseArmy = 
			{
				fieldNumber = 11,
				prefix = 'repeated',
				type = 'CmdReward',
				name = 'loseArmy'
			},
			atkTotalLoseSoldier = 
			{
				fieldNumber = 15,
				prefix = 'required',
				type = 'int32',
				name = 'atkTotalLoseSoldier'
			},
			resources = 
			{
				fieldNumber = 10,
				prefix = 'repeated',
				type = 'CmdReward',
				name = 'resources'
			},
			ownerPlayerName = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'ownerPlayerName'
			},
			defTroopCount = 
			{
				fieldNumber = 16,
				prefix = 'required',
				type = 'int32',
				name = 'defTroopCount'
			},
			ownerPlayerPos = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'ownerPlayerPos'
			},
			loseSoldierNum = 
			{
				fieldNumber = 8,
				prefix = 'required',
				type = 'int32',
				name = 'loseSoldierNum'
			},
			decProsperity = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int32',
				name = 'decProsperity'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdPvpBattleAtkReportDetail',
		type = 'message',
		name = 'CmdPvpBattleAtkReportDetail'
	},
	CmdQueryWorldObjInSightRspMsg = 
	{
		tmField = 
		{
			tlCmdWorldObj = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdWorldObj',
				name = 'tlCmdWorldObj'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdQueryWorldObjInSightRspMsg',
		type = 'message',
		name = 'CmdQueryWorldObjInSightRspMsg'
	},
	CmdGetCampTroopReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGetCampTroopReqMsg',
		type = 'message',
		name = 'CmdGetCampTroopReqMsg'
	},
	CmdHeroStepReqMsg = 
	{
		tmField = 
		{
			heroId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'heroId'
			},
			cardId = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'int32',
				name = 'cardId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroStepReqMsg',
		type = 'message',
		name = 'CmdHeroStepReqMsg'
	},
	CmdGetDefendRuleReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdGetDefendRuleReqMsg',
		type = 'message',
		name = 'CmdGetDefendRuleReqMsg'
	},
	CmdBattleSettlement = 
	{
		tmField = 
		{
			winnerIndex = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'int32',
				name = 'winnerIndex'
			},
			tlCmdBattleReward = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdBattleReward',
				name = 'tlCmdBattleReward'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.CmdBattleSettlement',
		type = 'message',
		name = 'CmdBattleSettlement'
	},
	CmdRecallRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdRecallRspMsg',
		type = 'message',
		name = 'CmdRecallRspMsg'
	},
	CmdTask_Key = 
	{
		tmField = 
		{
			refId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTask.CmdTask_Key',
		type = 'message',
		name = 'CmdTask_Key'
	},
	CmdMarchIntoCityRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdMarchIntoCityRspMsg',
		type = 'message',
		name = 'CmdMarchIntoCityRspMsg'
	},
	CmdDelMailReqMsg = 
	{
		tmField = 
		{
			id = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'int32',
				name = 'id'
			},
			mailType = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'MailType',
				name = 'mailType'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdDelMailReqMsg',
		type = 'message',
		name = 'CmdDelMailReqMsg'
	},
	CmdDeclareBattleInfo_Update = 
	{
		tmField = 
		{
			tlCmdDeclareBattleInfo_Key = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdDeclareBattleInfo_Key',
				name = 'tlCmdDeclareBattleInfo_Key'
			},
			tlCmdDeclareBattleInfo = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdDeclareBattleInfo',
				name = 'tlCmdDeclareBattleInfo'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdDeclareBattleInfo_Update',
		type = 'message',
		name = 'CmdDeclareBattleInfo_Update'
	},
	CmdTroopHeroDetail = 
	{
		tmField = 
		{
			tong = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'int32',
				name = 'tong'
			},
			level = 
			{
				fieldNumber = 7,
				prefix = 'required',
				type = 'int32',
				name = 'level'
			},
			su = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int32',
				name = 'su'
			},
			li = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'li'
			},
			heroRefId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'heroRefId'
			},
			step = 
			{
				fieldNumber = 8,
				prefix = 'required',
				type = 'int32',
				name = 'step'
			},
			zhi = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'zhi'
			},
			heroId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'heroId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdTroopHeroDetail',
		type = 'message',
		name = 'CmdTroopHeroDetail'
	},
	CmdExchangeArmyReqMsg = 
	{
		tmField = 
		{
			troopId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'troopId'
			},
			index = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'index'
			},
			targetIndex = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'targetIndex'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdExchangeArmyReqMsg',
		type = 'message',
		name = 'CmdExchangeArmyReqMsg'
	},
	CmdGrowthFundActivityExtraData = 
	{
		tmField = 
		{
			vip = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'int32',
				name = 'vip'
			},
			gold = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int32',
				name = 'gold'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdGrowthFundActivityExtraData',
		type = 'message',
		name = 'CmdGrowthFundActivityExtraData'
	},
	CmdHeroVeinTupoReqMsg = 
	{
		tmField = 
		{
			heroId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'heroId'
			},
			index = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'index'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroVeinTupoReqMsg',
		type = 'message',
		name = 'CmdHeroVeinTupoReqMsg'
	},
	CmdBuyResourceReqMsg = 
	{
		tmField = 
		{
			goodsType = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'GoodsType',
				name = 'goodsType'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdBuyResourceReqMsg',
		type = 'message',
		name = 'CmdBuyResourceReqMsg'
	},
	CmdBuildQueue_Key = 
	{
		tmField = 
		{
			lotId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'lotId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuildQueue_Key',
		type = 'message',
		name = 'CmdBuildQueue_Key'
	},
	MailType = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCommon.MailType',
		enums = 
		{
			BattleMail = 2,
			SystemMail = 1
		},
		type = 'enum',
		name = 'MailType'
	},
	CmdPlayerActivityListRspMsg = 
	{
		tmField = 
		{
			tlCmdPlayerActivity = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdPlayerActivity',
				name = 'tlCmdPlayerActivity'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdPlayerActivityListRspMsg',
		type = 'message',
		name = 'CmdPlayerActivityListRspMsg'
	},
	CmdLimitLeaderBoardTag = 
	{
		tmField = 
		{
			tlCmdLimitLeaderBoardRewardData = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdLimitLeaderBoardRewardData',
				name = 'tlCmdLimitLeaderBoardRewardData'
			},
			tlCmdLimitLeaderBoardRankData = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdLimitLeaderBoardRankData',
				name = 'tlCmdLimitLeaderBoardRankData'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdLimitLeaderBoardTag',
		type = 'message',
		name = 'CmdLimitLeaderBoardTag'
	},
	CmdCloseWorldInterfaceReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdCloseWorldInterfaceReqMsg',
		type = 'message',
		name = 'CmdCloseWorldInterfaceReqMsg'
	},
	MessageChouka = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChouka.MessageChouka',
		enums = 
		{
			CmdGetSoulShopInfo = 10404,
			CmdGetChoukaInfo = 10401,
			CmdJinChouka = 10402,
			CmdRefreshSoulShop = 10405,
			CmdYinChouka = 10403,
			CmdBuySoulShopGoods = 10406
		},
		type = 'enum',
		name = 'MessageChouka'
	},
	CmdResult = 
	{
		tmField = 
		{
			tips = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'string',
				name = 'tips'
			},
			code = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'code'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCommon.CmdResult',
		type = 'message',
		name = 'CmdResult'
	},
	EnumKingBattleStage = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.EnumKingBattleStage',
		enums = 
		{
			KING_BET = 3,
			EIGHT_2_FOUR_WAIT = 4,
			NORMAL = 1,
			FINAL_EIGHT_FIGHT = 2,
			FINAL_WAIT = 6,
			SEMI_FINAL_WAIT = 5
		},
		type = 'enum',
		name = 'EnumKingBattleStage'
	},
	CmdHeroShard_Update = 
	{
		tmField = 
		{
			cmdHeroShard_Key = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdHeroShard_Key',
				name = 'cmdHeroShard_Key'
			},
			cmdHeroShard = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdHeroShard',
				name = 'cmdHeroShard'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroShard_Update',
		type = 'message',
		name = 'CmdHeroShard_Update'
	},
	CmdHeroVein = 
	{
		tmField = 
		{
			tupoLevel = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'tupoLevel'
			},
			index = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'index'
			},
			level = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'level'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroVein',
		type = 'message',
		name = 'CmdHeroVein'
	},
	CmdCreateTroopInfo = 
	{
		tmField = 
		{
			commandingGeneralId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'commandingGeneralId'
			},
			deputyGeneralId1 = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int32',
				name = 'deputyGeneralId1'
			},
			deputyGeneralId2 = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'int32',
				name = 'deputyGeneralId2'
			},
			cmdArmyInfos = 
			{
				fieldNumber = 4,
				prefix = 'repeated',
				type = 'CmdArmyInfo',
				name = 'cmdArmyInfos'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdCreateTroopInfo',
		type = 'message',
		name = 'CmdCreateTroopInfo'
	},
	CmdHeroEquipShard_Update = 
	{
		tmField = 
		{
			cmdHeroEquipShard = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdHeroEquipShard',
				name = 'cmdHeroEquipShard'
			},
			cmdHeroEquipShard_Key = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdHeroEquipShard_Key',
				name = 'cmdHeroEquipShard_Key'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroEquipShard_Update',
		type = 'message',
		name = 'CmdHeroEquipShard_Update'
	},
	CmdGetCityReportReqMsg = 
	{
		tmField = 
		{
			y = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'y'
			},
			x = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'x'
			},
			type = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'type'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCityBattle.CmdGetCityReportReqMsg',
		type = 'message',
		name = 'CmdGetCityReportReqMsg'
	},
	CmdGetEnemyMarchReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdGetEnemyMarchReqMsg',
		type = 'message',
		name = 'CmdGetEnemyMarchReqMsg'
	},
	CmdGetCampTaskTimesRspMsg = 
	{
		tmField = 
		{
			hasFinishTimes = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'hasFinishTimes'
			},
			hasRefreshTimes = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'hasRefreshTimes'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGetCampTaskTimesRspMsg',
		type = 'message',
		name = 'CmdGetCampTaskTimesRspMsg'
	},
	CmdHero = 
	{
		tmField = 
		{
			tong = 
			{
				fieldNumber = 9,
				prefix = 'optional',
				type = 'int32',
				name = 'tong'
			},
			level = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'int32',
				name = 'level'
			},
			playerId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			amount = 
			{
				fieldNumber = 11,
				prefix = 'optional',
				type = 'int32',
				name = 'amount'
			},
			su = 
			{
				fieldNumber = 10,
				prefix = 'optional',
				type = 'int32',
				name = 'su'
			},
			li = 
			{
				fieldNumber = 7,
				prefix = 'optional',
				type = 'int32',
				name = 'li'
			},
			step = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'int32',
				name = 'step'
			},
			cmdHeroVeinInfo = 
			{
				fieldNumber = 12,
				prefix = 'optional',
				type = 'bytes',
				name = 'cmdHeroVeinInfo'
			},
			exp = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'int32',
				name = 'exp'
			},
			zhi = 
			{
				fieldNumber = 8,
				prefix = 'optional',
				type = 'int32',
				name = 'zhi'
			},
			heroId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'heroId'
			},
			refId = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHero',
		type = 'message',
		name = 'CmdHero'
	},
	CmdCampKnockOutReport = 
	{
		tmField = 
		{
			battleData = 
			{
				fieldNumber = 7,
				prefix = 'optional',
				type = 'bytes',
				name = 'battleData'
			},
			cmdSimplePlayerInfo2 = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'CmdSimplePlayerInfo',
				name = 'cmdSimplePlayerInfo2'
			},
			cmdSimplePlayerInfo1 = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'CmdSimplePlayerInfo',
				name = 'cmdSimplePlayerInfo1'
			},
			saveBattlePath = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'string',
				name = 'saveBattlePath'
			},
			risePlayerId = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'risePlayerId'
			},
			targetIndex = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'targetIndex'
			},
			stage = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'EnumKingBattleStage',
				name = 'stage'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdCampKnockOutReport',
		type = 'message',
		name = 'CmdCampKnockOutReport'
	},
	CmdGetFuJianRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdGetFuJianRspMsg',
		type = 'message',
		name = 'CmdGetFuJianRspMsg'
	},
	CmdDisbandUnionRspMsg = 
	{
		tmField = 
		{
			success = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'bool',
				name = 'success'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdDisbandUnionRspMsg',
		type = 'message',
		name = 'CmdDisbandUnionRspMsg'
	},
	CmdTroop = 
	{
		tmField = 
		{
			marchSpeed = 
			{
				fieldNumber = 9,
				prefix = 'optional',
				type = 'int32',
				name = 'marchSpeed'
			},
			heroDetail = 
			{
				fieldNumber = 10,
				prefix = 'repeated',
				type = 'CmdTroopHeroDetail',
				name = 'heroDetail'
			},
			troopId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'troopId'
			},
			commandingGeneralId = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'int32',
				name = 'commandingGeneralId'
			},
			createTime = 
			{
				fieldNumber = 8,
				prefix = 'optional',
				type = 'int32',
				name = 'createTime'
			},
			cmdWorldObj = 
			{
				fieldNumber = 7,
				prefix = 'optional',
				type = 'CmdWorldObj',
				name = 'cmdWorldObj'
			},
			dataType = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'TroopDataType',
				name = 'dataType'
			},
			cmdArmyInfos = 
			{
				fieldNumber = 6,
				prefix = 'repeated',
				type = 'CmdArmyInfo',
				name = 'cmdArmyInfos'
			},
			troopPower = 
			{
				fieldNumber = 12,
				prefix = 'optional',
				type = 'int32',
				name = 'troopPower'
			},
			summary = 
			{
				fieldNumber = 11,
				prefix = 'optional',
				type = 'CmdTroopSummary',
				name = 'summary'
			},
			deputyGeneralId1 = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'int32',
				name = 'deputyGeneralId1'
			},
			deputyGeneralId2 = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'int32',
				name = 'deputyGeneralId2'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdTroop',
		type = 'message',
		name = 'CmdTroop'
	},
	CmdCampShopNumData = 
	{
		tmField = 
		{
			id = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'id'
			},
			buyNum = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'buyNum'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdCampShopNumData',
		type = 'message',
		name = 'CmdCampShopNumData'
	},
	CmdWorldObjOwnerInfo = 
	{
		tmField = 
		{
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			playerName = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'playerName'
			},
			provinceId = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'provinceId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdWorldObjOwnerInfo',
		type = 'message',
		name = 'CmdWorldObjOwnerInfo'
	},
	CmdActivityInfoListRspMsg = 
	{
		tmField = 
		{
			tlCmdActivity = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdActivity',
				name = 'tlCmdActivity'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdActivityInfoListRspMsg',
		type = 'message',
		name = 'CmdActivityInfoListRspMsg'
	},
	BattleEventType = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.BattleEventType',
		enums = 
		{
			BET_NOTICE_BOUT_END = 1004,
			BET_SPECIAL_ATTACK = 4,
			BET_REMOVE_BUFF = 22,
			BET_ATTACK = 1,
			BET_DEATH = 999,
			BET_DAMAGE = 11,
			BET_NOTICE_ATTACK_END = 1002,
			BET_NOTICE_ROUND_END = 1003,
			BET_REFLECT_ATTACK = 101,
			BET_NOTICE_ATTACK_START = 1001,
			BET_COUNTER_ATTACK = 2,
			BET_ADD_BUFF = 21,
			BET_MODIFY_BUFF = 23,
			BET_HEAL = 12,
			BET_DOUBLE_ATTACK = 3
		},
		type = 'enum',
		name = 'BattleEventType'
	},
	CmdAcademyProduction = 
	{
		tmField = 
		{
			refId = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			},
			endTime = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int64',
				name = 'endTime'
			},
			id = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'id'
			},
			startTime = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int64',
				name = 'startTime'
			},
			isProducting = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'bool',
				name = 'isProducting'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdAcademyProduction',
		type = 'message',
		name = 'CmdAcademyProduction'
	},
	CmdBuyVipBagReqMsg = 
	{
		tmField = 
		{
			vipLevel = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'vipLevel'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdBuyVipBagReqMsg',
		type = 'message',
		name = 'CmdBuyVipBagReqMsg'
	},
	CmdDeleteItemRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdDeleteItemRspMsg',
		type = 'message',
		name = 'CmdDeleteItemRspMsg'
	},
	CmdPrivateChatListRspMsg = 
	{
		tmField = 
		{
			cmdPrivateChat = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdPrivateChat',
				name = 'cmdPrivateChat'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChat.CmdPrivateChatListRspMsg',
		type = 'message',
		name = 'CmdPrivateChatListRspMsg'
	},
	CmdListUnionApplicationsReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdListUnionApplicationsReqMsg',
		type = 'message',
		name = 'CmdListUnionApplicationsReqMsg'
	},
	CmdEditArmyRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdEditArmyRspMsg',
		type = 'message',
		name = 'CmdEditArmyRspMsg'
	},
	GoodsType = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCommon.GoodsType',
		enums = 
		{
			Exp = 2006,
			Army = 3000,
			TupoDan = 17,
			Injury_Army = 3001,
			HeroStepBall = 4,
			Buff_Ball = 11,
			NaXianLing = 6,
			Wood = 2002,
			Tie = 5,
			EquipShard = 50000,
			ZhenChaLing = 14,
			Camp_Point = 2009,
			Union_HallBuildPoint = 4000,
			Hero = 1000,
			Union_Material = 4001,
			Food = 2005,
			JingMaiDan = 16,
			XiLianShi = 8,
			MaLiang = 9,
			Coin = 2001,
			HeroShard = 10000,
			Stone = 2004,
			HeroExpBall = 3,
			Soul = 2008,
			Xingjun_JiaSuLing = 10,
			Iron = 2003,
			Produce_JiaSuLing = 7,
			Gold = 2999,
			Energy = 2007,
			Packet = 2,
			Equip = 5000,
			QianChengLing = 12,
			Union_Contribution = 4500,
			JiaSuLing = 1,
			Tech_JiaSuLing = 15
		},
		type = 'enum',
		name = 'GoodsType'
	},
	CmdBattleReward = 
	{
		tmField = 
		{
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			star = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'int32',
				name = 'star'
			},
			cmdReward = 
			{
				fieldNumber = 3,
				prefix = 'repeated',
				type = 'CmdReward',
				name = 'cmdReward'
			},
			exp = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int32',
				name = 'exp'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.CmdBattleReward',
		type = 'message',
		name = 'CmdBattleReward'
	},
	ArmyKind = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgArmy.ArmyKind',
		enums = 
		{
			INJURY = 2,
			HEALTH = 1
		},
		type = 'enum',
		name = 'ArmyKind'
	},
	CmdCampData = 
	{
		tmField = 
		{
			changeProvinceTimes = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'changeProvinceTimes'
			},
			provinceId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'provinceId'
			},
			officeId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'officeId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdCampData',
		type = 'message',
		name = 'CmdCampData'
	},
	CmdDismissTroopReqMsg = 
	{
		tmField = 
		{
			troopId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'troopId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdDismissTroopReqMsg',
		type = 'message',
		name = 'CmdDismissTroopReqMsg'
	},
	CmdBattleAttack = 
	{
		tmField = 
		{
			event = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdBattleEvent',
				name = 'event'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.CmdBattleAttack',
		type = 'message',
		name = 'CmdBattleAttack'
	},
	CmdKickOutUnionMemberRspMsg = 
	{
		tmField = 
		{
			success = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'bool',
				name = 'success'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdKickOutUnionMemberRspMsg',
		type = 'message',
		name = 'CmdKickOutUnionMemberRspMsg'
	},
	CmdBuildUnionHallRspMsg = 
	{
		tmField = 
		{
			hallBuildDailyCount = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int32',
				name = 'hallBuildDailyCount'
			},
			success = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'bool',
				name = 'success'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdBuildUnionHallRspMsg',
		type = 'message',
		name = 'CmdBuildUnionHallRspMsg'
	},
	CmdBuildUpgradeRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuildUpgradeRspMsg',
		type = 'message',
		name = 'CmdBuildUpgradeRspMsg'
	},
	CmdArmyProduction = 
	{
		tmField = 
		{
			isProducting = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'bool',
				name = 'isProducting'
			},
			armyNum = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int32',
				name = 'armyNum'
			},
			id = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'id'
			},
			startTime = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int64',
				name = 'startTime'
			},
			endTime = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'int64',
				name = 'endTime'
			},
			refId = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdArmyProduction',
		type = 'message',
		name = 'CmdArmyProduction'
	},
	CmdCollectRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdCollectRspMsg',
		type = 'message',
		name = 'CmdCollectRspMsg'
	},
	CmdHeroEquip = 
	{
		tmField = 
		{
			newSecondProperty = 
			{
				fieldNumber = 7,
				prefix = 'repeated',
				type = 'CmdHeroEquipXilian',
				name = 'newSecondProperty'
			},
			currentSecondProperty = 
			{
				fieldNumber = 6,
				prefix = 'repeated',
				type = 'CmdHeroEquipXilian',
				name = 'currentSecondProperty'
			},
			level = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int32',
				name = 'level'
			},
			playerId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			lastXilianType = 
			{
				fieldNumber = 8,
				prefix = 'optional',
				type = 'int32',
				name = 'lastXilianType'
			},
			equipId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'equipId'
			},
			heroId = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'heroId'
			},
			refId = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroEquip',
		type = 'message',
		name = 'CmdHeroEquip'
	},
	CmdSetDefendRuleRspMsg = 
	{
		tmField = 
		{
			success = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'bool',
				name = 'success'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdSetDefendRuleRspMsg',
		type = 'message',
		name = 'CmdSetDefendRuleRspMsg'
	},
	CmdGetKingPlayerReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGetKingPlayerReqMsg',
		type = 'message',
		name = 'CmdGetKingPlayerReqMsg'
	},
	MessageCamp = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.MessageCamp',
		enums = 
		{
			CmdCloseKingFightPanel = 11411,
			CmdKingBet = 11406,
			CmdGainCampTaskReward = 11417,
			CmdGetCampMember = 11426,
			CmdSearchCampMember = 11415,
			CmdKingFight = 11407,
			CmdAppointOffice = 11404,
			CmdGetCampPlayerReport = 11412,
			CmdDrawSalary = 11405,
			CmdRefreshCampTask = 11418,
			CmdDeclareBattle = 11402,
			CmdOpenKingFightPanel = 11410,
			CmdGetOfficeList = 11413,
			CmdBuyCampShopInfo = 11423,
			CmdGetCampReport = 11408,
			CmdBroCampBattleRankInfo = 11421,
			CmdBroCampTask = 11424,
			CmdGetCampShopInfo = 11422,
			CmdChangeProvince = 11401,
			CmdGetCampTroop = 11427,
			CmdEditCampTroop = 11409,
			CmdGetCampTaskTimes = 11425,
			CmdChangeStatus = 11403,
			CmdAcceptCampTask = 11416,
			CmdGetKingPlayer = 11414,
			CmdGiveUpCampTask = 11419,
			CmdBroDeclareBattle = 11420
		},
		type = 'enum',
		name = 'MessageCamp'
	},
	NpcCityType = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.NpcCityType',
		enums = 
		{
			NCT_4x4_Z = 3,
			NCT_4x4_D = 4,
			NCT_2x2_J = 2,
			NCT_2x2_X = 1
		},
		type = 'enum',
		name = 'NpcCityType'
	},
	CmdOpenKingFightPanelRspMsg = 
	{
		tmField = 
		{
			tlCmdCampKnockOutReport = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdCampKnockOutReport',
				name = 'tlCmdCampKnockOutReport'
			},
			tlCmdIndexRankInfo = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdIndexRankInfo',
				name = 'tlCmdIndexRankInfo'
			},
			enumKingBattleStage = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'EnumKingBattleStage',
				name = 'enumKingBattleStage'
			},
			nextStageChangeTime = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int64',
				name = 'nextStageChangeTime'
			},
			betIndex = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'betIndex'
			},
			nextCamEditTroopTime = 
			{
				fieldNumber = 6,
				prefix = 'required',
				type = 'int64',
				name = 'nextCamEditTroopTime'
			},
			nextCanFightTime = 
			{
				fieldNumber = 7,
				prefix = 'required',
				type = 'int64',
				name = 'nextCanFightTime'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdOpenKingFightPanelRspMsg',
		type = 'message',
		name = 'CmdOpenKingFightPanelRspMsg'
	},
	CmdGetResourceInfoReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdGetResourceInfoReqMsg',
		type = 'message',
		name = 'CmdGetResourceInfoReqMsg'
	},
	GridLandForm = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.GridLandForm',
		enums = 
		{
			GL_PLAIN = 3,
			GL_MOUNTAIN = 2,
			GL_STONE = 6,
			GL_FOREST = 4,
			GL_IRON = 5,
			GL_DESERT = 1,
			GL_FARM = 7
		},
		type = 'enum',
		name = 'GridLandForm'
	},
	CmdReconnaissanceOfPlayerCityRspMsg = 
	{
		tmField = 
		{
			mailId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'mailId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdReconnaissanceOfPlayerCityRspMsg',
		type = 'message',
		name = 'CmdReconnaissanceOfPlayerCityRspMsg'
	},
	CmdCampTask_Update = 
	{
		tmField = 
		{
			tlCmdCampTask = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdCampTask',
				name = 'tlCmdCampTask'
			},
			tlCmdCampTask_Key = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdCampTask_Key',
				name = 'tlCmdCampTask_Key'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdCampTask_Update',
		type = 'message',
		name = 'CmdCampTask_Update'
	},
	CmdGetKingPlayerRspMsg = 
	{
		tmField = 
		{
			cmdSimplePlayerInfo = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'CmdSimplePlayerInfo',
				name = 'cmdSimplePlayerInfo'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGetKingPlayerRspMsg',
		type = 'message',
		name = 'CmdGetKingPlayerRspMsg'
	},
	CmdMessage = 
	{
		tmField = 
		{
			index = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'sint32',
				name = 'index'
			},
			playerId = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'sint32',
				name = 'playerId'
			},
			serverTime = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'int64',
				name = 'serverTime'
			},
			clientTime = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'int64',
				name = 'clientTime'
			},
			messageId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'sint32',
				name = 'messageId'
			},
			serverId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'sint32',
				name = 'serverId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.CmdMessage',
		type = 'message',
		name = 'CmdMessage'
	},
	CmdHeroEquipLevelRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdHeroEquipLevelRspMsg',
		type = 'message',
		name = 'CmdHeroEquipLevelRspMsg'
	},
	StepKind = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCommon.StepKind',
		enums = 
		{
			Seven = 7,
			Ten = 10,
			Nine = 9,
			Six = 6,
			Three = 3,
			Two = 2,
			Four = 4,
			Zero = 0,
			Five = 5,
			Eight = 8,
			One = 1
		},
		type = 'enum',
		name = 'StepKind'
	},
	CmdGetFuJianReqMsg = 
	{
		tmField = 
		{
			id = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'id'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdGetFuJianReqMsg',
		type = 'message',
		name = 'CmdGetFuJianReqMsg'
	},
	CmdCollectReqMsg = 
	{
		tmField = 
		{
			troopId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'troopId'
			},
			expectEndTime = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'int64',
				name = 'expectEndTime'
			},
			itemNum = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'int32',
				name = 'itemNum'
			},
			pos = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'pos'
			},
			itemRefId = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'int32',
				name = 'itemRefId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdCollectReqMsg',
		type = 'message',
		name = 'CmdCollectReqMsg'
	},
	CmdChoukaInfo = 
	{
		tmField = 
		{
			heroTimes = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'int32',
				name = 'heroTimes'
			},
			choukaType = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'ChoukaType',
				name = 'choukaType'
			},
			endTimes = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'int64',
				name = 'endTimes'
			},
			leftTimes = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'int32',
				name = 'leftTimes'
			},
			times = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int32',
				name = 'times'
			},
			first = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'bool',
				name = 'first'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChouka.CmdChoukaInfo',
		type = 'message',
		name = 'CmdChoukaInfo'
	},
	CmdAutoArmyReqMsg = 
	{
		tmField = 
		{
			troopId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'troopId'
			},
			type = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'type'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdAutoArmyReqMsg',
		type = 'message',
		name = 'CmdAutoArmyReqMsg'
	},
	MessageMail = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.MessageMail',
		enums = 
		{
			CmdDelMail = 10603,
			CmdGetFuJian = 10602,
			CmdReadMail = 10604,
			CmdGetAllMail = 10601,
			CmdBroAddMail = 10605
		},
		type = 'enum',
		name = 'MessageMail'
	},
	CmdUnionApplication = 
	{
		tmField = 
		{
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			provinceId = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'int32',
				name = 'provinceId'
			},
			name = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'string',
				name = 'name'
			},
			power = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'int32',
				name = 'power'
			},
			level = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'level'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdUnionApplication',
		type = 'message',
		name = 'CmdUnionApplication'
	},
	CmdUnionMember_Update = 
	{
		tmField = 
		{
			cmdUnionMember = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdUnionMember',
				name = 'cmdUnionMember'
			},
			cmdUnionMember_Key = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdUnionMember_Key',
				name = 'cmdUnionMember_Key'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdUnionMember_Update',
		type = 'message',
		name = 'CmdUnionMember_Update'
	},
	CmdDeclareBattleRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdDeclareBattleRspMsg',
		type = 'message',
		name = 'CmdDeclareBattleRspMsg'
	},
	CmdSystemDetail = 
	{
		tmField = 
		{
			title = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'string',
				name = 'title'
			},
			isTake = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'bool',
				name = 'isTake'
			},
			content = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'string',
				name = 'content'
			},
			sendPlayerName = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'string',
				name = 'sendPlayerName'
			},
			isSystem = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'bool',
				name = 'isSystem'
			},
			fujians = 
			{
				fieldNumber = 6,
				prefix = 'repeated',
				type = 'CmdReward',
				name = 'fujians'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdSystemDetail',
		type = 'message',
		name = 'CmdSystemDetail'
	},
	CmdPublishUnionCallupRspMsg = 
	{
		tmField = 
		{
			success = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'bool',
				name = 'success'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdPublishUnionCallupRspMsg',
		type = 'message',
		name = 'CmdPublishUnionCallupRspMsg'
	},
	CmdGetAllMailRspMsg = 
	{
		tmField = 
		{
			tlCmdMail = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdMail',
				name = 'tlCmdMail'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgMail.CmdGetAllMailRspMsg',
		type = 'message',
		name = 'CmdGetAllMailRspMsg'
	},
	CmdCancelUnionApplicationRspMsg = 
	{
		tmField = 
		{
			success = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'bool',
				name = 'success'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdCancelUnionApplicationRspMsg',
		type = 'message',
		name = 'CmdCancelUnionApplicationRspMsg'
	},
	CmdSendCityReqMsg = 
	{
		tmField = 
		{
			targetPlayerId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'targetPlayerId'
			},
			npcCityId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'npcCityId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCityBattle.CmdSendCityReqMsg',
		type = 'message',
		name = 'CmdSendCityReqMsg'
	},
	MessageBattle = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBattle.MessageBattle',
		enums = 
		{
			CmdQueryBattle = 11001,
			CmdTestBattle = 11000
		},
		type = 'enum',
		name = 'MessageBattle'
	},
	CmdListUnionsReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdListUnionsReqMsg',
		type = 'message',
		name = 'CmdListUnionsReqMsg'
	},
	CmdUpgradeUnionTechRspMsg = 
	{
		tmField = 
		{
			success = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'bool',
				name = 'success'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdUpgradeUnionTechRspMsg',
		type = 'message',
		name = 'CmdUpgradeUnionTechRspMsg'
	},
	CmdGetLeaderboardReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdGetLeaderboardReqMsg',
		type = 'message',
		name = 'CmdGetLeaderboardReqMsg'
	},
	CmdCampData_Update = 
	{
		tmField = 
		{
			cmdCacheUpdateByField = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'CmdCacheUpdateByField',
				name = 'cmdCacheUpdateByField'
			},
			cmdCampData = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'CmdCampData',
				name = 'cmdCampData'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdCampData_Update',
		type = 'message',
		name = 'CmdCampData_Update'
	},
	CmdSyncPlayerResourceRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.CmdSyncPlayerResourceRspMsg',
		type = 'message',
		name = 'CmdSyncPlayerResourceRspMsg'
	},
	MessageFuben = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgFuben.MessageFuben',
		enums = 
		{
			CmdRaidsFuben = 11103,
			CmdTakeFubenBox = 11104,
			CmdResetFuben = 11105,
			CmdGetFubenInfo = 11101,
			CmdFightFuben = 11102
		},
		type = 'enum',
		name = 'MessageFuben'
	},
	CmdBuildCancelRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuildCancelRspMsg',
		type = 'message',
		name = 'CmdBuildCancelRspMsg'
	},
	CmdPanicBuyRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdPanicBuyRspMsg',
		type = 'message',
		name = 'CmdPanicBuyRspMsg'
	},
	ActivityKind = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.ActivityKind',
		enums = 
		{
			LIMIT_LEADERBOARD = 5,
			SEVEN_DAY_RECHARGE = 4,
			CLASH_OF_KINGS = 6,
			SIGN = 1,
			SEVEN_DAY = 2,
			GROWTH_FUND = 3
		},
		type = 'enum',
		name = 'ActivityKind'
	},
	CmdCloseKingFightPanelReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdCloseKingFightPanelReqMsg',
		type = 'message',
		name = 'CmdCloseKingFightPanelReqMsg'
	},
	CmdUnionMember = 
	{
		tmField = 
		{
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			unionId = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int32',
				name = 'unionId'
			},
			contribution = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'int32',
				name = 'contribution'
			},
			playerName = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'string',
				name = 'playerName'
			},
			position = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'UnionPosition',
				name = 'position'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdUnionMember',
		type = 'message',
		name = 'CmdUnionMember'
	},
	CmdPrivateChatListReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgChat.CmdPrivateChatListReqMsg',
		type = 'message',
		name = 'CmdPrivateChatListReqMsg'
	},
	CmdBuildProduceSpeedReqMsg = 
	{
		tmField = 
		{
			refId = 
			{
				fieldNumber = 4,
				prefix = 'required',
				type = 'int32',
				name = 'refId'
			},
			lotId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'lotId'
			},
			num = 
			{
				fieldNumber = 5,
				prefix = 'required',
				type = 'int32',
				name = 'num'
			},
			id = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'id'
			},
			goodsType = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'GoodsType',
				name = 'goodsType'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBuildProduceSpeedReqMsg',
		type = 'message',
		name = 'CmdBuildProduceSpeedReqMsg'
	},
	CmdBarrackProduceRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBarrackProduceRspMsg',
		type = 'message',
		name = 'CmdBarrackProduceRspMsg'
	},
	CmdBuyCampShopInfoReqMsg = 
	{
		tmField = 
		{
			num = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'num'
			},
			id = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'id'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdBuyCampShopInfoReqMsg',
		type = 'message',
		name = 'CmdBuyCampShopInfoReqMsg'
	},
	CmdExchangeHeroRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdExchangeHeroRspMsg',
		type = 'message',
		name = 'CmdExchangeHeroRspMsg'
	},
	CmdUseBuffBallRspMsg = 
	{
		tmField = 
		{
			endTime = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'int64',
				name = 'endTime'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgItem.CmdUseBuffBallRspMsg',
		type = 'message',
		name = 'CmdUseBuffBallRspMsg'
	},
	CmdGetAllTroopRspMsg = 
	{
		tmField = 
		{
			cmdTroops = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdTroop',
				name = 'cmdTroops'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgTroop.CmdGetAllTroopRspMsg',
		type = 'message',
		name = 'CmdGetAllTroopRspMsg'
	},
	CmdAcceptUnionCallupRspMsg = 
	{
		tmField = 
		{
			success = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'bool',
				name = 'success'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdAcceptUnionCallupRspMsg',
		type = 'message',
		name = 'CmdAcceptUnionCallupRspMsg'
	},
	CmdEquipBreakDownRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgHero.CmdEquipBreakDownRspMsg',
		type = 'message',
		name = 'CmdEquipBreakDownRspMsg'
	},
	CmdTrainingProduceRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdTrainingProduceRspMsg',
		type = 'message',
		name = 'CmdTrainingProduceRspMsg'
	},
	Country = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCommon.Country',
		enums = 
		{
			QIN = 8,
			ZHOU = 1,
			HAN = 2,
			WEI = 4,
			ZHAO = 3,
			YAN = 6,
			CHU = 5,
			QI = 7
		},
		type = 'enum',
		name = 'Country'
	},
	CmdQueryHelpTroopReqMsg = 
	{
		tmField = 
		{
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			troopId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'troopId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdQueryHelpTroopReqMsg',
		type = 'message',
		name = 'CmdQueryHelpTroopReqMsg'
	},
	CmdPlayerActivity = 
	{
		tmField = 
		{
			activityKind = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'ActivityKind',
				name = 'activityKind'
			},
			canTakeAward = 
			{
				fieldNumber = 4,
				prefix = 'repeated',
				type = 'int32',
				name = 'canTakeAward'
			},
			extraInfo = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'bytes',
				name = 'extraInfo'
			},
			activityId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'activityId'
			},
			alreadyTakeAward = 
			{
				fieldNumber = 5,
				prefix = 'repeated',
				type = 'int32',
				name = 'alreadyTakeAward'
			},
			completeStatus = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'int32',
				name = 'completeStatus'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdPlayerActivity',
		type = 'message',
		name = 'CmdPlayerActivity'
	},
	CmdAcceptUnionCallupReqMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdAcceptUnionCallupReqMsg',
		type = 'message',
		name = 'CmdAcceptUnionCallupReqMsg'
	},
	CmdInjuryArmy_Update = 
	{
		tmField = 
		{
			cmdInjuryArmy_Key = 
			{
				fieldNumber = 2,
				prefix = 'repeated',
				type = 'CmdInjuryArmy_Key',
				name = 'cmdInjuryArmy_Key'
			},
			cmdInjuryArmy = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdInjuryArmy',
				name = 'cmdInjuryArmy'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgArmy.CmdInjuryArmy_Update',
		type = 'message',
		name = 'CmdInjuryArmy_Update'
	},
	CmdQueryWorldObjInSightReqMsg = 
	{
		tmField = 
		{
			pos = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'int32',
				name = 'pos'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdQueryWorldObjInSightReqMsg',
		type = 'message',
		name = 'CmdQueryWorldObjInSightReqMsg'
	},
	CmdGainCampTaskRewardRspMsg = 
	{
		tmField = 
		{

		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGainCampTaskRewardRspMsg',
		type = 'message',
		name = 'CmdGainCampTaskRewardRspMsg'
	},
	CmdMarchIntoCityReqMsg = 
	{
		tmField = 
		{
			troopId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'troopId'
			},
			expectEndTime = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'int64',
				name = 'expectEndTime'
			},
			itemNum = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'int32',
				name = 'itemNum'
			},
			pos = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'pos'
			},
			itemRefId = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'int32',
				name = 'itemRefId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdMarchIntoCityReqMsg',
		type = 'message',
		name = 'CmdMarchIntoCityReqMsg'
	},
	CmdBuyCampShopInfoRspMsg = 
	{
		tmField = 
		{
			tlCmdCampShopInfo = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'CmdCampShopInfo',
				name = 'tlCmdCampShopInfo'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdBuyCampShopInfoRspMsg',
		type = 'message',
		name = 'CmdBuyCampShopInfoRspMsg'
	},
	UnionPosition = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.UnionPosition',
		enums = 
		{
			UP_LEADER = 9,
			UP_MEMBER = 1,
			UP_NONE = 0,
			UP_DEPUTY_LEADER = 8
		},
		type = 'enum',
		name = 'UnionPosition'
	},
	LeaderboardType = 
	{
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgPlayer.LeaderboardType',
		enums = 
		{
			RANK_LEVEL = 4,
			RANK_POWER = 1,
			RANK_FUBEN = 2
		},
		type = 'enum',
		name = 'LeaderboardType'
	},
	CmdListUnionApplicationsRspMsg = 
	{
		tmField = 
		{
			application = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdUnionApplication',
				name = 'application'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdListUnionApplicationsRspMsg',
		type = 'message',
		name = 'CmdListUnionApplicationsRspMsg'
	},
	CmdQueryUnionInfoRspMsg = 
	{
		tmField = 
		{
			union = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'CmdUnion',
				name = 'union'
			},
			myData = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'CmdUnionMemberData',
				name = 'myData'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgUnion.CmdQueryUnionInfoRspMsg',
		type = 'message',
		name = 'CmdQueryUnionInfoRspMsg'
	},
	CmdGetNpcCityTroopReqMsg = 
	{
		tmField = 
		{
			pos = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'pos'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCityBattle.CmdGetNpcCityTroopReqMsg',
		type = 'message',
		name = 'CmdGetNpcCityTroopReqMsg'
	},
	CmdGetCampMemberRspMsg = 
	{
		tmField = 
		{
			nextQueryRecord = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'nextQueryRecord'
			},
			tlCmdSearchMemberInfo = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdSearchMemberInfo',
				name = 'tlCmdSearchMemberInfo'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgCamp.CmdGetCampMemberRspMsg',
		type = 'message',
		name = 'CmdGetCampMemberRspMsg'
	},
	CmdBarrackProduceReqMsg = 
	{
		tmField = 
		{
			armyRefId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'armyRefId'
			},
			lotId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'lotId'
			},
			num = 
			{
				fieldNumber = 3,
				prefix = 'required',
				type = 'int32',
				name = 'num'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgBuild.CmdBarrackProduceReqMsg',
		type = 'message',
		name = 'CmdBarrackProduceReqMsg'
	},
	CmdRepatriateHelpTroopReqMsg = 
	{
		tmField = 
		{
			playerId = 
			{
				fieldNumber = 1,
				prefix = 'required',
				type = 'int32',
				name = 'playerId'
			},
			troopId = 
			{
				fieldNumber = 2,
				prefix = 'required',
				type = 'int32',
				name = 'troopId'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdRepatriateHelpTroopReqMsg',
		type = 'message',
		name = 'CmdRepatriateHelpTroopReqMsg'
	},
	CmdGetCoordinateRspMsg = 
	{
		tmField = 
		{
			cmdCoordinateContent = 
			{
				fieldNumber = 1,
				prefix = 'repeated',
				type = 'CmdCoordinateContent',
				name = 'cmdCoordinateContent'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgWorld.CmdGetCoordinateRspMsg',
		type = 'message',
		name = 'CmdGetCoordinateRspMsg'
	},
	CmdSevenDayCondition = 
	{
		tmField = 
		{
			tlCmdSevenDayTaskRefData = 
			{
				fieldNumber = 6,
				prefix = 'optional',
				type = 'CmdSevenDayTaskRefData',
				name = 'tlCmdSevenDayTaskRefData'
			},
			buyNum = 
			{
				fieldNumber = 7,
				prefix = 'optional',
				type = 'int32',
				name = 'buyNum'
			},
			oldPrice = 
			{
				fieldNumber = 4,
				prefix = 'optional',
				type = 'int32',
				name = 'oldPrice'
			},
			rechargeGold = 
			{
				fieldNumber = 3,
				prefix = 'optional',
				type = 'int32',
				name = 'rechargeGold'
			},
			day = 
			{
				fieldNumber = 2,
				prefix = 'optional',
				type = 'int32',
				name = 'day'
			},
			sevenDaySubKind = 
			{
				fieldNumber = 1,
				prefix = 'optional',
				type = 'SevenDaySubKind',
				name = 'sevenDaySubKind'
			},
			newPrice = 
			{
				fieldNumber = 5,
				prefix = 'optional',
				type = 'int32',
				name = 'newPrice'
			}
		},
		fullName = 'com.gzyouai.hummingbird.daqin.cmd.msgActivity.CmdSevenDayCondition',
		type = 'message',
		name = 'CmdSevenDayCondition'
	}
}
return M
    