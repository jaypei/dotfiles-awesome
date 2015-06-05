
local awful = require("awful")
local beautiful = require("beautiful")
local exz_keys = require("exz.keys")
local exz_tag = require("exz.tag")
local screen = screen
local config = require("exz.config")
local mouse = mouse
local awful_rules = require("awful.rules")
local awful_placement = require("awful.placement")

module("exz.rules")

local scount = screen.count()

function move_client_tag(c, tagidx)
   awful.client.movetotag(
      exz_tag.tags[mouse.screen][tagidx], c)
end

function make_move_client_tag(tagidx)
   local tagidx = tagidx
   function fn(c)
      move_client_tag(c, tagidx)
   end
   return fn
end

-- Use xprop to view class and instance

awful_rules.rules = {
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
   -- floating
   {
      rule_any = { class = {
          "desktop_window", "MPlayer", "pinentry", "rdesktop",
      }},
      properties = { floating = true }
   },
   -- emacs
   {
      rule = { class = "Emacs", instance = "_Remember_" },
      properties = { floating = true },
      callback = awful.titlebar.add
   },
   -- qtalk
   {
      rule = { class = "QunarIM" },
      properties = {
          floating = true,
          border_width = 0
      },
      callback = make_move_client_tag(5)
   },
   -- aliwangwang
   {
      rule = { class = "AliWangWang" },
      properties = {
          floating = true,
          border_width = 0
      },
      callback = make_move_client_tag(6)
   },
   -- virtualbox
   {
      rule = { class = "VirtualBox" },
      callback = make_move_client_tag(7)
   },
   { 
      rule = { class = "VirtualBox", name = "Oracle VM VirtualBox Manager" },
      properties = { floating = true }
   },
   -- thunderbird
   {
      rule = { class = "Thunderbird" },
      callback = make_move_client_tag(8)
   },
   -- web browser
   {
      rule_any = { class = { "Firefox", "Chromium-browser", "Google-chrome" } },
      callback = make_move_client_tag(9)
   },
   {
      rule = { class = "Firefox", name = "Youdao translation" },
      properties = { floating = true }
   },
   -- Password prompt
   {
      rule_any = { class = { "gcr-prompter", "Gcr-prompter" } },
      properties = { opacity = 0.9 },
      callback = awful_placement.centered
   },
}
