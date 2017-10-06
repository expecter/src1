--
-- Author: Your Name
-- Date: 2017-10-05 19:54:35
--
local M = {}
cc(M):addComponent("components.behavior.EventProtocol"):exportMethods()
M.EVENT_BAG_USE = "event_bag_use"
M.EVENT_UPDATE = "EVENT_UPDATE"
return M