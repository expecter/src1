
local M = {}

M.msgBattle = {}

--battleId

M.msgBattle.QueryBattle = function( params,callback )
    M.networkRequest("CmdQueryBattle",params,callback)   
end    


M.msgLogin = {}

--openId
--ver
--channelSimpleName
--imei
--timestamp
--imageId
--userType
--ip
--serverSign
--serverId
--playerName

M.msgLogin.RegisterPlayer = function( params,callback )
    M.networkRequest("CmdRegisterPlayer",params,callback)   
end    

--openId
--ver
--channelSimpleName
--imei
--timestamp
--userType
--sdkType
--ip
--serverSign
--serverId

M.msgLogin.Login = function( params,callback )
    M.networkRequest("CmdLogin",params,callback)   
end    


M.msgFuben = {}

--fubenId

M.msgFuben.RaidsFuben = function( params,callback )
    M.networkRequest("CmdRaidsFuben",params,callback)   
end    

--chapterId
--index

M.msgFuben.TakeFubenBox = function( params,callback )
    M.networkRequest("CmdTakeFubenBox",params,callback)   
end    

--fubenId

M.msgFuben.ResetFuben = function( params,callback )
    M.networkRequest("CmdResetFuben",params,callback)   
end    


M.msgFuben.GetFubenInfo = function( params,callback )
    M.networkRequest("CmdGetFubenInfo",params,callback)   
end    

--troopId
--fubenId

M.msgFuben.FightFuben = function( params,callback )
    M.networkRequest("CmdFightFuben",params,callback)   
end    


M.msgWorld = {}

--pos

M.msgWorld.CollectCoordinate = function( params,callback )
    M.networkRequest("CmdCollectCoordinate",params,callback)   
end    

--troopId
--expectEndTime
--itemNum
--pos
--itemRefId

M.msgWorld.MarchIntoCity = function( params,callback )
    M.networkRequest("CmdMarchIntoCity",params,callback)   
end    

--troopId

M.msgWorld.SpeedUpRecall = function( params,callback )
    M.networkRequest("CmdSpeedUpRecall",params,callback)   
end    

--pos

M.msgWorld.DelCoordinate = function( params,callback )
    M.networkRequest("CmdDelCoordinate",params,callback)   
end    

--pos

M.msgWorld.ReconnaissanceOfResourceGrid = function( params,callback )
    M.networkRequest("CmdReconnaissanceOfResourceGrid",params,callback)   
end    

--pos

M.msgWorld.QueryWorldObjInSight = function( params,callback )
    M.networkRequest("CmdQueryWorldObjInSight",params,callback)   
end    

--targetPos

M.msgWorld.MoveCity = function( params,callback )
    M.networkRequest("CmdMoveCity",params,callback)   
end    

--troopId

M.msgWorld.Recall = function( params,callback )
    M.networkRequest("CmdRecall",params,callback)   
end    


M.msgWorld.CloseWorldInterface = function( params,callback )
    M.networkRequest("CmdCloseWorldInterface",params,callback)   
end    

--pos

M.msgWorld.QueryAlliedTroopOnResourceGrid = function( params,callback )
    M.networkRequest("CmdQueryAlliedTroopOnResourceGrid",params,callback)   
end    

--pos

M.msgWorld.QueryResourceGrid = function( params,callback )
    M.networkRequest("CmdQueryResourceGrid",params,callback)   
end    

--playerId
--troopId

M.msgWorld.RepatriateHelpTroop = function( params,callback )
    M.networkRequest("CmdRepatriateHelpTroop",params,callback)   
end    

--troopId
--expectEndTime
--itemNum
--pos
--itemRefId

M.msgWorld.Collect = function( params,callback )
    M.networkRequest("CmdCollect",params,callback)   
end    


M.msgWorld.GetCoordinate = function( params,callback )
    M.networkRequest("CmdGetCoordinate",params,callback)   
end    

--autoDefend
--helpPowerLimitRefId
--allowHelp

M.msgWorld.SetDefendRule = function( params,callback )
    M.networkRequest("CmdSetDefendRule",params,callback)   
end    

--pos

M.msgWorld.CheckCoordinate = function( params,callback )
    M.networkRequest("CmdCheckCoordinate",params,callback)   
