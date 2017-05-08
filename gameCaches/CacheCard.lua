local dataModel = {
	id = 0,
	heroId = 0,
	level = 1,
	exp = 2,
}
function M:ctor(  )
	local params = {
		cacheName = "CmdHero",
		isRepeat = true,
		dataModel = dataModel,
	}
	M.super.ctor(self,params)
	
end
--首次初始化
function M:firstInit( cmdX )
	-- if not cmdX then
	-- 	self.cache = ref.getRef({refName = "refarmy"})
	-- 	self:updateByProto(self.cache)
	-- end
	-- self.cache = cmdX
	self.cache = ref.getRef({refName = "refarmy"})
	self:updateByProto(self.cache)
end
function M:cleanup(  )
	self.cache = {}
end
--请求命令
function M:test( params )
	local data = params
	
	self:updateByProto(self.cache)
end
--抽卡
function M:chouka( params )
	CacheHero:newHero()	
	self:updateByProto(self.cache)
end

return M