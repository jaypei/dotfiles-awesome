require("awful.rules")

local awful = require("awful")
local beautiful = require("beautiful")
local exz_keys = require("exz.keys")
local exz_tag = require("exz.tag")
local screen = screen

module("exz.rules")

local scount = screen.count()

-- Use xprop to view class and instance

awful.rules.rules = {
   -- All clients will match this rule.
   {
      rule = { },
      properties = {
         border_width = beautiful.border_width,
         border_color = beautiful.border_normal,
         focus = true,
         keys = exz_keys.clientkeys,
         buttons = exz_keys.clientbuttons
      }
   },
   {
      rule = {class = "MPlayer" },
      properties = { floating = true }
   },
   {
      rule = { class = "pinentry" },
      properties = { floating = true }
   },
   {
      rule = { class = "gimp" },
      properties = { floating = true }
   },
   {
      rule = { class = "Emacs", instance = "emacs" },
      properties = { tag = exz_tag.tags[scount][2] }
   },
   {
      rule = { class = "Emacs", instance = "_Remember_" },
      properties = { floating = true },
      callback = awful.titlebar.add
   },
   {
      rule = { class = "Firefox",  instance = "Navigator" },
      properties = { tag = exz_tag.tags[scount][3] }
   },
   {
      rule = { class = "VirtualBox" },
      properties = { tag = exz_tag.tags[scount][9] }
   },
   {
      rule = { class = "Thunderbird" },
      properties = { tag = exz_tag.tags[scount][4] }
   },
   -- Set Firefox to always map on tags number 2 of screen 1.
   -- { rule = { class = "Firefox" },
   --   properties = { tag = tags[1][2] } },
}
