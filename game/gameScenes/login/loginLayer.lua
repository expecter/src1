local M = class(..., function (  )
    return display.newLayer()
end)
function M:ctor()
    self.owner = CCBReader.load("ccbi_login.ccbi")
    self:addChild(self.owner)
    --使用组件控制
    local layer =herolayer.show()
    layer:switchto(1)

    local node = GameNode.new({
    	view = "",
    	com = {

    	},
    	})
    node:addComponent({})
    node:initView(self) --不一定需要调用，以及添加过得直接过了
end

function M:A(  )
	
end

function M:B(  )
	
end

return M
