
local wibox = require("wibox")
local vicious = require("vicious")
local markups = require("exz.widgets.markups")
local beautiful = require("beautiful")

text_bat = wibox.widget.textbox()
vicious.register(text_bat, vicious.widgets.bat,
                 "$1$2%", 61, "BAT0")

widget_bat = wibox.widget.imagebox()
widget_bat:set_image(beautiful.widget_battery)
bat_widget = wibox.widget.background()
bat_widget:set_widget(text_bat)
bat_widget:set_bgimage(beautiful.widget_display)

return {
   icon = widget_bat,
   widget = bat_widget
}
