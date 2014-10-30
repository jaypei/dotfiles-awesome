
require("awful.layout")
require("awful.tag")
local awful = require("awful")
local screen = screen
local ipairs = ipairs
local vain = require("vain")

module("exz.tag")

-- Window management layouts
layouts = {
   vain.layout.termfair,       -- 1
   vain.layout.browse,         -- 2
   vain.layout.cascadebrowse,  -- 3
   vain.layout.uselessfair,    -- 4
   vain.layout.uselesstile,    -- 5
   vain.layout.cascade,        -- 6
   vain.layout.centerwork      -- 7
}

tags = {
  names  = { "term", "emacs", "web",
             "mail", "fs", "doc",
             7, "gimp", "vm" },
  layout = { vain.layout.termfair, vain.layout.centerwork, layouts[2],
             layouts[4], layouts[2], layouts[2],
             layouts[2], vain.layout.gimp, layouts[4]
}}

for s = 1, screen.count() do
  tags[s] = awful.tag(tags.names, s, tags.layout)
  for i, t in ipairs(tags[s]) do
      awful.tag.setproperty(t, "mwfact", i==8 and 0.13  or  0.5)
      awful.tag.setproperty(t, "hide",  i==7 and true)
  end
  awful.layout.set(vain.layout.termfair, tags[s][1])
  awful.tag.setnmaster(3, tags[s][1])
  awful.tag.setncol(2, tags[s][1])
end
