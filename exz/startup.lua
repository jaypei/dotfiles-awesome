local awful = require("awful")
awful.util = require("awful.util")
local utils = require("exz.utils")
local os = os
local std = std

module("exz.startup")

os.execute("pkill compton")
-- os.execute("setxkbmap -layout 'us,ua' -variant 'winkeys' -option 'grp:caps_toggle,grp_led:caps,compose:menu' &")

-- should disable the fcitx option OverrideSystemXKBSettings
utils.sexec("/usr/bin/xmodmap ~/.xmodmaprc")
-- utils.sexec_once("parcellite")
utils.sexec_once("kbdd")
-- utils.sexec_once("compton")
-- utils.sexec_once("gnome-sound-applet")
-- utils.sexec_once("shutter --min_at_startup &")
