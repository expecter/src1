--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class(...,componentBase)
local states = require("game.script.fsm.MinerOwnerStates")
function M:ctor(params)
end
function M:setData(params )
	self.m_pCurrentState = states.EnterMineAndDigForNugget
	self.m_Location = nil
	self.m_iGoldCarried = 0
	self.m_iMoneyInBank = 0
	self.m_iThirst = 0
	self.m_iFatigue = 0
	self._id = params.id or 0
end

function M:enterView(  )
	self.target:addListener(GameMessage.MessageName.time,function ( cmdX )
		self.m_iThirst = self.m_iThirst+1
		if self.m_pCurrentState then
			self.m_pCurrentState.excute(self.target)
		end
	end)
end

function M:ChangeState( )
end

function M:Location( )
end

function M:ChangeLocation( )
end

function M:GoldCarried( )
end
function M:SetGoldCarried( )
end
function M:AddToGoldCarried( )
end
function M:PocketsFull( )
end
function M:Fatigued( )
end
function M:DecreaseFatigue( )
end
function M:IncreaseFatigue( )
end
function M:Wealth( )
end
function M:SetWealth( )
end
function M:AddToWealth( )
end
function M:Thirsty( )
end
function M:BuyAndDrinkAWhiskey( )
end

function M:bindFunc( target )
end
return M