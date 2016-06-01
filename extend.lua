--游戏基本库的一些扩展

--打印函数
function echoInfo(fmt,...) 
    printInfo(fmt,...)
end

----------------------------------------
--添加toTable函数
----------------------------------------
function totable(t) 
    return type(t)=="table" and t or {}
end

----------------------------------------
--重写functions中的table map函数
----------------------------------------
function table.map(t, f)
    local ret = {}
    for k, v in pairs(t) do
        ret[k] = f(v,k) 
    end
    return ret
end

----------------------------------------
--添加table.reduce函数 以对应functions中tabel.reduce函数
----------------------------------------
function table.reduce(t, f, init)
    for k, v in pairs(t) do
        init = f(v, k, init)
    end
    return init
end

----------------------------------------
--添加table.insertto函数 以对应functions中tabel.insertto函数
----------------------------------------
function table.insertto(dest, src, begin)
    begin = checkint(begin)
    if begin <= 0 then
        begin = #dest + 1
    end

    local len = #src
    for i = 0, len - 1 do
        dest[i + begin] = src[i + 1]
    end
    return dest
end

----------------------------------------
--彩色文本字符串格式化
--string.colorFormat("{1}A{2}B{3}C",cc.c3b(0,0,0),cc.c3b(0,255,0),cc.c3b(0,0,255))
----------------------------------------
function string.colorFormat(text, ...)
    local function color2str(color)
        local function byte2hex(byte)
            local hex = string.format("%x",byte)
            if #hex > 2 then
                hex = "ff"
            end
            if #hex == 1 then
                hex = "0"..hex
            end
            if #hex == 0 then
                hex = "00"
            end
            return hex
        end

        local ret = "#"
        ret = ret..byte2hex(color.r)
        ret = ret..byte2hex(color.g)
        ret = ret..byte2hex(color.b)
        ret = ret.."#"
        return ret
    end
    local tlColor = {...}
    for index, color in ipairs(tlColor) do
        local str = color2str(color)
        local key = string.format("{%d}", index)
        text = string.gsub(text, key, str)
    end
    return text
end

----------------------------------------
--cc.Sprite.setBlendFunc 重写, 修改其接口
----------------------------------------
local sprite_setBlendFunc = cc.Sprite.setBlendFunc
function cc.Sprite:setBlendFunc(src,dst)
    if src==gl.ONE and dst==gl.ONE then
        local texture = self:getTexture()
        --没有预乘的时候 线性叠加 使用 SRC_ALPHA 
        if texture and (not texture:hasPremultipliedAlpha()) then
            src = gl.SRC_ALPHA
        end
    end
    if src==gl.ONE and dst==gl.ONE_MINUS_SRC_ALPHA then
        local texture = self:getTexture()
        --没有预乘的时候 普通叠加 使用 SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
        if texture and (not texture:hasPremultipliedAlpha()) then
            src = gl.SRC_ALPHA
            dst = gl.GL_ONE_MINUS_SRC_ALPHA
        end
    end
    sprite_setBlendFunc(self, src, dst)
end

----------------------------------------
--cc.Node添加接口
----------------------------------------
function cc.Node:getCenterPosition(xratio, yratio)
    local size = self:getContentSize()

    xratio = xratio or 0.5
    yratio = yratio or 0.5

    return size.width*0.5, size.height*0.5
end

----------------------------------------
--display.newSpriteFrame 重写, 支持#号前缀 以及 文件名, 使其行为 类似 display.newSprite()
----------------------------------------
local display_newSpriteFrame = display.newSpriteFrame
function display.newSpriteFrame(framename)
    -- first char is '#'
    local frame = nil
    --echoInfo("newSpriteFrame:"..tostring(framename))
    if string.byte(framename) == 35 then 
        frame = display_newSpriteFrame(string.sub(framename, 2))
    else
        frame = cc.SpriteFrameCache:getInstance():getSpriteFrame(framename)
        if not frame then
            local texture = cc.Director:getInstance():getTextureCache():addImage( framename )
            if texture then
                local size = texture:getContentSize()
                local rect = cc.rect(0, 0, size.width, size.height)
                frame = cc.SpriteFrame:createWithTexture(texture , rect)
            end
        end
    end

    if not frame then
        printError("display.newSpriteFrame() - invalid frameName %s", tostring(framename))
    end
    return frame
