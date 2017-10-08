--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class("componentBase")
function M:ctor( params)
    self:setData(params)
end
function M:setData(params )
end
function M:initView( target )
    self.loader = cc.TMXTiledMap:create("pd_tilemap.tmx")
    target:addChild(self.loader)
end
--对应onenter
function M:enterView(  )
    
end
--对应onexit
function M:exitView(  )
    
end
--对应release
function M:releaseView(  )
    
end
function M:bindFunc( target )
end
return M