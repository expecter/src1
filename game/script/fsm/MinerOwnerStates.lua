--
-- Author: Your Name
-- Date: 2017-10-13 15:03:02
--
local M = {}
M.EnterMineAndDigForNugget ={
	onEnter = function ( node )
		if node:Location()~=shack then
			node:ChangeLocation(shack)
		end
	end,
	Excute = function ( node )
		
	end,
	onExit = function ( node )
		
	end
}
M.VisitBankAndDepositGold ={
	onEnter = function ( node )
		if node:Location()~=shack then
			node:ChangeLocation(shack)
		end
	end,
	Excute = function ( node )
		
	end,
	onExit = function ( node )
		
	end
}
return M