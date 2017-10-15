local tlRefConfig = import(".json.tileProperty")
local M = {}

local RefTileProperty = {}

Helper.extend(M, tlRefConfig, RefTileProperty, function(refTileProperty)
	-- 地块类型
    refTileProperty.gridLandForm = ""
end)
		
---------------------
--成员函数
---------------------
function RefTileProperty:getImage()
	local path = string.split(self.image,'/')
	return path[2]
end

function RefTileProperty:getGridLandForm()
	return self.gridLandForm
end

function RefTileProperty:getLevel()
	return self.level
end

-- 判断是否资源点
function RefTileProperty:isResource()
	return table.indexof({"GL_FOREST","GL_IRON","GL_STONE","GL_FARM"},self.gridLandForm)
end

-- ---------------------
-- --静态函数
-- ---------------------
-- function M.getEarthType(gid)
-- 	for k,v in pairs(tlRefConfig) do
-- 		if v.gid == gid then
-- 			return ENUM_EARTHTYPE[v.enumEarthType]
-- 		end
-- 	end
-- end

-- function M.getIsValidBuild(gid)
-- 	for k,v in pairs(tlRefConfig) do
-- 		if v.animationRefId == gid then
-- 			return v.validbuild
-- 		end
-- 	end
-- end

return M