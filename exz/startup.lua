local utils = require("exz.utils")
local os = os

module("exz.startup")

os.execute("pkill compton")
-- os.execute("setxkbmap -layout 'us,ua' -variant 'winkeys' -option 'grp:caps_toggle,grp_led:caps,compose:menu' &")
utils.sexec_once("parcellite")
utils.sexec_once("kbdd")
utils.sexec_once("compton")
utils.sexec_once("xmodmap ~/.xmodmaprc")
utils.sexec_once("gnome-sound-applet")
