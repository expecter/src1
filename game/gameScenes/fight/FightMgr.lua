-----------------------------------------------------------------------------------------------  
-- @description 战报播放管理者   不参与动画生成
-- @author  郑泽森
-- @coryright  蜂鸟工作室
-- @release  2015/4/11
--------------------------------------------------------------------------------------------
local FightAnimationMgr=import(".FightAnimationMgr")
local FightAnimation=import(".FightAnimation")
-- local FightHeroSkillAniView=import(".FightHeroSkillAniView")
local M = {}
local tmDefGrids_=nil
local tmAttGrids_=nil
local fightData_=nil
local updateBoutFun_=nil
local skipFun_=nil
local yield=function()
    coroutine.yield()
end
function M.setData(params)
    tmDefGrids_=params.defGrids
    tmAttGrids_=params.attGrids
    fightData_=params.fightData
    updateBoutFun_=params.updateBoutFun
	skipFun_=params.skipFun
end
function M.initFightNpcPlist(anikey)
    FightAnimationMgr.initFightNpcPlist(anikey)
end
function M.removeFightNpcPlist()
    FightAnimationMgr.removeFightNpcPlist()
end
function M.removeFightEffectPlist()
    FightAnimationMgr.removeFightEffectPlist()
end
function M.starPlay()
    local starPlay=nil

    local resume=function()
        coroutine.resume(starPlay)
    end
    starPlay = coroutine.create(function ( data )
        FightAnimationMgr.initFightEffectPlist("public")
        -- 进场
        M.soldiersGoToFight(resume)
        yield()
        --播放技能动画
        M.playerAllHeroSkillAnimation(resume)
        yield()
        --开始播放战报
        print("starFight")
        M.starFight(resume)
        yield()
		skipFun_()
        print("endFight")
    end)
    coroutine.resume(starPlay)
end

--开始战斗
function M.starFight(callback)
    local starFightFun=nil
    local fightData=fightData_
    local resume=function()
        coroutine.resume(starFightFun)
    end
    starFightFun=coroutine.create(function ( data )
        for i=1,#fightData.bout do 
            print("开始大回合:"..i)
            local CmdBattleBout=fightData.bout[i]
            updateBoutFun_(i)
            M.bout({callBack=resume,CmdBattleBout=CmdBattleBout})
            yield()
            print("结束大回合:"..i)
        end
        FightAnimationMgr.runCCCallFunc(callback,0.01,GameSceneMgr.getRunningGameLayer())
    end )
    coroutine.resume(starFightFun)
end

--大回合开始
function M.bout(boutData)
    local bout=boutData.CmdBattleBout
    local callback=boutData.callBack
    local boutFun=nil
    local resume=function()
        coroutine.resume(boutFun)
    end
    boutFun=coroutine.create(function ( data )
        for i=1,#bout.round do 
            print("开始小回合:"..i)
            local CmdBattleRound=bout.round[i]
            
            M.round({callBack=resume,CmdBattleRound=CmdBattleRound})
            yield()
            print("结束小回合:"..i)
        end
        FightAnimationMgr.runCCCallFunc(callback,0.01,GameSceneMgr.getRunningGameLayer())
    end)
    coroutine.resume(boutFun)
end

--小回合开始
function M.round(roundData)
    local callback=roundData.callBack
    local round=roundData.CmdBattleRound
    local roundFun=nil

    local resume=function()
        coroutine.resume(roundFun)
    end
    roundFun=coroutine.create(function ( data )
        -- 小回合开始前
        if round.beforeRoundEvent then
            for i=1,#round.beforeRoundEvent do
                print("小回合之前开始:"..i)
                local CmdBattleEvent=round.beforeRoundEvent[i]
                M.eventHandler({callBack=resume,CmdBattleEvent=CmdBattleEvent})
                print("小回合之前结束:"..i)
                yield()
            end
        end
        -- 小小回合
        for i=1,#round.attackEvent do 
            print("开始攻击事件:"..i)
            local CmdBattleAttack=round.attackEvent[i]
            M.attackEvent({callBack=resume,CmdBattleAttack=CmdBattleAttack})
            yield()
            print("结束攻击事件:"..i)
        end
        -- 小回合结束
        if round.afterRoundEvent then
            for i=1,#round.afterRoundEvent do
                print("小回合之后开始:"..i)
                local CmdBattleEvent=round.afterRoundEvent[i]
                M.eventHandler({callBack=resume,CmdBattleEvent=CmdBattleEvent})
                print("小回合之后结束:"..i)
                yield()
            end
        end

        FightAnimationMgr.runCCCallFunc(callback,0.01,GameSceneMgr.getRunningGameLayer())
    end)
    coroutine.resume(roundFun)
end

