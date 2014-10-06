require("awful.util")

local awful = require("awful")
local config = require("exz.config")
local print = print

module("exz.utils")

exec = awful.util.spawn
sexec = awful.util.spawn_with_shell
texec = function (cmd)
   local exec_cmd = config.terminal .. " -e sh -c \"" .. cmd .. "\""
   print(exec_cmd)
   exec(exec_cmd)
end
