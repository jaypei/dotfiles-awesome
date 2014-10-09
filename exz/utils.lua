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

exec   = function (s) oldspawn(s, false) end
sexec = awful.util.spawn_with_shell

function texec (cmd)
   local exec_cmd = config.terminal .. " -e sh -c \"" .. cmd .. "\""
   print(exec_cmd)
   exec(exec_cmd)
end

function sexec_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
     findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end