end    

--pos

M.msgWorld.QueryBattleField = function( params,callback )
    M.networkRequest("CmdQueryBattleField",params,callback)   
end    


M.msgWorld.CloseBattleFieldInterface = function( params,callback )
    M.networkRequest("CmdCloseBattleFieldInterface",params,callback)   
end    

--playerId
--troopId

M.msgWorld.QueryHelpTroop = function( params,callback )
    M.networkRequest("CmdQueryHelpTroop",params,callback)   
end    


M.msgWorld.QueryHelpTroopSummaries = function( params,callback )
    M.networkRequest("CmdQueryHelpTroopSummaries",params,callback)   
end    


M.msgWorld.GetDefendRule = function( params,callback )
    M.networkRequest("CmdGetDefendRule",params,callback)   
end    

--pos

M.msgWorld.ReconnaissanceOfPlayerCity = function( params,callback )
    M.networkRequest("CmdReconnaissanceOfPlayerCity",params,callback)   
end    


M.msgPlayer = {}


M.msgPlayer.GetShieldPlayer = function( params,callback )
    M.networkRequest("CmdGetShieldPlayer",params,callback)   
end    


M.msgPlayer.Logout = function( params,callback )
    M.networkRequest("CmdLogout",params,callback)   
end    

--vipLevel

M.msgPlayer.BuyVipBag = function( params,callback )
    M.networkRequest("CmdBuyVipBag",params,callback)   
end    

--name

M.msgPlayer.PlayerRename = function( params,callback )
    M.networkRequest("CmdPlayerRename",params,callback)   
end    

--targetPlayerId

M.msgPlayer.UnShieldPlayer = function( params,callback )
    M.networkRequest("CmdUnShieldPlayer",params,callback)   
end    

--targetPlayerId

M.msgPlayer.GetPlayerInfo = function( params,callback )
    M.networkRequest("CmdGetPlayerInfo",params,callback)   
end    


M.msgPlayer.GetResourceInfo = function( params,callback )
    M.networkRequest("CmdGetResourceInfo",params,callback)   
end    


M.msgPlayer.GetVipBag = function( params,callback )
    M.networkRequest("CmdGetVipBag",params,callback)   
end    

--targetPlayerId

M.msgPlayer.ShieldPlayer = function( params,callback )
    M.networkRequest("CmdShieldPlayer",params,callback)   
end    


M.msgPlayer.GetLeaderboard = function( params,callback )
    M.networkRequest("CmdGetLeaderboard",params,callback)   
end    


M.msgPlayer.SyncPlayerResource = function( params,callback )
    M.networkRequest("CmdSyncPlayerResource",params,callback)   
end    


M.msgPlayer.QueryNoticeFlag = function( params,callback )
    M.networkRequest("CmdQueryNoticeFlag",params,callback)   
end    


M.msgCamp = {}


M.msgCamp.CloseKingFightPanel = function( params,callback )
    M.networkRequest("CmdCloseKingFightPanel",params,callback)   
end    

--coinIndex
--index

M.msgCamp.KingBet = function( params,callback )
    M.networkRequest("CmdKingBet",params,callback)   
end    

--taskId

M.msgCamp.GainCampTaskReward = function( params,callback )
    M.networkRequest("CmdGainCampTaskReward",params,callback)   
end    

--firstRecord

M.msgCamp.GetCampMember = function( params,callback )
    M.networkRequest("CmdGetCampMember",params,callback)   
end    

--playerName

M.msgCamp.SearchCampMember = function( params,callback )
    M.networkRequest("CmdSearchCampMember",params,callback)   
end    

--index

M.msgCamp.KingFight = function( params,callback )
    M.networkRequest("CmdKingFight",params,callback)   
end    

--officeIndex
--targetPlayerId
--officeId

M.msgCamp.AppointOffice = function( params,callback )
    M.networkRequest("CmdAppointOffice",params,callback)   
end    


M.msgCamp.GetCampPlayerReport = function( params,callback )
    M.networkRequest("CmdGetCampPlayerReport",params,callback)   
end    


M.msgCamp.DrawSalary = function( params,callback )
    M.networkRequest("CmdDrawSalary",params,callback)   
