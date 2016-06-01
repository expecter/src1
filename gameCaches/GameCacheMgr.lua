local GameCache = import(".GameCache")

-- 游戏缓存
local tmGameCache = {}

--初始化缓存
local proto = net.Proto.getProto("EnumCacheName")
if proto then
	for cacheName, _ in pairs(proto.enums) do
    	tmGameCache[cacheName] = GameCache.new(cacheName, cacheName.."_Update", cacheName.."_Key")
	end
end

local M = {}

--监听网络过来的数据
net.Client.event_static:addEventListener("CmdAppend", function(event)
	local data = event.data 
	local cmdAppendRsp = data.cmdX
	dump(cmdAppendRsp)
	local tlCmdCacheUpdate = cmdAppendRsp.tlCmdCacheUpdate or {}

	for _, cmdCacheUpdate in ipairs( tlCmdCacheUpdate ) do
		local enumCacheName = cmdCacheUpdate.enumCacheName
		print("#########")
		print("gamecacheupdate:",enumCacheName)
		print("#########")
		dump(cmdCacheUpdate)
		local data = cmdCacheUpdate.data
		local cmdX_Update = net.Proto.decode(enumCacheName.."_Update", data)
		--dump(cmdX_Update.cmdPlayer.playerName,"cmdX_Update.cmdPlayer:")
		tmGameCache[enumCacheName]:updateByProto(cmdX_Update)
	end
end)

--清理整个缓存
function M.clean()
    for _,gameCache in pairs(tmGameCache) do
        gameCache:clean()
    end
end

function M.getGameCacheByName(enumCacheName)
	return tmGameCache[enumCacheName]
end

function M.getCmdX(enumCacheName, cmdX_Key)
    local gameCache = M.getGameCacheByName(enumCacheName)
    if gameCache then
    	return gameCache:get(cmdX_Key)
    end
end
return M
