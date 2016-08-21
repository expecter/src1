--
-- Author: Your Name
-- Date: 2016-06-17 22:32:31
--
local M = {{a = 1},{b = 2},{c = 3}}
local ta = M
M.a = 3
print(ta.a)