end    

--taskType

M.msgCamp.RefreshCampTask = function( params,callback )
    M.networkRequest("CmdRefreshCampTask",params,callback)   
end    

--y
--x

M.msgCamp.DeclareBattle = function( params,callback )
    M.networkRequest("CmdDeclareBattle",params,callback)   
end    


M.msgCamp.OpenKingFightPanel = function( params,callback )
    M.networkRequest("CmdOpenKingFightPanel",params,callback)   
end    


M.msgCamp.GetOfficeList = function( params,callback )
    M.networkRequest("CmdGetOfficeList",params,callback)   
end    

--num
--id

M.msgCamp.BuyCampShopInfo = function( params,callback )
    M.networkRequest("CmdBuyCampShopInfo",params,callback)   
end    


M.msgCamp.GetCampReport = function( params,callback )
    M.networkRequest("CmdGetCampReport",params,callback)   
end    


M.msgCamp.GetCampShopInfo = function( params,callback )
    M.networkRequest("CmdGetCampShopInfo",params,callback)   
end    

--provinceId

M.msgCamp.ChangeProvince = function( params,callback )
    M.networkRequest("CmdChangeProvince",params,callback)   
end    


M.msgCamp.GetCampTroop = function( params,callback )
    M.networkRequest("CmdGetCampTroop",params,callback)   
end    

--cmdCreateTroopInfo

M.msgCamp.EditCampTroop = function( params,callback )
    M.networkRequest("CmdEditCampTroop",params,callback)   
end    


M.msgCamp.GetCampTaskTimes = function( params,callback )
    M.networkRequest("CmdGetCampTaskTimes",params,callback)   
end    

--isTargetDeclare
--targetPlayerId

M.msgCamp.ChangeStatus = function( params,callback )
    M.networkRequest("CmdChangeStatus",params,callback)   
end    

--taskId
--taskType

M.msgCamp.AcceptCampTask = function( params,callback )
    M.networkRequest("CmdAcceptCampTask",params,callback)   
end    


M.msgCamp.GetKingPlayer = function( params,callback )
    M.networkRequest("CmdGetKingPlayer",params,callback)   
end    

--taskId

M.msgCamp.GiveUpCampTask = function( params,callback )
    M.networkRequest("CmdGiveUpCampTask",params,callback)   
end    


M.msgCityBattle = {}

--targetPlayerId
--npcCityId

M.msgCityBattle.SendCity = function( params,callback )
    M.networkRequest("CmdSendCity",params,callback)   
end    

--npcCityType

M.msgCityBattle.GetAllCityInfo = function( params,callback )
    M.networkRequest("CmdGetAllCityInfo",params,callback)   
end    

--y
--x
--type

M.msgCityBattle.GetCityReport = function( params,callback )
    M.networkRequest("CmdGetCityReport",params,callback)   
end    


M.msgCityBattle.CollectTax = function( params,callback )
    M.networkRequest("CmdCollectTax",params,callback)   
end    

--pos

M.msgCityBattle.GetNpcCityTroop = function( params,callback )
    M.networkRequest("CmdGetNpcCityTroop",params,callback)   
end    

--y
--x
--targetPlayerId

M.msgCityBattle.GrantCity = function( params,callback )
    M.networkRequest("CmdGrantCity",params,callback)   
end    


M.msgUnion = {}


M.msgUnion.DisbandUnion = function( params,callback )
    M.networkRequest("CmdDisbandUnion",params,callback)   
end    


M.msgUnion.QueryUnionBarracks = function( params,callback )
    M.networkRequest("CmdQueryUnionBarracks",params,callback)   
end    

--armyRefId
--amount

M.msgUnion.BuyUnionArmy = function( params,callback )
    M.networkRequest("CmdBuyUnionArmy",params,callback)   
end    

--playerId
--pass

M.msgUnion.HandleUnionApplication = function( params,callback )
    M.networkRequest("CmdHandleUnionApplication",params,callback)   
end    


M.msgUnion.AcceptUnionCallup = function( params,callback )
    M.networkRequest("CmdAcceptUnionCallup",params,callback)   
end    

--buildType

M.msgUnion.BuildUnionHall = function( params,callback )
    M.networkRequest("CmdBuildUnionHall",params,callback)   
