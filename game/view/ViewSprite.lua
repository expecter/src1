--
-- 把一个node转换为sprite
--

local M = class(..., function()
    return display.newSprite()
end)

--depth, 是否
function M:ctor(node, depth)
    self.depth = depth
    self:setNode(node)
end

function M:setNode(node)
    local spriteframe = M.newSpriteFrame(node, self.depth)
    self:setSpriteFrame(spriteframe)
end

function M.newSpriteFrame(node, depth)
    local render = M.newRenderTexture(node, depth)
    local texture = render:getSprite():getTexture()
    local size = texture:getContentSizeInPixels()

    local spriteframe = cc.SpriteFrame:createWithTexture(texture, cc.rect(0,0,size.width,size.height))
    return spriteframe
end

function M.saveToFile(node, path, depth)
    local render = M.newRenderTexture(node, depth)
    render:saveToFile(path)
end

function M.newRenderTexture(node, depth)
    local size = node:getContentSize()
    local scaleX = math.abs(node:getScaleX())
    local scaleY = math.abs(node:getScaleY())
    size.width = size.width*scaleX
    size.height = size.height*scaleX
    local render 
    if depth then
        render = cc.RenderTexture:create(size.width, size.height, kCCTexture2DPixelFormat_RGBA8888, gl.DEPTH24_STENCIL8_OES)
    else
        render = cc.RenderTexture:create(size.width, size.height)
    end
    
    local oldVisible = node:isVisible()

    render:beginWithClear(0,0,0,0)

    node:setVisible(true)
    node:setPosition(size.width*0.5,size.height*0.5)
    node:setAnchorPoint(cc.p(0.5,0.5))
    node:setScaleX(1*scaleX)
    node:setScaleY(-1*scaleY)
    node:setRotation(0)
    node:visit()

    render:endToLua()

    node:setVisible(oldVisible)

    return render, size
end

return M