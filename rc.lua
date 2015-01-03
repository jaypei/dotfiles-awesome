require("awful.autofocus")

local awful      = require("awful")
local wibox      = require("wibox")
local beautiful  = require("beautiful")
local cyclefocus = require('cyclefocus')

local config = require("exz.config")
local utils = require("exz.utils")
local lain = require("lain")

require("exz.error_handling")
-- Java GUI's fix:
awful.util.spawn_with_shell("wmname LG3D")
require("exz.theme")
require("exz.tag")
require("exz.menu")
require("exz.wibox")
require("exz.keys")
require("exz.rules")
require("exz.client_signal")
require("exz.startup")
