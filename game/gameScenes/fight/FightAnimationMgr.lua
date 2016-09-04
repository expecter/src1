-----------------------------------------------------------------------------------------------  
-- @description 动画管理者   负责生成战场动画
-- @author  郑泽森
-- @coryright  蜂鸟工作室
-- @release  2015/4/11
--------------------------------------------------------------------------------------------
local FightAnimation=import(".FightAnimation")
-- local SoldiersContentOffset=import(".ref.SoldiersContentOffset")
local refNpcAnimation=require("game.ref.json.refNpcAnimation")
-- local ArmySkillEffectAnimation=import(".ref.ArmySkillEffectAnimation")
-- local HitEffectAnimation=import(".ref.HitEffectAnimation")
local ACTIONTAG={
	att1=1,
	att2=2,
	run1=3,
	run2=4,
	hit1=5,
	hit2=6,
	stanby1=7,
	stanby2=8,
}
local ATTTYPE={
    one="one",
    all="all",
    row="row",
    col="col",
}
local PLAYNODE={
    npc="npc",
    grid="grid",
}       
local PLAYPATH={
    bezier="bezier",--贝塞尔
    move="move",--直线
    arrow="arrow",--贝塞尔转角度
    moveArrow="moveArrow",--直线转角度
}
local ANITYPE={
    img="img",
    ccbi="ccbi"
}
local M = class(...)
local GridNodeWH={w=236,h=120}
M.SKILL_EFFECT_LAYER=nil
M.SKILL_ZORDER=640
M.NPCPLISTS={}
M.EFFECTPLISTS={}
--------------------------------------------------获取对应的效果数据
function M.getEffectAnimationData(key)
    return ArmySkillEffectAnimation[key]
end
--------------------------------------------------获取进入战场配置
function M.getGotoFightData()
    return FightAnimation.goToFight
end
--------------------------------------------------删除特效资源
---------------------------------------------------------------------
function M.removeFightEffectPlist()
    for k,v in pairs(M.EFFECTPLISTS) do
        display.removeSpriteFramesWithFile(k..".plist", k..".png")
    end
    M.EFFECTPLISTS={}
end
--------------------------------------------------添加特效资源
function M.initFightEffectPlist(aniId)
    local plist=string.format("uires/effect/skill/%s/plist_skill_effect_%s",aniId,aniId)
    local path=cc.FileUtils:getInstance():fullPathForFilename(plist..".plist")
    if cc.FileUtils:getInstance():isFileExist(path) then
        if M.EFFECTPLISTS[plist] then return end
        M.EFFECTPLISTS[plist]=plist
        display.addSpriteFrames(plist..".plist",plist..".png")
    end
end
--------------------------------------------------删除npc对应plist
function M.removeFightNpcPlist()
    for k,v in pairs(M.NPCPLISTS) do
        display.removeSpriteFramesWithFile("uires/effect/npc/"..k..".plist", "uires/effect/npc/"..k..".png")
    end
    M.NPCPLISTS={}
end
function M.removeFightNpcPlistByAniId(aniId)
    local refSoldierAni=M.getRefFightAnimationDataBySoldiers(aniId)
    local plist=refSoldierAni.plist 
    if M.NPCPLISTS[plist] then 
        display.removeSpriteFramesWithFile("uires/effect/npc/"..plist..".plist", "uires/effect/npc/"..plist..".png")
        M.NPCPLISTS[plist]=nil
    end
end
--------------------------------------------------添加npc对应plist
function M.initFightNpcPlist(aniId)
    local refSoldierAni=M.getRefFightAnimationDataBySoldiers(aniId)
    local plist=refSoldierAni.plist
    if M.NPCPLISTS[plist] then return end
    M.NPCPLISTS[plist]=plist
    display.addSpriteFrames("uires/effect/npc/"..plist..".plist", "uires/effect/npc/"..plist..".png")
end
-------------------------------------------------获取士兵动画数据
function M.getSoldiersContentOffset(aniId)
    return SoldiersContentOffset[aniId]
end
-------------------------------------------------获取士兵针动画数据
function M.getRefFightAnimationDataBySoldiers(key)
    return refNpcAnimation[key]
