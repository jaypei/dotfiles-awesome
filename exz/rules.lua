require("awful.rules")

local awful = require("awful")
local beautiful = require("beautiful")
local exz_keys = require("exz.keys")
local exz_tag = require("exz.tag")
local screen = screen
local config = require("exz.config")

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
         buttons = exz_keys.clientbuttons,
         size_hints_honor = false
      }
   },
   {
      rule_any = { class = { "MPlayer", "pinentry" } },
      properties = { floating = true }
   },
   {
      rule = { class = "Gimp" },
      properties = { tag = exz_tag.tags[config.main_screen][8], floating = false }
   },
   {
      rule = { class = "Emacs", instance = "emacs" },
      properties = { tag = exz_tag.tags[config.main_screen][2] }
   },
   {
      rule = { class = "Firefox", name = "Youdao translation" },
      properties = { floating = true }
   },
   {
      rule = { class = "Emacs", instance = "_Remember_" },
      properties = { floating = true },
      callback = awful.titlebar.add
   },
   {
      rule_any = { class = { "Firefox", "Chromium-browser" } },
      properties = { tag = exz_tag.tags[config.main_screen][3] }
   },
   {
      rule = { class = "VirtualBox" },
      properties = { tag = exz_tag.tags[config.main_screen][9] }
   },
   {
      rule = { class = "Thunderbird" },
      properties = { tag = exz_tag.tags[config.main_screen][4] }
   },
   {
      rule = { class= "Thunar" },
      properties = { tag = exz_tag.tags[config.main_screen][5] }
   }
}
