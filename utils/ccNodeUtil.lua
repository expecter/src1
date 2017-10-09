--
-- Author: Your Name
-- Date: 2017-10-08 02:13:31
--
local M = {}
M.ccType = {
	node = {"ex_node"},
	label = {"ex_label"},
	sprite = {"ex_sprite"},
	ccreader = {"ex_ccReader"},
}
function M.initNode( params )	
	if M[params._type] then
		return M[params._type](params)
	end
	return nil
end

function M.node( params )
	local node = display.newNode()
	node:setContentSize(params.contentsize or cc.size(0,0))
	node:setAnchorPoint(params.AnchPos or cc.p(0,0))
	node:setPosition(params.pos or cc.p(0,0))
	node:setScale(params.scale or 1)
	node:setVisible(params.visible~=false)
	return node
end

function M.label( params )
	local label = display.newTTFLabel{text=params.text,size=30}
	return label
end

function M.sprite( params )
	local sprite = display.newSprite(string.format("%s.png",params.spriteName))
	-- sprite:setContentSize(params.contentsize or cc.size(0,0))
	sprite:setPosition(params.pos or cc.p(0,0))
	sprite:setAnchorPoint(params.AnchPos or cc.p(0,0))
	return sprite
end

function M.ccreader( params )
	local tlCallback = {}
	for k,v in pairs(params.tlCallback or {}) do
		tlCallback[k] = ComponentUtil.getCallFunc(v)
	end
	local owner = CCBReader.load(string.format("%s.ccbi",params.ccbName),tlCallback)
	return owner
end

function M.scrollview( params )
	local gameNode = GameSceneMgr.createGameNode(params.viewNode)
	gameNode:initView()
	gameNode:enterView()
	local ccScrollView = cc.ScrollView:create(params.viewsize,gameNode:getView())
	ccScrollView.gameNode = gameNode
	return ccScrollView
end

function M.polygon( params )
	local width = params.contentsize.width or 100
	local height = params.contentsize.height or 100
	local anX = params.AnchPos.x or 0
	local anY = params.AnchPos.y or 0
	x = 0
	y = 0
	local points = {
        {x,y},
        {x + width, y},
        {x + width, y + height},
        {x, y + height}
    }
	return display.newPolygon(points, {fillColor = cc.c4f(0,0,0,0), borderColor = params.borderColor or cc.c4f(1,1,1,1), borderWidth = 0.5})
end

function M.scale9( params )
	local sp = display.newScale9Sprite(string.format("%s.png",params.spriteName))
	sp:setAnchorPoint(cc.p(0,0))
	sp:setContentSize(params.contentsize or cc.size(0,0))
	return sp
end

function M.tmx( params )
	local loader = cc.TMXTiledMap:create(string.format("%s.tmx",params.tmxName))
	return loader
end

return M