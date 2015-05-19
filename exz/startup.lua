local awful = require("awful")
awful.util = require("awful.util")
local utils = require("exz.utils")
local os = os
local std = std

module("exz.startup")

-- os.execute("setxkbmap -layout 'us,ua' -variant 'winkeys' -option 'grp:caps_toggle,grp_led:caps,compose:menu' &")
-- should disable the fcitx option OverrideSystemXKBSettings
