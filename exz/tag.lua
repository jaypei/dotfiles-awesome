
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
   lain.layout.termfair,        -- 2
   lain.layout.uselessfair,     -- 3
   lain.layout.uselesstile,     -- 4
   lain.layout.cascade,         -- 5
   lain.layout.centerwork       -- 6
}

tags = {
   names  = { "1.code", "2.code", "3.term", "4.term", "5", "6", "7", "8.mail", "9.web" },
   layout = { layouts[1], layouts[1], layouts[3],
              layouts[3], layouts[2], layouts[2],
              layouts[2], layouts[2], layouts[4] }
}

for s = 1, screen.count() do
   tags[s] = awful.tag(tags.names, s, tags.layout)
   for i, t in ipairs(tags[s]) do
      awful.tag.setproperty(t, "mwfact", i==8 and 0.13  or  0.5)
      awful.tag.setproperty(t, "hide",  i > 4 and i < 8 and true)
   end
   -- awful.layout.set(lain.layout.termfair, tags[s][1])
   -- awful.tag.setnmaster(2, tags[s][1])
   -- awful.tag.setncol(1, tags[s][1])
   awful.screen.padding(screen[s], config.screen_padding)
end
