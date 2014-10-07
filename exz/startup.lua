local utils = require("exz.utils")

module("exz.startup")

utils.sexec("xmodmap ~/.xmodmaprc")
utils.sexec("gnome-sound-applet &")