end

----将类 $word_1 字符串 使用 {word_1="replaceWord"} 中值替换
function string.formatStrUrlWithParams(strUrlFormat,tmParams)
    local sUrl,n= string.gsub(strUrlFormat,'(%$%w*_?%w*)',function(s)
        local arg = tmParams[string.sub(s,2)]
        return arg and tostring(arg) or s
    end)
    return sUrl
end

----------------------------------------
--layer 重写
----------------------------------------
function display.newLayer()

    local node = display.newNode()
    node:setContentSize(display.width, display.height)
    
    local eventDispatcher = node:getEventDispatcher()

    --one by one
    local function onTouchBegan(touch, event)
        local location = touch:getLocation()

        if node.__touchEnabled__ then
            return node.__touchHandler__("began", location.x, location.y)
        else
            return false
        end
    end

    local function onTouchMoved(touch, event)
        local location = touch:getLocation()
        if node.__touchEnabled__ then
            node.__touchHandler__("moved", location.x, location.y)
        end
    end

    local function onTouchEnded(touch, event)
        local location = touch:getLocation()
        if node.__touchEnabled__ then
            node.__touchHandler__("ended", location.x, location.y)
        end
    end

    local function onTouchCancelled()
        local location = touch:getLocation()
        if node.__touchEnabled__ then
            node.__touchHandler__("cancelled", location.x, location.y)
        end
    end

    --all at once
    local function touches2XYID(touches)

        local tlPoint={}
        local i=0
        for _, touch in ipairs(touches) do
            local location = touch:getLocation()
            tlPoint[i*3+1]=location.x
            tlPoint[i*3+2]=location.y
            tlPoint[i*3+3]=touch:getId()
            i = i+1
        end 
        return tlPoint
    end
    local function onTouchesBegan(touches, event)
        if node.__touchEnabled__ then
            return node.__touchHandler__("began", touches2XYID(touches))
        end
    end

    local function onTouchesMoved(touches, event)
        if node.__touchEnabled__ then
            return node.__touchHandler__("moved", touches2XYID(touches))
        end
    end

    local function onTouchesEnded(touches, event)
        if node.__touchEnabled__ then
            return node.__touchHandler__("ended", touches2XYID(touches))
        end
    end

    local function onTouchesCancelled(touches, event)
        if node.__touchEnabled__ then
            return node.__touchHandler__("cancelled", touches2XYID(touches))
        end
    end


    --重写addTouchEventListener
    function node:addTouchEventListener(handler, allAtOnce, swallow, tag)
        if node.__eventListenerTouch__ then
            eventDispatcher:removeEventListener(node.__eventListenerTouch__)
        end

        if tag~=nil then swallow = tag end   --为了兼容2.23的代码 addTouchEventListener(handler, allAtOnce, priority, swallow)

        node.__touchHandler__ = handler

        if allAtOnce then

            local touchAllAtOnceListener = cc.EventListenerTouchAllAtOnce:create()
            touchAllAtOnceListener:registerScriptHandler(onTouchesBegan, cc.Handler.EVENT_TOUCHES_BEGAN )
            touchAllAtOnceListener:registerScriptHandler(onTouchesMoved, cc.Handler.EVENT_TOUCHES_MOVED )
            touchAllAtOnceListener:registerScriptHandler(onTouchesEnded, cc.Handler.EVENT_TOUCHES_ENDED )
            touchAllAtOnceListener:registerScriptHandler(onTouchesEnded, cc.Handler.EVENT_TOUCHES_CANCELLED )
            
            node.__eventListenerTouch__ = touchAllAtOnceListener

        else

            local touchOneByOneListener = cc.EventListenerTouchOneByOne:create()
            touchOneByOneListener:setSwallowTouches(swallow)
            touchOneByOneListener:registerScriptHandler(onTouchBegan, cc.Handler.EVENT_TOUCH_BEGAN )
            touchOneByOneListener:registerScriptHandler(onTouchMoved, cc.Handler.EVENT_TOUCH_MOVED )
            touchOneByOneListener:registerScriptHandler(onTouchEnded, cc.Handler.EVENT_TOUCH_ENDED )
            touchOneByOneListener:registerScriptHandler(onTouchEnded, cc.Handler.EVENT_TOUCH_CANCELLED )

            node.__eventListenerTouch__ = touchOneByOneListener
        end

        eventDispatcher:addEventListenerWithSceneGraphPriority(node.__eventListenerTouch__, node)
        
    end

    --重写setTouchEnabled
    function node:setTouchEnabled(enable)
        node.__touchEnabled__ = enable
    end
    
    return node
