--
-- Author: yjxin
-- Date: 2016-08-29 23:32:42
--
local M = class(...,componentBase)
function M:ctor(params)
	M.super.ctor(self,params)
end
function M:initView( target )
end
function M:updateView( target )

end
function M:hightlight( target )
	target:updateSpriteName("img_btn_brown_2_n")
end
function M:normal( target )
	target:updateSpriteName("img_btn_gray_2_n")
end
function M:bindFunc( target )
	target:bindOnceMethod(self,"hightlight")
	target:bindOnceMethod(self,"normal")
end
return M