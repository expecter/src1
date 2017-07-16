-----------------------------------------------------------------------------------------------  
-- @description 弹出窗管理类 
-- @author  ny
-- @coryright  蜂鸟工作室
-- @release  2014/7/10
--------------------------------------------------------------------------------------------

local M = class(..., function()
    return display.newNode()
end)

function M:ctor()
    self.ltPanels = {}
    self:setVisible(false)

    self._ccLayerBackground = display.newColorLayer(cc.c4b(0,0,0,178))
    self:addChild(self._ccLayerBackground,-1)
end

--加入Panel
function M:addPanel(ccPanel, fCallback)

    --保存此ccPanel所在PanelMgr
    ccPanel.__runningGamePanelMgr = self

    --插入框
    table.insert(self.ltPanels, 1, ccPanel)
    self:addChild(ccPanel)
    self:setVisible(true)

    self:reorderPanel()

    local function helper()
        --初始化
        GameSceneMgr.mask(true)
        
        --初始化
        -- local function initPanel()
            for _, initview in ipairs(ccPanel:getTlInitView()) do
                initview()
            end
            for _, enterView in ipairs(ccPanel:getTlOnEnter()) do
                enterView()
            end
        -- end

        --分发事件
        GameSceneMgr:dispatchEvent{
            name = "ready",
            data = {
                gameLayer = ccPanel,
                action = "showPanel",
                gamePanelMgr = self,
            },
        }

        GameSceneMgr.mask(false)

        if fCallback then
            fCallback(ccPanel)
        end
    end

    coroutine.wrap(helper)()
end


function M:_onPanelCleanup(ccPanel) 
  for pos, panel in ipairs(self.ltPanels) do
      if panel == ccPanel then
          table.remove(self.ltPanels, pos)
          break
      end
  end
  if #self.ltPanels == 0 then
      self:setVisible(false)
  end

end

--删除指定Panel
function M:removePanel(ccPanel)
    local oldRunning = GameSceneMgr.getRunning()
    if ccPanel.fCloseListener and type(ccPanel.fCloseListener)=="function" then
        ccPanel.fCloseListener()
    end

    for _, releaseView in ipairs(ccPanel:getTlReleaseView()) do
        releaseView()
    end
    for _, exitView in ipairs(ccPanel:getTlOnExit()) do
        exitView()
    end
    self:_onPanelCleanup(ccPanel)

    self:removeChild(ccPanel)

    --回收纹理
    cc.Director:getInstance():getTextureCache():removeUnusedTextures()
    --lua回收
    collectgarbage("collect")

    self:reorderPanel()

    local newRunning = GameSceneMgr.getRunning()
    if oldRunning ~= newRunning then
        if newRunning then
            --分发事件
            GameSceneMgr:dispatchEvent{
                name = "ready",
                data = {
                    gameLayer = oldRunning,
                    action = "closePanel",
                    gamePanelMgr = self,
                },
            }
        end
    end
end

--删除所有Panel
function M:removeAllPanels()

    local oldRunning = GameSceneMgr.getRunning()

    local ltTempPanels = {}
    for _, ccPanel in ipairs(self.ltPanels) do
       table.insert(ltTempPanels, ccPanel) 
    end
    
    for _, ccPanel in ipairs(ltTempPanels) do
        if ccPanel.fCloseListener and type(ccPanel.fCloseListener)=="function" then
            ccPanel.fCloseListener()
        end
        self:_onPanelCleanup(ccPanel)
        self:removeChild(ccPanel)
    end

    --回收纹理
    cc.Director:getInstance():getTextureCache():removeUnusedTextures()
    --lua回收
    collectgarbage("collect")

    self:reorderPanel()

    local newRunning = GameSceneMgr.getRunning()
    if oldRunning ~= newRunning then
        if newRunning then
            --分发事件
            GameSceneMgr:dispatchEvent{
                name = "ready",
                data = {
                    gameLayer = newRunning,
                    action = "closePanel",
                    gamePanelMgr = self,
                },
            }
        end
    end
end

--获取当前最上层的panel
function M:getRunningPanel()
    local ccPanel = self.ltPanels[1]
    return ccPanel
end

--获取指定panel, index 1为最上层, 2为第二层
function M:getPanel(index)
    return self.ltPanels[ index ]
end

--获取所有的Panel
function M:getAllPanels()
    return self.ltPanels
end

--对panel重新排序
function M:reorderPanel(f)
    self._ccLayerBackground:setVisible(false)
    local hasshow = false
    local len = #self.ltPanels
    for index, panel in ipairs(self.ltPanels) do
        local order = (len+1-index) * 2
        panel:setLocalZOrder(order)
        if (not hasshow) and panel:getIsBackGroundVisible() then
            self._ccLayerBackground:setLocalZOrder( order-1 )
            self._ccLayerBackground:setVisible(true)
            hasshow = true
        end
    end
end

return M