end

function display.newColorLayer(color)
        local layer = cc.LayerColor:create(color)
        return layer
end

cc.Node.setTouchEnabled = function() end

--重写display.newTTFLabel
local display_newTTFLabel = display.newTTFLabel
display.newTTFLabel = function(params)
    assert(type(params) == "table",
           "[framework.display] newTTFLabel() invalid params")

    local text       = params.text and tostring(params.text) or "" -- 保证text变量不为空 否则使用strString的时候会无法显示字符串
    local font       = params.font or "uires/public/font_JZunYuan.ttf"
    local size       = params.size or display.DEFAULT_TTF_FONT_SIZE
    local color      = params.color or cc.c3b(255,255,255)
    local textAlign  = params.align or cc.TEXT_ALIGNMENT_LEFT
    local textValign = params.valign or cc.VERTICAL_TEXT_ALIGNMENT_TOP
    local x, y       = params.x, params.y
    local dimensions = params.dimensions or cc.size(0, 0)

    assert(type(size) == "number",
           "[framework.display] newTTFLabel() invalid params.size")

    local label
    if cc.FileUtils:getInstance():isFileExist(font) then
        label = cc.Label:createWithTTF(text, font, size, dimensions, textAlign, textValign)
    else
        label = cc.Label:createWithSystemFont(text, font, size, dimensions, textAlign, textValign)
    end

    if label then
        label:setTextColor(color)   -- 与原版setColor不同, 这里使用了 setTextColor
        if x and y then label:setPosition(x, y) end
    end

    return label
end

local oldprint = print
--[[
print = function(...)
    --oldprint(debug.traceback())
    oldprint(...)
end
--]]

--重写 coroutine.resume 使其打印错误信息
local coroutine_resume = coroutine.resume
coroutine.resume = function(...)
    local ret, msg = coroutine_resume(...)
    if not ret then
        oldprint(msg)
    end
    return ret, msg
end

--协程 delay 函数
coroutine.delay = function(time)
    local cor = coroutine.running()
    if cor ~= nil then
        require("framework.scheduler").performWithDelayGlobal(function()
            coroutine.resume(cor)
        end, time)
        coroutine.yield()
    end
end

--多语言函数封装
G_W = function(sLanguage)
     return sLanguage
end

--重写 cc.c3b
function cc.c3b( _r,_g,_b )
    return { r = _r, g = _g, b = _b, a = 255 }
end

--重写异步加载
--[[
local M_tmTlCallbackAddImg = {}
local display_addImageAsync = display.addImageAsync
function display.addImageAsync(imagePath, callback)
    local fullname = cc.FileUtils:getInstance():fullPathForFilename(image)
    local textureCache = cc.Director:getInstance():getTextureCache()
    local texture = textureCache:getTextureForKey(fullname)
    if texture then
        callback(texture)
    else
        local tlCallback = M_tmTlCallbackAddImg[fullname]
        tlCallback[#tlCallback+1] = callback
        if not M_tmTlCallbackAddImg[fullname] then
            --初始化
            tlCallback = {}
            M_tmTlCallbackAddImg[fullname] = tlCallback

            tlCallback[#tlCallback+1] = callback
            display_addImageAsync(fullname, function(texture)
                for _, callback in ipairs(tlCallback) do
                    callback(texture)
                end
            end)
        end
    end

end
--]]