--小小回合
function M.attackEvent(attackData)
    local callback=attackData.callBack
    local attackEvent=attackData.CmdBattleAttack
    local attackEventFun=nil

    local resume=function()
        coroutine.resume(attackEventFun)
    end
    attackEventFun=coroutine.create(function ( data )
        --合并折射事件
        local events=attackEvent.event--M.addReflectvent(attackEvent.event)
        -- M.sortAttackEvent(events)
        for i=1,#events do 
            print("开始事件:"..i)
            local CmdBattleEvent=events[i]
            M.eventHandler({callBack=resume,CmdBattleEvent=CmdBattleEvent})
            yield()
            print("结束事件:"..i)
        end
        FightAnimationMgr.runCCCallFunc(callback,FightAnimation.eventTime.hitTime,GameSceneMgr.getRunningGameLayer())
    end)
    coroutine.resume(attackEventFun)
end
-- 事件  具体做事内容
function M.eventHandler(eventData)
    local callback=eventData.callBack
    local event=eventData.CmdBattleEvent
    print(event.pos)
    -- dump(event,"事件数据")
    local eventType=event.eventType
    
    -- 获取格子
    local tmgrids=event.troopIndex==0 and tmAttGrids_ or tmDefGrids_
    local tmTargetgrids={}
    local time=0.01
    for i=1,#event.targetTroopIndex do
        local isAtt=event.targetTroopIndex[i]
        local targetGrids=isAtt==0 and tmAttGrids_ or tmDefGrids_
        local gridPos=event.targetPos[i]
        tmTargetgrids[isAtt.."_"..gridPos]=targetGrids[gridPos]
    end
    local viewGrid=tmgrids[event.pos]
    local params={viewGrid=viewGrid,event=event,targetgrids=tmTargetgrids}
    if eventType=="BET_ATTACK" 
        or eventType=="BET_COUNTER_ATTACK" 
        or eventType=="BET_DOUBLE_ATTACK"
        or eventType=="BET_SPECIAL_ATTACK"
        then
        print("loseAmount--------------------------:",event.loseAmount)
        -- 攻击动作
        time=M.BET_ATTACK(params)
    elseif eventType=="BET_DAMAGE" then
        -- 伤害
        params.animaTypes=event.damageAnima
        time=M.BET_DAMAGE(params)
    elseif eventType=="BET_REFLECT_ATTACK" then
        -- 特殊攻击类型，反射
        time=M.BET_REFLECT_ATTACK(params)
        dump(params)
    elseif eventType=="BET_DEATH" then
        -- 死亡
        M.BET_DEATH(params)
    elseif eventType=="BET_HEAL" then
        -- 治疗
        params.animaTypes={eventType}
        M.BET_HEAL(params)
    elseif eventType=="BET_ADD_BUFF" then
        -- 添加buff
        M.BET_ADD_BUFF(params)
    elseif eventType=="BET_REMOVE_BUFF" then
        -- 删除buff
        M.BET_REMOVE_BUFF(params)
    elseif eventType=="BET_MODIFY_BUFF" then
        M.BET_MODIFY_BUFF(params)
    end
    FightAnimationMgr.runCCCallFunc(callback,time,GameSceneMgr.getRunningGameLayer())
end
-- BET_ATTACK = 1; //攻击动作
function M.BET_ATTACK(datas)
    local viewGrid=datas.viewGrid
    local effbullet=viewGrid:getArmyData().effbullet
    local effhit=viewGrid:getArmyData().effhit
    local effrel=viewGrid:getArmyData().effrel
    local effData={effbullet=effbullet,effhit=effhit,effrel=effrel}
    local attTime=viewGrid:playAttAnimate()
    local btime,htime=viewGrid:playAttEffectAction(attTime,datas,effData)

--被攻击者带的特殊受击动画
    local callback=function()
        local attackHitAnimas=datas.event.attackHitAnima
        if attackHitAnimas then
            for i=1,#datas.event.targetTroopIndex do
                local index=datas.event.targetTroopIndex[i]
                local pos=datas.event.targetPos[i]
                local attackHitAnima=nil
                for j=1,#attackHitAnimas do
                    if attackHitAnimas[j].pos==pos then
                        attackHitAnima=attackHitAnimas[j].attackHitAnima
                        break
                    end
                end
                local targetGrids=datas.targetgrids--获取被攻击的格子
                local damgeaData={}
                damgeaData.event=datas.event
                local viewGrid=targetGrids[index.."_"..pos]
                damgeaData.viewGrid=viewGrid
                damgeaData.animaTypes=attackHitAnima
                if damgeaData.animaTypes then
                    M.BET_DAMAGE(damgeaData)
                end
            end
        end
    end
    FightAnimationMgr.runCCCallFunc(callback,attTime+btime,GameSceneMgr.getRunningGameLayer())
    local dtime=btime+htime+attTime
    return dtime
