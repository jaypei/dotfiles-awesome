--
-- Themes define colours, icons, and wallpapers
--

local beautiful = require("beautiful")
local awful = require("awful")
local config = require("exz.config")

module("exz.theme")

beautiful.init(config.awconf_dir .. "/themes/zenburn.lua")
-- beautiful.init("/usr/share/awesome/themes/zenburn/theme.lua")
