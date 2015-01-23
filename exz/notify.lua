
local config = require("exz.config")
local naughty = require("naughty")

module("exz.notify")

naughty.config.defaults.screen = config.main_screen
naughty.config.defaults.timeout = 0
naughty.config.defaults.font = "Fantasque Sans Mono 20px"
naughty.config.defaults.bg = "#551111"
naughty.config.defaults.fg = "#FFFFFF"
naughty.config.defaults.border_color = "#FF0000"

function info(title, text)
   naughty.notify({ preset = naughty.config.presets.info,
                    title = title,
                    text = text })
end

function critical(title, text)
   naughty.notify({ preset = naughty.config.presets.critical,
                    title = title,
                    text = text })
end
