local M = class(..., require("game.gameSceneMgr.GameLayer"))
function M:ctor()
	self:initView()
end
local bubbleScope = {
	(display.width - 640)/2+50,590,(display.width - 640)/2+300,760		
}
local speed = 0.2
local vec = {
		-speed,0,speed
	}
function M:initView(  )
	display.addSpriteFrames("bubble.plist","bubble.pvr.ccz")
	self:initBubbleLayer()
	self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT,handler(self, self.update))
	self:scheduleUpdate()
	-- local data = ref.hero.getTlRef({li =10})
	-- dump(data)
end
function M:update(  )
	for i,_ in pairs(self.bubbleArray) do
		self:traceWall(self.bubbleArray[i])
		for j,_ in pairs(self.bubbleArray) do
			if i>j then
				if self:traceBubble(self.bubbleArray[i],self.bubbleArray[j]) then
					local vec = cc.pNormalize(cc.pSub(cc.p(self.bubbleArray[i]:getPosition()),cc.p(self.bubbleArray[j]:getPosition())))
					self.bubbleArray[i].offset.x = self.bubbleArray[i].offset.x+vec.x*speed
					self.bubbleArray[i].offset.y = self.bubbleArray[i].offset.y+vec.y*speed
					self.bubbleArray[j].offset.x = self.bubbleArray[j].offset.x-vec.x*speed
					self.bubbleArray[j].offset.y = self.bubbleArray[j].offset.y-vec.y*speed
				end
			end
		end
		local bubble = self.bubbleArray[i]
		local x,y = bubble:getPosition()
		local position = cc.p(x+bubble.offset.x,y+bubble.offset.y)
		bubble:setPosition( position)
	end
end
function M:traceWall(bubble )
	local rect = self:getRect(bubble)
	if cc.rectGetMinX(rect)<bubbleScope[1] or cc.rectGetMaxX(rect)>bubbleScope[2] or cc.rectGetMinY(rect)<bubbleScope[3] or cc.rectGetMaxY(rect)> bubbleScope[4] then
		bubble.offset = self:randomVector()
	end
	if cc.rectGetMinX(rect)<bubbleScope[1] then
		bubble.offset.x = vec[3]
	end
	if cc.rectGetMaxX(rect)>bubbleScope[2] then
		bubble.offset.x = vec[1]
	end
	if cc.rectGetMinY(rect)<bubbleScope[3] then
		bubble.offset.y = vec[3]
	end
	if cc.rectGetMaxY(rect)> bubbleScope[4] then
		bubble.offset.y = vec[1]
	end
end
function M:getRect( bubble )
	local x,y = bubble:getPosition()
	local width = bubble:getContentSize().width
	local height = bubble:getContentSize().height
	return cc.rect(x-width/4 - 2,y-height/4 - 2,width/2 - 4,height/2 - 4)
end
function M:traceBubble( bubble1,bubble2 )
    local x = bubble1:getPositionX() - bubble2:getPositionX()
    local y = bubble1:getPositionY() - bubble2:getPositionY()
    local w = bubble1:getContentSize().width 

    if (x*x + y*y) < w * w then
		return true
	end
	return false
end
function M:initBubbleLayer(  )
	self.bubbleArray = {}
	for i=1,10 do
		local bubble = display.newSprite("#bubble_blue.png")
		local orgx,orgy = math.random(bubbleScope[1],bubbleScope[2]),math.random(bubbleScope[3],bubbleScope[4])
		bubble:setPosition( orgx,orgy)
		bubble.offset = self:randomVector()
		if bubble.offset.x ==vec[2] then
			bubble.offset.x = vec[3]
		end
		if bubble.offset.y ==vec[2] then
			bubble.offset.y = vec[3]
		end
		self:addChild(bubble)	
		self.bubbleArray[#self.bubbleArray+1] = bubble
	end
end
--返回方向向量

function M:randomVector(  )
	
	return {x=vec[math.random(1,3)],y=vec[math.random(1,3)]}
end
return M
