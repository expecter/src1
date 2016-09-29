--
-- Author: Your Name
-- Date: 2016-09-29 16:27:39
--
--[[
	cc.Node,cc.Color,cc.Vec2,cc.Size,cc.Rect,cc.Sprite,cc.Label,cc.Component
]]
local M = {
	{
		__type__ = "cc_node",
		_name = "",
		__id__ = 1,
		_children = {
			{
				__id__ = 2,
			}
		},
		_components = {
			{
				__id__ = 3,
			}
		},
		_parent = nil,
	},
	{
		__type__ = "cc_node",
		_name = "",
		__id__ = 2,
		_parent = {__id__ = 1},
	},
	{
		__type__ = "cc_Component",
		_name = "",
		__id__ = 3,
		_object = {__id__ = 1},
		text = "1111111",
		label = {__id__ = 4},
	},
	{
		__type__ = "cc_node",
		_name = "",
		__id__ = 4,
	},
	{
		__type__ = "cc_node",
		_name = "",
		__id__ = 2,
		_parent = {__id__ = 1},
		_components = {
			{
				__id__ = 3,
			}
		},
	},
	{
		__type__ = "cc.Sprite",
		__id__ = 2,
		_spriteFrame = "path",
	},
}

return M