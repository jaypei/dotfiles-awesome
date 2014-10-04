
local naughty = require("naughty")

module("exz.notify")

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
