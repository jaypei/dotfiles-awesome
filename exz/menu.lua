
require("awful.widget")
require("awful.util")

local awesome = awesome

local awful = require("awful")
local beautiful = require("beautiful")
-- local debian_menu = require("debian.menu")
local config = require("exz.config")

module("exz.menu")

myawesomemenu = {
   { "manual", config.terminal .. " -e man awesome" },
   { "edit config", config.editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "logout", function ()
        awful.util.spawn("gnome-session-quit")
   end },
   { "shutdown", function ()
        awful.util.spawn("gnome-session-quit --power-off")
   end }
}

mainmenu = awful.menu(
   {
      items = {
         { "awesome", myawesomemenu, beautiful.awesome_icon },
         -- { "Debian", debian_menu.Debian_menu.Debian },
         { "open terminal", config.terminal }
      }
   }
)

-- mylauncher = awful.widget.launcher(
--    {
--       image = image(beautiful.awesome_icon),
--       menu = mymainmenu
--    }
-- )
