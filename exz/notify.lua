
local config = require("exz.config")
local naughty = require("naughty")

module("exz.notify")

naughty.config.defaults.screen = config.main_screen

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