end    


M.msgUnion.ListUnionApplications = function( params,callback )
    M.networkRequest("CmdListUnionApplications",params,callback)   
end    


M.msgUnion.QuitUnion = function( params,callback )
    M.networkRequest("CmdQuitUnion",params,callback)   
end    

--playerId

M.msgUnion.KickOutUnionMember = function( params,callback )
    M.networkRequest("CmdKickOutUnionMember",params,callback)   
end    

--playerId
--position

M.msgUnion.ChangeUnionPosition = function( params,callback )
    M.networkRequest("CmdChangeUnionPosition",params,callback)   
end    


M.msgUnion.ListUnionMemberStatus = function( params,callback )
    M.networkRequest("CmdListUnionMemberStatus",params,callback)   
end    

--techId

M.msgUnion.UpgradeUnionTech = function( params,callback )
    M.networkRequest("CmdUpgradeUnionTech",params,callback)   
end    

--unionId

M.msgUnion.ApplyToJoinUnion = function( params,callback )
    M.networkRequest("CmdApplyToJoinUnion",params,callback)   
end    


M.msgUnion.QueryUnionTeches = function( params,callback )
    M.networkRequest("CmdQueryUnionTeches",params,callback)   
end    

--unionId

M.msgUnion.CancelUnionApplication = function( params,callback )
    M.networkRequest("CmdCancelUnionApplication",params,callback)   
end    

--content
--title

M.msgUnion.SendUnionMail = function( params,callback )
    M.networkRequest("CmdSendUnionMail",params,callback)   
end    

--withMyData

M.msgUnion.QueryUnionInfo = function( params,callback )
    M.networkRequest("CmdQueryUnionInfo",params,callback)   
end    

--name
--declaration

M.msgUnion.CreateUnion = function( params,callback )
    M.networkRequest("CmdCreateUnion",params,callback)   
end    


M.msgUnion.ListUnions = function( params,callback )
    M.networkRequest("CmdListUnions",params,callback)   
end    

--icon
--declaration

M.msgUnion.EditUnion = function( params,callback )
    M.networkRequest("CmdEditUnion",params,callback)   
end    


M.msgUnion.QueryUnionCallup = function( params,callback )
    M.networkRequest("CmdQueryUnionCallup",params,callback)   
end    


M.msgUnion.PublishUnionCallup = function( params,callback )
    M.networkRequest("CmdPublishUnionCallup",params,callback)   
end    


M.msgActivity = {}

--contentId
--activityId

M.msgActivity.PanicBuy = function( params,callback )
    M.networkRequest("CmdPanicBuy",params,callback)   
end    

--activityId

M.msgActivity.GrowthFundBuy = function( params,callback )
    M.networkRequest("CmdGrowthFundBuy",params,callback)   
end    


M.msgActivity.PlayerActivityList = function( params,callback )
    M.networkRequest("CmdPlayerActivityList",params,callback)   
end    


M.msgActivity.ActivityInfoList = function( params,callback )
    M.networkRequest("CmdActivityInfoList",params,callback)   
end    

--contentId
--activityId

M.msgActivity.TakeActivityAward = function( params,callback )
    M.networkRequest("CmdTakeActivityAward",params,callback)   
end    

--contentId
--activityId

M.msgActivity.ReSignActivity = function( params,callback )
    M.networkRequest("CmdReSignActivity",params,callback)   
end    


M.msgHero = {}

--heroIds

M.msgHero.HeroBreakDown = function( params,callback )
    M.networkRequest("CmdHeroBreakDown",params,callback)   
end    

--refId

M.msgHero.CompoundHero = function( params,callback )
    M.networkRequest("CmdCompoundHero",params,callback)   
end    

--heroId

M.msgHero.HeroRebirth = function( params,callback )
    M.networkRequest("CmdHeroRebirth",params,callback)   
end    

--heroId
--equipId
--xilianMode
--index

M.msgHero.EquipXilian = function( params,callback )
    M.networkRequest("CmdEquipXilian",params,callback)   
end    

--heroId
--cardId

M.msgHero.HeroStep = function( params,callback )
    M.networkRequest("CmdHeroStep",params,callback)   
