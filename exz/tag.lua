
require("awful.layout")
require("awful.tag")
local awful = require("awful")
local screen = screen
local ipairs = ipairs
local lain = require("lain")
local config = require("exz.config")
local exz_layout_coding = require("exz.layout.coding")

module("exz.tag")

-- Window management layouts
layouts = {
   exz_layout_coding,           -- 1
   lain.layout.uselessfair,     -- 2
   lain.layout.cascade,         -- 3
   awful.layout.suit.floating   -- 4
}

tags = {
   names  = { "C", "C", "T", "T", "O", "O", "VM", "MAIL", "WEB" },
   layout = { layouts[1], layouts[1],
              layouts[2], layouts[2],
              layouts[4], layouts[4],
              layouts[3], layouts[3], layouts[3] }
}

for s = 1, screen.count() do
   tags[s] = awful.tag(tags.names, s, tags.layout)
   for i, t in ipairs(tags[s]) do
      -- awful.tag.setproperty(t, "mwfact", i==8 and 0.13  or  0.5)
      -- awful.tag.setproperty(t, "hide",  i > 4 and i < 8 and true)
   end
   awful.screen.padding(screen[s], config.screen_padding)
end
