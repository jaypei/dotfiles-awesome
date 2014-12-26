
require("awful.layout")
require("awful.tag")
local awful = require("awful")
local screen = screen
local ipairs = ipairs
local lain = require("lain")
local config = require("exz.config")

module("exz.tag")

-- Window management layouts
layouts = {
   lain.layout.termfair,       -- 1
   lain.layout.uselessfair,         -- 2
   lain.layout.uselessfair,  -- 3
   lain.layout.uselessfair,    -- 4
   lain.layout.uselesstile,    -- 5
   lain.layout.cascade,        -- 6
   lain.layout.centerwork      -- 7
}

tags = {
  names  = { "term", "emacs", "web",
             "mail", "fs", "doc",
             7, "gimp", "vm" },
  layout = { lain.layout.termfair, lain.layout.centerwork, layouts[2],
             layouts[4], layouts[2], layouts[2],
             layouts[2], lain.layout.uselessfair, layouts[4]
}}

for s = 1, screen.count() do
  tags[s] = awful.tag(tags.names, s, tags.layout)
  for i, t in ipairs(tags[s]) do
      awful.tag.setproperty(t, "mwfact", i==8 and 0.13  or  0.5)
      awful.tag.setproperty(t, "hide",  i==7 and true)
  end
  awful.layout.set(lain.layout.termfair, tags[s][1])
  awful.tag.setnmaster(2, tags[s][1])
  awful.tag.setncol(1, tags[s][1])
  awful.screen.padding(screen[s], config.screen_padding)
end
