local awful = require("awful")
awful.util = require("awful.util")
local config = require("exz.config")

local print = print

module("exz.utils")

-- Disable cursor animation:

local oldspawn = awful.util.spawn
awful.util.spawn = function (s)
    oldspawn(s, false)
end

local exec   = function (s) oldspawn(s, false) end
local sexec = awful.util.spawn_with_shell
local texec = function (cmd)
   local exec_cmd = config.terminal .. " -e sh -c \"" .. cmd .. "\""
   print(exec_cmd)
   exec(exec_cmd)
end
