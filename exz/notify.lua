
-- local config = require("exz.config")
local naughty = require("naughty")

module("exz.notify")

-- naughty.config.defaults.screen = config.main_screen
naughty.config.defaults.timeout = 30
naughty.config.defaults.font = "Fantasque Sans Mono 20px"
naughty.config.defaults.bg = "#551111"
naughty.config.defaults.fg = "#FFFFFF"
naughty.config.defaults.border_color = "#FF0000"

function info(title, text)
   local scount = screen.count()
   for i = 1, scount do
      naughty.notify({ preset = naughty.config.presets.info,
                       title = title,
                       text = text,
                       screen = i})
   end
end

function critical(title, text)
   local scount = screen.count()
   for i = 1, scount do
      naughty.notify({ preset = naughty.config.presets.critical,
                       title = title,
                       text = text,
                       screen = i})
   end
end
