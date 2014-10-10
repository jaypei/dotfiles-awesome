

local lain = require("lain")
local wibox = require("wibox")
local beautiful = require("beautiful")
local markups = require("exz.widgets.markups")

net_widgetdl = wibox.widget.textbox()
net_widgetul = lain.widgets.net({
    notify = "off",
    settings = function()
        widget:set_markup(markups.markup.font("Tamsyn 1", "  ") .. net_now.sent)
        net_widgetdl:set_markup(markups.markup.font("Tamsyn 1", " ") .. net_now.received .. markups.markup.font("Tamsyn 1", " "))
    end
})

widget_netdl = wibox.widget.imagebox()
widget_netdl:set_image(beautiful.widget_netdl)
netwidgetdl = wibox.widget.background()
netwidgetdl:set_widget(net_widgetdl)
netwidgetdl:set_bgimage(beautiful.widget_display)

widget_netul = wibox.widget.imagebox()
widget_netul:set_image(beautiful.widget_netul)
netwidgetul = wibox.widget.background()
netwidgetul:set_widget(net_widgetul)
netwidgetul:set_bgimage(beautiful.widget_display)

return {
   dl_icon = widget_netdl,
   ul_icon = widget_netul,
   dl_widget = netwidgetdl,
   ul_widget = netwidgetul
}
