--
-- Themes define colours, icons, and wallpapers
--

local beautiful = require("beautiful")
local awful = require("awful")
local config = require("exz.config")
local gears      = require("gears")
local screen = screen

module("exz.theme")

-- | Theme | --

beautiful.init(config.awconf_dir .. "/themes/" .. config.theme .. "/theme.lua")

-- | Wallpaper | --

if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.tiled(beautiful.wallpaper, s)
        -- gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end

