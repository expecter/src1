--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
FightMgr = require("game.gameScenes.fight.FightMgr")
FightAnimationMgr = require("game.gameScenes.fight.FightAnimationMgr")
local ANI_TYPE={
    att="att",
    run="run",
    hit="hit",
    stanby="stanby",
}
function M:ctor( target ,params)
	self.target = target
	self:setData(params)
	FightMgr.initFightNpcPlist(self.armyData_.ani)
end
function M:setData(params )
	self.armyData_ = ref.army.getRef{refId=params.refId}
	FightMgr.initFightNpcPlist(self.armyData_.ani)
	if not self.soldiersSprite then
        local fileName=FightAnimationMgr.getSoldiersSpriteFile(self.armyData_.ani,ANI_TYPE.stanby)
        self.soldiersSprite=display.newSprite("#"..fileName)
        self.soldiersSprite:setAnchorPoint(cc.p(0.5,0))
        self.soldiersSprite:setPosition(display.cx,200)
        self:addChild(self.soldiersSprite)
    end
    target:playstandby()
end
function M:initView( target )	
end
function M:updateView( target )
end
function M:playstandby( target,time )
	local callback=function ()
        self.soldiersSprite:stopAllActions()
        local animation=FightAnimationMgr.getSoldiersAni(self.armyData_.ani,ANI_TYPE.stanby,self.isAtt)
        local action=cc.RepeatForever:create(cc.Animate:create(animation))
        self.soldiersSprite:runAction(action)
    end
    local t=time or 0.01
    FightAnimationMgr.runCCCallFunc(callback,t,self)
end
function M:playAttack( target )
	self.soldiersSprite:stopAllActions()
    local animation,time=FightAnimationMgr.getSoldiersAni(self.armyData_.ani,ANI_TYPE.att,self.isAtt)
    local action=cc.Animate:create(animation)
    self.soldiersSprite:runAction(action)
    print("playAttAnimate")
    self:playStandbAnimate(time)
end
function M:playRun( target )
	self.soldiersSprite:stopAllActions()
    local animation=FightAnimationMgr.getSoldiersAni(self.armyData_.ani,ANI_TYPE.run,self.isAtt)
    local action=cc.RepeatForever:create(cc.Animate:create(animation))
    self.soldiersSprite:runAction(action)
end
function M:playHit( target )
	FightAnimationMgr.setHitColor(self,self.soldiersSprite)
    return 0.01
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"playstandby")
	target:bindOnceMethod(self,"playAttack")
	target:bindOnceMethod(self,"playRun")
	target:bindOnceMethod(self,"playHit")
end
return M