end
--特殊攻击 反击
function M.BET_REFLECT_ATTACK(datas)
    local viewGrid=datas.viewGrid
    local DisAttEffectAnimation=require("game.gameScenes.fight.ref.DisAttEffectAnimation")
    local effData=DisAttEffectAnimation[datas.event.eventType]
    local attEffectTime=viewGrid:playAttEffectAction(0.01,datas,effData)
    return 0.1   
end
--BET_DAMAGE = 2; //伤害
function M.BET_DAMAGE(datas)
    local viewGrid=datas.viewGrid
    local event=datas.event
    local time=0
    time=FightAnimationMgr.BET_DAMAGE(datas)
    return time
end   
--BET_DEATH = 3; //死亡
function M.BET_DEATH(datas)
    local viewGrid=datas.viewGrid
    local time=viewGrid:death()
    return 0.01
end   
    --BET_HEAL = 4; //治疗
function M.BET_HEAL(datas)
    local viewGrid=datas.viewGrid
    local event=datas.event
    local time=FightAnimationMgr.BET_DAMAGE(datas)
    return 0.01
end   
    --BET_ADD_BUFF = 11; //获得buff
function M.BET_ADD_BUFF(datas)
    local viewGrid=datas.viewGrid
    local event=datas.event
    local buffType=event.buffType
    local addBuffId=event.addBuffId

    if buffType=="BBT_XUAN_YUN"  then
        --      = 1; //眩晕
        viewGrid:addBuff()
    elseif buffType=="BBT_ZHUO_SHAO" then
        --  = 2; //灼烧
        viewGrid:addBuff()
    elseif buffType=="BBT_ZHONG_DU" then
        --  = 3; //中毒
        viewGrid:addBuff()
    elseif buffType=="BBT_LIU_XUE" then
        --  = 4; //流血
        viewGrid:addBuff()
    elseif buffType=="BBT_TIE_JI" then
        --  = 5; //铁骑
        viewGrid:addBuff()
    end
    return 0.01
end   
    --BET_REMOVE_BUFF = 12; //删除buff
function M.BET_REMOVE_BUFF(datas)
    local viewGrid=datas.viewGrid
    local event=datas.event
    local removeBuffId=event.removeBuffId
    -- viewGrid:testLabel("removeBuffId:"..removeBuffId,cc.c3b(255,255,0))
    return 0.01
end   
    -- BET_MODIFY_BUFF = 13; //修改buff
function M.BET_MODIFY_BUFF(datas)
    local event=datas.event
    local modifyBuffId=event.modifyBuffId
    -- viewGrid:testLabel("modifyBuffId:"..modifyBuffId,cc.c3b(0,0,255))
    return 0.01
end   

-- 所有士兵进场
function M.soldiersGoToFight(callback)
    local gotoData=FightAnimationMgr.getGotoFightData()
    for pos ,viewGrid in pairs(tmDefGrids_ ) do
        viewGrid:goToFight(gotoData.time)
    end

    for pos ,viewGrid in pairs(tmAttGrids_ ) do
        viewGrid:goToFight(gotoData.time)
    end
    FightAnimationMgr.runCCCallFunc(callback,gotoData.delayTime+gotoData.time,GameSceneMgr.getRunningGameLayer())
end
-- 播放武将技能效果
function M.playerAllHeroSkillAnimation(callback)
    
    local heroEff=FightHeroSkillAniView.new(fightData_.troop,callback)
    GameSceneMgr.getRunningGameLayer():addChild(heroEff)
    heroEff:setPosition(cc.p(display.cx,display.cy))
end

--设置技能添加层
function M.setSkillParentNode(node)
    FightAnimationMgr.setSkillParentNode(node)
end
--排序事件
function M.sortAttackEvent(events)
    table.sort(events, function (event1,event2)
        local value1=net.Proto.getEnumId("BattleEventType",event1.eventType)
        local value2=net.Proto.getEnumId("BattleEventType",event2.eventType)
        if value1<value2 then
            return true
        end
        return false
    end)
end
--合并折射事件
-- function M.addReflectvent(attackEvent)
--     local events={}
--     local isAddBDT_REFLECT={}
--     for i=1,#attackEvent do
--         local event=attackEvent[i]
--         --合并反射伤害
--         if event.eventType=="BET_DAMAGE" and event.damageType=="BDT_REFLECT" then
--             local key=event.troopIndex..event.pos
--             if isAddBDT_REFLECT[key] then
--                 for j=i+1,#attackEvent do
--                     local e=attackEvent[j]
--                     if e.troopIndex==event.troopIndex and e.pos==event.pos then
--                         event.damageValue=event.damageValue+e.damageValue
--                         break
--                     end
--                 end
--             else
--                 isAddBDT_REFLECT[key]=key
--                 events[#events+1]=event
--             end
--         else
--             events[#events+1]=event
--         end


--     end
--     return events
-- end
return M