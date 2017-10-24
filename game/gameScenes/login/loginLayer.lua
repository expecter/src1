local M = class(..., function (  )
    return display.newLayer()
end)
function M:ctor()
    local player = player.new()
    local heros = heros.new()
    layerlogin.show()
    playerinfo.show()
    --使用组件控制
    local layer =herolayer.show()
    layer:switchto(1)
end

return M
