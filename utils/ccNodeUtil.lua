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

return M