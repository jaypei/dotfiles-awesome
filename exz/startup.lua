local awful = require("awful")
awful.util = require("awful.util")
local utils = require("exz.utils")
local os = os

module("exz.startup")

os.execute("pkill compton")
-- os.execute("setxkbmap -layout 'us,ua' -variant 'winkeys' -option 'grp:caps_toggle,grp_led:caps,compose:menu' &")

-- should disable the fcitx option OverrideSystemXKBSettings
utils.sexec("/usr/bin/xmodmap ~/.xmodmaprc")
utils.sexec_once("kbdd")
utils.sexec_once("nm-applet &")
utils.sexec_once("shutter --min_at_startup &")