end    

--heroId
--equipId

M.msgHero.HeroEquipLevel = function( params,callback )
    M.networkRequest("CmdHeroEquipLevel",params,callback)   
end    

--heroId
--equipId
--index

M.msgHero.ConfirmEquipXilian = function( params,callback )
    M.networkRequest("CmdConfirmEquipXilian",params,callback)   
end    

--heroId
--equipId
--index

M.msgHero.CancelEquipXilian = function( params,callback )
    M.networkRequest("CmdCancelEquipXilian",params,callback)   
end    


M.msgChat = {}


M.msgChat.PrivateChatList = function( params,callback )
    M.networkRequest("CmdPrivateChatList",params,callback)   
end    

--chatKind
--receivePlayerId
--expandMsg
--msg

M.msgChat.SendChat = function( params,callback )
    M.networkRequest("CmdSendChat",params,callback)   
end    

--targetPlayerId

M.msgChat.DelPrivateChat = function( params,callback )
    M.networkRequest("CmdDelPrivateChat",params,callback)   
end    

--chatKind

M.msgChat.GetChat = function( params,callback )
    M.networkRequest("CmdGetChat",params,callback)   
end    

--targetPlayerId

M.msgChat.CheckPrivateChat = function( params,callback )
    M.networkRequest("CmdCheckPrivateChat",params,callback)   
end    


M.msgMail = {}

--id
--mailType

M.msgMail.DelMail = function( params,callback )
    M.networkRequest("CmdDelMail",params,callback)   
end    

--id

M.msgMail.GetFuJian = function( params,callback )
    M.networkRequest("CmdGetFuJian",params,callback)   
end    

--id
--mailType

M.msgMail.ReadMail = function( params,callback )
    M.networkRequest("CmdReadMail",params,callback)   
end    


M.msgMail.GetAllMail = function( params,callback )
    M.networkRequest("CmdGetAllMail",params,callback)   
end    


M.msgTask = {}


M.msgTask.GetActiveTask = function( params,callback )
    M.networkRequest("CmdGetActiveTask",params,callback)   
end    

--refId

M.msgTask.TakeActiveBag = function( params,callback )
    M.networkRequest("CmdTakeActiveBag",params,callback)   
end    

--refId

M.msgTask.TakeTask = function( params,callback )
    M.networkRequest("CmdTakeTask",params,callback)   
end    

--refId

M.msgTask.TakeActiveTask = function( params,callback )
    M.networkRequest("CmdTakeActiveTask",params,callback)   
end    


M.msgTroop = {}

--troopId
--index
--targetIndex

M.msgTroop.ExchangeArmy = function( params,callback )
    M.networkRequest("CmdExchangeArmy",params,callback)   
end    

--troopId
--index
--cmdArmyInfo

M.msgTroop.EditArmy = function( params,callback )
    M.networkRequest("CmdEditArmy",params,callback)   
end    

--troopId

M.msgTroop.DismissTroop = function( params,callback )
    M.networkRequest("CmdDismissTroop",params,callback)   
end    

--heroId
--targetHeroId

M.msgTroop.ExchangeHero = function( params,callback )
    M.networkRequest("CmdExchangeHero",params,callback)   
end    

--troopId
--heroId
--type
--index

M.msgTroop.EditTroop = function( params,callback )
    M.networkRequest("CmdEditTroop",params,callback)   
end    


M.msgTroop.GetAllTroop = function( params,callback )
    M.networkRequest("CmdGetAllTroop",params,callback)   
end    

--troopId
--type

M.msgTroop.AutoArmy = function( params,callback )
    M.networkRequest("CmdAutoArmy",params,callback)   
end    


M.msgChouka = {}


M.msgChouka.GetSoulShopInfo = function( params,callback )
    M.networkRequest("CmdGetSoulShopInfo",params,callback)   
end    


M.msgChouka.GetChoukaInfo = function( params,callback )
    M.networkRequest("CmdGetChoukaInfo",params,callback)   
end    

--tenChou

M.msgChouka.JinChouka = function( params,callback )
    M.networkRequest("CmdJinChouka",params,callback)   
end    


M.msgChouka.RefreshSoulShop = function( params,callback )
    M.networkRequest("CmdRefreshSoulShop",params,callback)   
