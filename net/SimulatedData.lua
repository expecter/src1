local M = {
msgBattle = {
   QueryBattle={
        battleId = "",
   },

},
msgLogin = {
   RegisterPlayer={
        openId = "",
        ver = 0,
        channelSimpleName = "",
        imei = "",
        timestamp = "",
        imageId = "",
        userType = 0,
        ip = "",
        serverSign = "",
        serverId = 0,
        playerName = "",
   },
   Login={
        openId = "",
        ver = 0,
        channelSimpleName = "",
        imei = "",
        timestamp = "",
        userType = 0,
        sdkType = 0,
        ip = "",
        serverSign = "",
        serverId = 0,
   },

},
msgFuben = {
   RaidsFuben={
        fubenId = 0,
   },
   TakeFubenBox={
        chapterId = 0,
        index = 0,
   },
   ResetFuben={
        fubenId = 0,
   },
   GetFubenInfo={
   },
   FightFuben={
        troopId = 0,
        fubenId = 0,
   },

},
msgWorld = {
   CollectCoordinate={
        pos = 0,
   },
   MarchIntoCity={
        troopId = 0,
        expectEndTime = 0,
        itemNum = 0,
        pos = 0,
        itemRefId = 0,
   },
   SpeedUpRecall={
        troopId = 0,
   },
   DelCoordinate={
        pos = 0,
   },
   ReconnaissanceOfResourceGrid={
        pos = 0,
   },
   QueryWorldObjInSight={
        pos = 0,
   },
   MoveCity={
        targetPos = 0,
   },
   Recall={
        troopId = 0,
   },
   CloseWorldInterface={
   },
   QueryAlliedTroopOnResourceGrid={
        pos = 0,
   },
   QueryResourceGrid={
        pos = 0,
   },
   RepatriateHelpTroop={
        playerId = 0,
        troopId = 0,
   },
   Collect={
        troopId = 0,
        expectEndTime = 0,
        itemNum = 0,
        pos = 0,
        itemRefId = 0,
   },
   GetCoordinate={
   },
   SetDefendRule={
        autoDefend = false,
        helpPowerLimitRefId = 0,
        allowHelp = false,
   },
   CheckCoordinate={
        pos = 0,
   },
   QueryBattleField={
        pos = 0,
   },
   CloseBattleFieldInterface={
   },
   QueryHelpTroop={
        playerId = 0,
        troopId = 0,
   },
   QueryHelpTroopSummaries={
   },
   GetDefendRule={
   },
   ReconnaissanceOfPlayerCity={
        pos = 0,
   },

},
msgPlayer = {
   GetShieldPlayer={
   },
   Logout={
   },
   BuyVipBag={
        vipLevel = 0,
   },
   PlayerRename={
        name = "",
   },
   UnShieldPlayer={
        targetPlayerId = 0,
   },
   GetPlayerInfo={
        targetPlayerId = 0,
   },
   GetResourceInfo={
   },
   GetVipBag={
   },
   ShieldPlayer={
        targetPlayerId = 0,
   },
   GetLeaderboard={
   },
   SyncPlayerResource={
   },
   QueryNoticeFlag={
   },

},
msgCamp = {
   CloseKingFightPanel={
   },
   KingBet={
        coinIndex = 0,
        index = 0,
   },
   GainCampTaskReward={
        taskId = 0,
   },
   GetCampMember={
        firstRecord = 0,
   },
   SearchCampMember={
        playerName = "",
   },
   KingFight={
        index = 0,
   },
   AppointOffice={
        officeIndex = 0,
        targetPlayerId = 0,
        officeId = 0,
   },
   GetCampPlayerReport={
   },
   DrawSalary={
   },
   RefreshCampTask={
        taskType = 0,
   },
   DeclareBattle={
        y = 0,
        x = 0,
   },
   OpenKingFightPanel={
   },
   GetOfficeList={
   },
   BuyCampShopInfo={
        num = 0,
        id = 0,
   },
   GetCampReport={
   },
   GetCampShopInfo={
   },
   ChangeProvince={
        provinceId = 0,
   },
   GetCampTroop={
   },
   EditCampTroop={
        cmdCreateTroopInfo = {
        commandingGeneralId = 0,
        deputyGeneralId1 = 0,
        deputyGeneralId2 = 0,
        cmdArmyInfos = {{
        index = 0,
        cmdArmy = {
        num = 0,
        refId = 0,
        },
        }},
        },
   },
   GetCampTaskTimes={
   },
   ChangeStatus={
        isTargetDeclare = false,
        targetPlayerId = 0,
   },
   AcceptCampTask={
        taskId = 0,
        taskType = 0,
   },
   GetKingPlayer={
   },
   GiveUpCampTask={
        taskId = 0,
   },

},
msgCityBattle = {
   SendCity={
        targetPlayerId = 0,
        npcCityId = 0,
   },
   GetAllCityInfo={
        npcCityType = 0,
   },
   GetCityReport={
        y = 0,
        x = 0,
        type = 0,
   },
   CollectTax={
   },
   GetNpcCityTroop={
        pos = 0,
   },
   GrantCity={
        y = 0,
        x = 0,
        targetPlayerId = 0,
   },

},
msgUnion = {
   DisbandUnion={
   },
   QueryUnionBarracks={
   },
   BuyUnionArmy={
        armyRefId = 0,
        amount = 0,
   },
   HandleUnionApplication={
        playerId = 0,
        pass = false,
   },
   AcceptUnionCallup={
   },
   BuildUnionHall={
        buildType = 0,
   },
   ListUnionApplications={
   },
   QuitUnion={
   },
   KickOutUnionMember={
        playerId = 0,
   },
   ChangeUnionPosition={
        playerId = 0,
        position = "UP_LEADER",
   },
   ListUnionMemberStatus={
   },
   UpgradeUnionTech={
        techId = 0,
   },
   ApplyToJoinUnion={
        unionId = 0,
   },
   QueryUnionTeches={
   },
   CancelUnionApplication={
        unionId = 0,
   },
   SendUnionMail={
        content = "",
        title = "",
   },
   QueryUnionInfo={
        withMyData = false,
   },
   CreateUnion={
        name = "",
        declaration = "",
   },
   ListUnions={
   },
   EditUnion={
        icon = "",
        declaration = "",
   },
   QueryUnionCallup={
   },
   PublishUnionCallup={
   },

},
msgActivity = {
   PanicBuy={
        contentId = 0,
        activityId = 0,
   },
   GrowthFundBuy={
        activityId = 0,
   },
   PlayerActivityList={
   },
   ActivityInfoList={
   },
   TakeActivityAward={
        contentId = 0,
        activityId = 0,
   },
   ReSignActivity={
        contentId = 0,
        activityId = 0,
   },

},
msgHero = {
   HeroBreakDown={
        heroIds = {0},
   },
   CompoundHero={
        refId = 0,
   },
   HeroRebirth={
        heroId = 0,
   },
   EquipXilian={
        heroId = 0,
        equipId = 0,
        xilianMode = 0,
        index = {0},
   },
   HeroStep={
        heroId = 0,
        cardId = {0},
   },
   HeroEquipLevel={
        heroId = 0,
        equipId = 0,
   },
   ConfirmEquipXilian={
        heroId = 0,
        equipId = 0,
        index = {0},
   },
   CancelEquipXilian={
        heroId = 0,
        equipId = 0,
        index = {0},
   },

},
msgChat = {
   PrivateChatList={
   },
   SendChat={
        chatKind = "JUNTUAN",
        receivePlayerId = 0,
        expandMsg = "",
        msg = "",
   },
   DelPrivateChat={
        targetPlayerId = 0,
   },
   GetChat={
        chatKind = "JUNTUAN",
   },
   CheckPrivateChat={
        targetPlayerId = 0,
   },

},
msgMail = {
   DelMail={
        id = {0},
        mailType = "BattleMail",
   },
   GetFuJian={
        id = 0,
   },
   ReadMail={
        id = 0,
        mailType = "BattleMail",
   },
   GetAllMail={
   },

},
msgTask = {
   GetActiveTask={
   },
   TakeActiveBag={
        refId = 0,
   },
   TakeTask={
        refId = 0,
   },
   TakeActiveTask={
        refId = 0,
   },

},
msgTroop = {
   ExchangeArmy={
        troopId = 0,
        index = 0,
        targetIndex = 0,
   },
   EditArmy={
        troopId = 0,
        index = 0,
        cmdArmyInfo = {
        index = 0,
        cmdArmy = {
        num = 0,
        refId = 0,
        },
        },
   },
   DismissTroop={
        troopId = 0,
   },
   ExchangeHero={
        heroId = 0,
        targetHeroId = 0,
   },
   EditTroop={
        troopId = 0,
        heroId = 0,
        type = 0,
        index = 0,
   },
   GetAllTroop={
   },
   AutoArmy={
        troopId = 0,
        type = 0,
   },

},
msgChouka = {
   GetSoulShopInfo={
   },
   GetChoukaInfo={
   },
   JinChouka={
        tenChou = false,
   },
   RefreshSoulShop={
   },
   YinChouka={
        tenChou = false,
   },
   BuySoulShopGoods={
        goodsId = 0,
   },

},
msgItem = {
   DeleteItem={
        num = 0,
        id = 0,
   },
   UseBuffBall={
        num = 0,
        id = 0,
   },
   UseHeroExpBall={
        heroId = 0,
        num = 0,
        itemRefId = 0,
   },
   UsePacket={
        num = 0,
        id = 0,
   },
   BuyResource={
        goodsType = "Exp",
   },
   BuyItem={
        num = 0,
        isUse = false,
        refId = 0,
        goodsType = "Exp",
   },
   GetAllItem={
   },
   OpenBagNum={
        num = 0,
   },

},
msgBuild = {
   BuildProduceSpeed={
        refId = 0,
        lotId = 0,
        num = 0,
        id = 0,
        goodsType = "Exp",
   },
   HospitalProduce={
        tlCmdArmy = {{
        num = 0,
        refId = 0,
        }},
        lotId = 0,
   },
   BuildProduceCancel={
        lotId = 0,
        id = 0,
   },
   BuildCancel={
        lotId = 0,
   },
   GetBuildQueue={
        lotId = 0,
   },
   TrainingProduce={
        tlCmdArmy = {{
        num = 0,
        refId = 0,
        }},
        lotId = 0,
   },
   BuildConstruct={
        lotId = 0,
        refId = 0,
   },
   CityExpand={
   },
   OpenProduceQueue={
        lotId = 0,
   },
   BuildUpgrade={
        lotId = 0,
   },
   BarrackProduce={
        armyRefId = 0,
        lotId = 0,
        num = 0,
   },
   AcademyProduce={
        techId = 0,
        lotId = 0,
   },
   BuildSpeed={
        lotId = 0,
        num = 0,
        refId = 0,
        goodsType = "Exp",
   },
   BuyBuildQueue={
   },
   GetProduceQueue={
        lotId = 0,
   },

},
}
return M