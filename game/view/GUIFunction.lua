--
-- Author: Your Name
-- Date: 2015-08-22 09:44:19
--
local M = {}
M.create = function(json)
	local mType = json.Type
	local node = nil
	if mType == "CCNode" then
		node = M.createCCNode(json)
	end
	if mType == "CCSprite" then
		node = M.createCCSprite(json)
	end
	if mType == "CCScale9Sprite" then
		node = M.createCCScale9Sprite(json)
	end
	if mType == "CCLabelTTF" then
		node = M.createTTFLabel(json)
	end
	-- if mType == "CCMenu" then
	-- 	return M.createCCMenu(json)
	-- end
	-- if mType == "CCMenuItemSprite" then
	-- 	return M.createMenuItemSprite(json)
	-- end
	if mType == "UIPushButton" then
		node = M.createUIPushButton(json)
	end
	if mType == "CCLayer" then
		node = M.createLayer(json)
	end
	if mType == "CCArmature" then
		node = M.createArmature(json)
	end
	-- if json.children then
	-- 	for k,v in pairs(json.children) do
	-- 		local child = M.create(v,NodeOwner)
	-- 		local zorder = json.Zorder or 1
	-- 		local tag = json.tag or 0
	-- 		node:addChild(child,zorder,tag)
	-- 	end
	-- end
	-- if json.callback then
	-- 	CallbackOwner[json.callback] =node
	-- end
	return node
end
--[[

cc.Node 的初始化

--]]
M.createCCNode = function(json)
	local node = display.newNode()
	M.setCCNode(node,json)
	return node
end

M.setCCNode = function(node,json)
	node:setPosition(JsonToCCPoint(json.position))
	node:setAnchorPoint(JsonToCCPoint(json.AnchorPoint,0.5))	
	node:setGlobalZOrder(JsonToInt(json.Zorder,0))
	if(json.scale~=nil)then
		node:setScale(JsonToInt(json.scale.x,1),JsonToInt(json.scale.y,1))
	end
	if(json.size~=nil)then
		node:setContentSize(JsonToCCSize(json.size))
	end
	node:setVisible(JsonToBoolean(json.visible,true))
end
--[[

CCSprite 的初始化

--]]
M.createCCSprite = function(json)
	local node = nil
	if(json.frameName)then
		node = display.newSprite("#"..json.frameName)
	end
	if(json.fileName)then
		node = display.newSprite(json.fileName)
	end	
	M.setCCNode(node,json)

	return node
end
--[[

CCLayer 的初始化

--]]
M.createLayer = function(json)
	local node = display.newLayer()
	-- M.setCCNode(node,json)
	return node
end
--[[

CCLabel 的初始化

--]]

M.createTTFLabel = function(json)

	local text = json.text or ""
	local node = display.newTTFLabel({text = text})
	M.setCCNode(node,json)
	return node
end

M.createArmature = function ( json )
	local name = json.fileName or ""
	local action = json.action or ""
	local node = ccs.Armature:create(name)
	node:getAnimation():play(action)
	return node
end
M.createUIPushButton = function(json)
	local node = cc.ui.UIPushButton.new({
		normal = json.NormalImage or "",
		pressed = json.NormalImage or "",
		-- disabled = json.DisabledImage or "",
		})
	-- if json.callback then
	-- 	node:onButtonClicked(json.callback)
	-- end	
	M.setCCNode(node,json)
	return node
end

M.updateView = function( json ,node)
	local mType = json.Type
	if mType == "CCSprite" then
		node = M.updateCCSprite(json,node)
	end
	if mType == "CCScale9Sprite" then
		node = M.updateCCScale9Sprite(json)
	end
	if mType == "CCLabelTTF" then
		node = M.updateTTFLabel(json)
	end
	-- if mType == "CCMenu" then
	-- 	return M.createCCMenu(json)
	-- end
	-- if mType == "CCMenuItemSprite" then
	-- 	return M.createMenuItemSprite(json)
	-- end
	if mType == "CCArmature" then
		node = M.createArmature(json)
	end
end
M.updateCCSprite = function ( json,node )
	local frameName = ""
	if(json.frameName)then
		frameName =json.frameName
	end
	node:setSpriteFrame(display.newSpriteFrame(frameName))
end

JsonToCCPoint = function(json,default)
	default = default or 0
	if(json==nil)then
		return cc.p(default,default)
	end	
	local x = json.x or default
	local y = json.y or default
	return cc.p(x,y)
end
JsonToCCSize = function(json,default)
	default = default or 0
	if(json==nil)then
		return cc.size(default,default)
	end	
	local width = json.width or default
	local height = json.height or default
	return  cc.size(width,height)
end
JsonToColor = function(json)
	if(json==nil)then
		return cc.color(0,0,0)
	end
	local r = JsonToInt(json.r or 255)
	local g = JsonToInt(json.g or 255)
	local b = JsonToInt(json.b or 255)
	return cc.color(r,g,b)
end
JsonToInt = function(data,default)
	default = default or 0
	return tonumber(data or default)
end
JsonToString = function(data,default)
	default = default or ""
	return tostring(data or default)
end
JsonToBoolean = function(data,default)
	if (data == nil) then
		return default or false
	end
	return data 
end

-- pairsByKeys = function(t) 
-- 	local function comps(a,b)
-- 		return t[a].key<t[b].key
-- 	end 
--     local a = {}  
--     for n in pairs(t) do
--         a[#a+1] = n  
--     end  
--     table.sort(a,comps)  
--     local i = 0  
--     return function()  
--         i = i + 1  
--         return a[i], t[a[i]]  
--     end  
-- end 

return M