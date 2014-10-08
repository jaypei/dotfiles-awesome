
local wibox = require("wibox")
local lain = require("lain")

markup = lain.util.markup

net_widgetdl = wibox.widget.textbox()
net_widgetul = lain.widgets.net({
      settings = function ()
         -- widget:set_markup(markup.font("Tamsyn 1", "  ") .. net_now.sent)
         net_widgetdl:set_markup(markup.font("Tamsyn 1", " ") .. net_now.received .. markup.font("Tamsyn 1", " "))
      end
})

return net_widgetul