end    

--tenChou

M.msgChouka.YinChouka = function( params,callback )
    M.networkRequest("CmdYinChouka",params,callback)   
end    

--goodsId

M.msgChouka.BuySoulShopGoods = function( params,callback )
    M.networkRequest("CmdBuySoulShopGoods",params,callback)   
end    


M.msgItem = {}

--num
--id

M.msgItem.DeleteItem = function( params,callback )
    M.networkRequest("CmdDeleteItem",params,callback)   
end    

--num
--id

M.msgItem.UseBuffBall = function( params,callback )
    M.networkRequest("CmdUseBuffBall",params,callback)   
end    

--heroId
--num
--itemRefId

M.msgItem.UseHeroExpBall = function( params,callback )
    M.networkRequest("CmdUseHeroExpBall",params,callback)   
end    

--num
--id

M.msgItem.UsePacket = function( params,callback )
    M.networkRequest("CmdUsePacket",params,callback)   
end    

--goodsType

M.msgItem.BuyResource = function( params,callback )
    M.networkRequest("CmdBuyResource",params,callback)   
end    

--num
--isUse
--refId
--goodsType

M.msgItem.BuyItem = function( params,callback )
    M.networkRequest("CmdBuyItem",params,callback)   
end    


M.msgItem.GetAllItem = function( params,callback )
    M.networkRequest("CmdGetAllItem",params,callback)   
end    

--num

M.msgItem.OpenBagNum = function( params,callback )
    M.networkRequest("CmdOpenBagNum",params,callback)   
end    


M.msgBuild = {}

--refId
--lotId
--num
--id
--goodsType

M.msgBuild.BuildProduceSpeed = function( params,callback )
    M.networkRequest("CmdBuildProduceSpeed",params,callback)   
end    

--tlCmdArmy
--lotId

M.msgBuild.HospitalProduce = function( params,callback )
    M.networkRequest("CmdHospitalProduce",params,callback)   
end    

--lotId
--id

M.msgBuild.BuildProduceCancel = function( params,callback )
    M.networkRequest("CmdBuildProduceCancel",params,callback)   
end    

--lotId

M.msgBuild.BuildCancel = function( params,callback )
    M.networkRequest("CmdBuildCancel",params,callback)   
end    

--lotId

M.msgBuild.GetBuildQueue = function( params,callback )
    M.networkRequest("CmdGetBuildQueue",params,callback)   
end    

--tlCmdArmy
--lotId

M.msgBuild.TrainingProduce = function( params,callback )
    M.networkRequest("CmdTrainingProduce",params,callback)   
end    

--lotId
--refId

M.msgBuild.BuildConstruct = function( params,callback )
    M.networkRequest("CmdBuildConstruct",params,callback)   
end    


M.msgBuild.CityExpand = function( params,callback )
    M.networkRequest("CmdCityExpand",params,callback)   
end    

--lotId

M.msgBuild.OpenProduceQueue = function( params,callback )
    M.networkRequest("CmdOpenProduceQueue",params,callback)   
end    

--lotId

M.msgBuild.BuildUpgrade = function( params,callback )
    M.networkRequest("CmdBuildUpgrade",params,callback)   
end    

--armyRefId
--lotId
--num

M.msgBuild.BarrackProduce = function( params,callback )
    M.networkRequest("CmdBarrackProduce",params,callback)   
end    

--techId
--lotId

M.msgBuild.AcademyProduce = function( params,callback )
    M.networkRequest("CmdAcademyProduce",params,callback)   
end    

--lotId
--num
--refId
--goodsType

M.msgBuild.BuildSpeed = function( params,callback )
    M.networkRequest("CmdBuildSpeed",params,callback)   
end    


M.msgBuild.BuyBuildQueue = function( params,callback )
    M.networkRequest("CmdBuyBuildQueue",params,callback)   
end    

--lotId

M.msgBuild.GetProduceQueue = function( params,callback )
    M.networkRequest("CmdGetProduceQueue",params,callback)   
end    


M.networkRequest = function(msgId,params,callback)
    net.Client.request{
        messageName = msgId, 
        params = params, 
        fCallback = callback,
    } 
end  

return M
