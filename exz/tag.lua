
require("awful.layout")
require("awful.tag")
local awful = require("awful")
local screen = screen
local ipairs = ipairs

module("exz.tag")

-- Window management layouts
layouts = {
  awful.layout.suit.tile,        -- 1
  awful.layout.suit.tile.bottom, -- 2
  awful.layout.suit.fair,        -- 3
  awful.layout.suit.max,         -- 4
  awful.layout.suit.magnifier,   -- 5
  awful.layout.suit.floating     -- 6
}

tags = {
  names  = { "term", "emacs", "web", "mail", "fs", "doc", 7, "gimp", "vm" },
  layout = { layouts[3], layouts[1], layouts[2], layouts[4], layouts[2],
             layouts[2], layouts[2], layouts[1], layouts[4]
}}

for s = 1, screen.count() do
  tags[s] = awful.tag(tags.names, s, tags.layout)
  for i, t in ipairs(tags[s]) do
      awful.tag.setproperty(t, "mwfact", i==8 and 0.13  or  0.5)
      awful.tag.setproperty(t, "hide",  i==7 and true)
  end
end