end
--------------------------------------------------武将动画
----------------------------------------------------------
-- 获取士兵走向战场动画
function M.getGotoFight(node,isAtt)
    -- 240,60   120    120
    local attIndex=isAtt and 1 or 2
    local gotoData=M.getGotoFightData()
    local endPoint=cc.p(node:getPositionX(),node:getPositionY())
    local starPoint
    if attIndex==1 then
    	starPoint=cc.p(endPoint.x+gotoData.length,endPoint.y-gotoData.length/2)
   	else
		starPoint=cc.p(endPoint.x-gotoData.length,endPoint.y+gotoData.length/2)
    end
    node:setPosition(starPoint)
    local moveto=cc.MoveTo:create(gotoData.time, endPoint)
    return moveto,gotoData.time
end
-- 获取英雄技能动画
function M.getHeroSkillAni(refID,isAtt)
    
end
function M.getSoldiersSpriteFile(anikey,aniType,isAtt)
    local attIndex=isAtt and 1 or 2
    local refSoldierAni=M.getRefFightAnimationDataBySoldiers(anikey)
    local key=tostring(aniType..attIndex)
    local aniData=refSoldierAni[key]
    return aniData.icon..".png"
end
----------------------------------获取士兵基本动画   静止，跑动，攻击，受伤
function M.getSoldiersAni(anikey,aniType,isAtt)
    local attIndex=isAtt and 1 or 2
    local refSoldierAni=M.getRefFightAnimationDataBySoldiers(anikey)
    local aniData=refSoldierAni[aniType..attIndex]
	local getAnimation= function( refSoldierAni,aniType,attIndex )
	    local tlSpriteFrame={}
	    for count = 1,aniData.count do
	        local icon=string.split(aniData.icon,"_")
            icon[#icon]=string.format("%02d",count)
	        local name=table.concat(icon,"_")
	        local spriteFrame = display.newSpriteFrame(name..".png")
	        tlSpriteFrame[#tlSpriteFrame + 1] = spriteFrame
	    end
	    local animation = display.newAnimation(tlSpriteFrame, aniData.time)
	    return animation
	end
    return getAnimation(refSoldierAni,aniType,attIndex) ,aniData.time*aniData.count
end

---------------------------------------------------------技能效果
function M.setSkillParentNode(node)--技能效果父节点
    M.SKILL_EFFECT_LAYER=node
end
function M.getEffPosition(targetGrids,attoffset,defoffset,atttype)
    local endPoists={}
    local targetIsAtt=false
    
    for k,targetGrid in pairs(targetGrids) do
        targetIsAtt=targetGrid:getIsAtt()
        break
    end
    local effectEP=targetIsAtt and attoffset or defoffset
    if atttype==ATTTYPE.one then
        for k,targetGrid in pairs(targetGrids) do
            --获取被攻击格子的坐标
            local endP=cc.p(targetGrid:getPositionX(),targetGrid:getPositionY())--格子实际位置
            endP=M.getGridNodeContentPoint(endP)--格子中心点位置
            endP=cc.p(endP.x+effectEP.x,endP.y+effectEP.y)--移动的结束位置
            endPoists[#endPoists+1]=endP
        end
    elseif atttype==ATTTYPE.all then --打全体
        if targetIsAtt then
            endPoists[#endPoists+1]=cc.p(645+effectEP.x,195+effectEP.y)
        else
            endPoists[#endPoists+1]=cc.p(318+effectEP.x,366+effectEP.y)
        end
    elseif atttype==ATTTYPE.row then --row打一横排
        local inDefP={{382,334},{256,400}}
        local inAttP={{580,235},{713,171}}
        local pos
        local index=1
        for k,targetGrid in pairs(targetGrids) do
            pos=targetGrid:getPos()
            break
        end
        if pos>=1 and pos<=3 then index=1 else index=2 end
        if targetIsAtt then
            endPoists[#endPoists+1]=cc.p(inAttP[index][1]+effectEP.x,inAttP[index][2]+effectEP.y)
        else
            endPoists[#endPoists+1]=cc.p(inDefP[index][1]+effectEP.x,inDefP[index][2]+effectEP.y)
        end
    elseif atttype==ATTTYPE.col then --col 打一竖排
        local inDefP={{450,430},{318,366},{185,300}}
        local inAttP={{777,260},{645,195},{515,130}}
        local pos=nil   
        local index=1
        for k,targetGrid in pairs(targetGrids) do
            pos=targetGrid:getPos()
        end
        if pos==1 or pos==4 then 
            index=1 
        elseif  pos==2 or pos==5 then
            index=2 
        elseif  pos==3 or pos==6 then
            index=3 
        end  
        if targetIsAtt then
            endPoists[#endPoists+1]=cc.p(inAttP[index][1]+effectEP.x,inAttP[index][2]+effectEP.y)
        else
            endPoists[#endPoists+1]=cc.p(inDefP[index][1]+effectEP.x,inDefP[index][2]+effectEP.y)
        end       
    end
    return endPoists 
end
--播放技能效果
function M.playBulletAction(node,delayTime,datas,effbullet)
    -- local armyData=ref.RefArmy.getRef({refId=armyId})
    -- local key=armyData.effbullet
    local key=effbullet
    local effectData=M.getEffectAnimationData(key)
    if not effectData then return 0 end
    local noteType=node:getNoteType()
    --子弹的出发对象   grid为格子（只发出一次）npc为士兵（多少个士兵发多少次）
    if noteType~=effectData.playnode then return 0 end
    M.initFightEffectPlist(key)
    local isAtt=node:getIsAtt()
    local effectSP=isAtt and effectData.astarpoint or effectData.dstarpoint
    local getBulletStarPoint=function ( noteType ,gridOrSoldiers)
        local starP=cc.p(0,0)
        if noteType==PLAYNODE.grid then
            local girdP=M.getGridNodeContentPoint(cc.p(gridOrSoldiers:getPositionX(),gridOrSoldiers:getPositionY()))
            starP=cc.p(girdP.x+effectSP.x,girdP.y+effectSP.y)
        elseif noteType==PLAYNODE.npc then
            local npcP=M.getNpcContentPoint(gridOrSoldiers:getParent(),cc.p(gridOrSoldiers:getPositionX(),gridOrSoldiers:getPositionY()))
            starP=cc.p(npcP.x+effectSP.x,npcP.y+effectSP.y)
        end
        return starP
    end
   
    local getBullet=function()
        local bullet=nil
        if ANITYPE.img==effectData.anitype then
            bullet=display.newSprite(effectData.ani)
            M.SKILL_EFFECT_LAYER:addChild(bullet,M.SKILL_ZORDER)
        elseif ANITYPE.ccbi==effectData.anitype then
            local t=isAtt and "_a" or "_d"
            -- {timeScale=timeScale,fCompleteCallback=onComplete}
            
            bullet = CCBReader.load(effectData.ani..t,{onComplete = function()
                    if not tolua.isnull(bullet) then
                        bullet:removeFromParent(true)
                    end
                end})

            M.SKILL_EFFECT_LAYER:addChild(bullet,M.SKILL_ZORDER)
        end      
        return bullet  
    end
    local callback=function()
        local time=nil
        local targetGrids=datas.targetgrids--获取被攻击的格子
        local atttype=effectData.atttype--攻击类型，判断子弹是否为群攻或者单体
        --子弹配置表中的初始位置跟结束位置
        
        local starP=getBulletStarPoint(noteType,node)
        local endPs=M.getEffPosition(targetGrids,effectData.aendpoint,effectData.dendpoint,atttype)
        for i=1,#endPs do
            local endP=endPs[i]
            local bullet=getBullet()
            bullet:setPosition(starP)
            local moveAction
            if effectData.anipath==PLAYPATH.arrow then
                moveAction=M.bezierAction(starP,endP,effectData.anitime,effectData.height)
                moveAction:setTag(1001)
            elseif effectData.anipath==PLAYPATH.bezier then
                moveAction=M.bezierAction(starP,endP,effectData.anitime,effectData.height)
            elseif effectData.anipath==PLAYPATH.move then
                moveAction=M.moveAction(endP,effectData.anitime)
            elseif effectData.anipath==PLAYPATH.moveArrow then
                bullet:setRotation(Util.getAngleTwoPoint(starP,endP))
                moveAction=M.moveAction(endP,effectData.anitime)
            end
            --进行子弹移动
            if moveAction then bullet:runAction(moveAction) end
            --删除子弹  测试环境下不删除子弹
            -- local stoptime=effectData.stoptime or 0
            -- local delayTime=cc.DelayTime:create(effectData.anitime)
            -- bullet:runAction(transition.sequence({delayTime,cc.RemoveSelf:create()}))
        end
        
    end
    M.runCCCallFunc(callback,delayTime,node)
    return effectData.anitime
end

function M.playHitAction(node,delayTime,datas,effhit)
    -- local armyData=ref.RefArmy.getRef({refId=armyId})
    -- local key=armyData.effhit
    local key=effhit
    local noteType=node:getNoteType()
    local effectData=M.getEffectAnimationData(key)
    print("playHitAction------------------------------",key)
    if not effectData then return 0 end
    --子弹的出发对象   grid为格子（只发出一次）npc为士兵（多少个士兵发多少次）
    if noteType~=effectData.playnode then return 0 end
    M.initFightEffectPlist(key)
    local isAtt=node:getIsAtt()
    local effectSP=isAtt and effectData.astarpoint or effectData.dstarpoint
    local getHit=function()
        local hit=nil
        if ANITYPE.img==effectData.anitype then
            hit=display.newSprite(effectData.ani)
            M.SKILL_EFFECT_LAYER:addChild(hit,M.SKILL_ZORDER)
        elseif ANITYPE.ccbi==effectData.anitype then
            local t=isAtt and "_a" or "_d"
            hit = CCBReader.load(effectData.ani..t,{onComplete = function()
                    if not tolua.isnull(hit) then
                        hit:removeFromParent(true)
                    end
                end})
            M.SKILL_EFFECT_LAYER:addChild(hit,M.SKILL_ZORDER)
        end      
        return hit   
    end

    local callback=function (  )
        local targetGrids=datas.targetgrids--获取被攻击的格子
        local starPs=M.getEffPosition(targetGrids,effectData.astarpoint,effectData.dstarpoint,effectData.hittype)
        for i=1,#starPs do

            local hit=getHit()
            local starP=starPs[i]
            hit:setPosition(starP)
        end
    end
    M.runCCCallFunc(callback,delayTime,node)
    return effectData.anitime
end
function M.playRelAction(node,delayTime,effrel)
    -- local armyData=ref.RefArmy.getRef({refId=armyId})
    -- local key=armyData.effrel
    local key=effrel
    local effectData=M.getEffectAnimationData(key)
    if not effectData then return 0 end
    local noteType=node:getNoteType()
    if noteType~=effectData.playnode then return 0 end
    M.initFightEffectPlist(key)
    local isAtt=node:getIsAtt()
    local effectSP=isAtt and effectData.astarpoint or effectData.dstarpoint
    
    local getRel=function()
        local rel=nil
        local t=isAtt and "_a" or "_d"
        if ANITYPE.img==effectData.anitype then
            rel=display.newSprite(effectData.ani..t)
        elseif ANITYPE.ccbi==effectData.anitype then
            rel= CCBReader.load(effectData.ani..t,{onComplete = function()
                    if not tolua.isnull(rel) then
                        rel:removeFromParent(true)
                    end
            end})
        end
        M.SKILL_EFFECT_LAYER:addChild(rel,M.SKILL_ZORDER)
        return rel  
    end
    local callback=function (  )
        if noteType==effectData.playnode then--子弹的出发对象   grid为格子（只发出一次）npc为士兵（多少个士兵发多少次）
            local rel=getRel()
            local npcP=M.getNpcContentPoint(node:getParent(),cc.p(node:getPositionX(),node:getPositionY()))
            local starP=cc.p(npcP.x+effectSP.x,npcP.y+effectSP.y)
            rel:setPosition(starP)
        end
    end
    M.runCCCallFunc(callback,delayTime,node)
    return effectData.anitime
end
--播放伤害
function M.BET_DAMAGE( datas )
    -- dump(datas)
    local viewGrid=datas.viewGrid
    local event=datas.event
    local animaTypes=datas.animaTypes

    local damageValue=event.damageValue
    local isAtt=viewGrid:getIsAtt()
    
    local time=0.01
    if not animaTypes or #animaTypes==0 then 
        local hitData=HitEffectAnimation["BA_NONE"]
        if hitData.isHitAni then
            viewGrid:playHitAnimate()
        end
        if hitData.isHitNumAni and damageValue then
            viewGrid:showHitNumAni(damageValue)
        end
        return time
    end
    for i=1,#animaTypes do
        local animaType=animaTypes[i]
        local hitData=HitEffectAnimation[animaType]
        if hitData then  
            if hitData.isHitAni  then
                viewGrid:playHitAnimate()
            end
            if hitData.isHitNumAni and damageValue then
                viewGrid:showHitNumAni(damageValue)
            end
            if hitData.isHealNumAni then
                viewGrid:showHealNumAni(event.healValue)
            end
            if hitData.textCcbi then
                M.initFightEffectPlist(hitData.textFile)
                local point=M.getGridNodeContentPoint(cc.p(viewGrid:getPosition()))
                local textccbi 
                textccbi= CCBReader.load(hitData.textCcbi,{onComplete = function()
                    if not tolua.isnull(textccbi) then
                        textccbi:removeFromParent(true)
                        print("remove hit----------------------")
                    end
                end})
                local textPoint=hitData.textPoint
                textccbi:setPosition(cc.p(point.x+textPoint.x,point.y+textPoint.y))
                textccbi.ccLabel1:setString(hitData.text)
                textccbi.ccLabel2:setString(hitData.text)
                M.SKILL_EFFECT_LAYER:addChild(textccbi,M.SKILL_ZORDER)
            end

            if hitData.hitCcbi then
                if hitData.hitFile then
                    M.initFightEffectPlist(hitData.hitFile)
                end
                local point=M.getGridNodeContentPoint(cc.p(viewGrid:getPosition()))
                local hitCcbi 

                local t=isAtt and "_a" or "_d"
                hitCcbi= CCBReader.load(hitData.hitCcbi..t,{onComplete = function()
                    if not tolua.isnull(hitCcbi) then
                        hitCcbi:removeFromParent(true)
                    end
                end})
                local hitPoint=hitData.hitPoint
                hitCcbi:setPosition(cc.p(point.x+hitPoint.x,point.y+hitPoint.y))
                M.SKILL_EFFECT_LAYER:addChild(hitCcbi,M.SKILL_ZORDER)
                time=time+hitData.time
            end
        end
    end
    return time
end
function M.moveAction(endpoint,anitime)
    local move=cc.MoveTo:create(anitime,endpoint)
    return move
end
function M.bezierAction(starPoint,endPoint,anitime,height)
    local controlPoint_1
    local controlPoint_2
    local config={}
    controlPoint_1=cc.p((starPoint.x+endPoint.x)/2,(starPoint.y+endPoint.y)/2+height)
    controlPoint_2=controlPoint_1
    config[1]=controlPoint_1
    config[2]=controlPoint_2
    config[3]=endPoint
    local bezierTo=cc.BezierTo:create(anitime,config)
    return bezierTo
end
function M.getGridNodeContentPoint(point)
    return cc.p(point.x+GridNodeWH.w/2,point.y+GridNodeWH.h/2)
end
function M.getNpcContentPoint(parent,point)
    return cc.p(parent:getPositionX()+point.x,parent:getPositionY()+point.y)
end
--受击变红
function M.setHitColor(parent,node)
    node:setColor(TEXT_COLOR_RED)
    M.runCCCallFunc(function ( )
        node:setColor(TEXT_COLOR_WHITE)
    end,0.5,parent)
end
--获取一个延时动作
function M.runCCCallFunc(callback,delayTime,parent)
    local sprite=display.newSprite()
    parent:addChild(sprite)
    local ccdelay= cc.DelayTime:create(delayTime)
    local ccfun=cc.CallFunc:create(callback)
    local sequence = transition.sequence({ccdelay,ccfun,cc.RemoveSelf:create()})
    sprite:runAction(sequence)
end
function M.showHitNumAni(type,num,startP)
    local key
    local fuhaoSprite
    if type=="heal" then
        key="fight_num_green_%d.png"
        fuhaoSprite=display.newSprite("fight_num_green_jia.png")
    elseif type=="hit" then
        key="fight_num_red_%d.png"
        fuhaoSprite=display.newSprite("fight_num_red_jian.png")
    end
    local viewArtLabel = view.ViewArtLabel.new{
            text = tostring(num),
            format = key,
            padding = 0,
    }
    startP=cc.p(startP.x+125,startP.y+66)
    local move=cc.MoveTo:create(0.2,cc.p(startP.x,startP.y+50))
    local ccdelay= cc.DelayTime:create(0.5)
    viewArtLabel:setPosition(startP)
    viewArtLabel:addChild(fuhaoSprite)
    viewArtLabel:setAnchorPoint(cc.p(0.5,0.5))
    M.SKILL_EFFECT_LAYER:addChild(viewArtLabel,M.SKILL_ZORDER)
    viewArtLabel:runAction(transition.sequence({move,ccdelay,cc.RemoveSelf:create()}))
    fuhaoSprite:setAnchorPoint(cc.p(1,0.5))
    fuhaoSprite:setPosition(cc.p(0,viewArtLabel:getContentSize().height/2))
end
return M