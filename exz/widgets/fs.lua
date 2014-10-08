

local wibox = require("wibox")
local vicious = require("vicious")
local markups = require("exz.widgets.markups")
local beautiful = require("beautiful")

fs_widget = wibox.widget.textbox()
vicious.register(fs_widget, vicious.widgets.fs,
                 markups.vspace1 .. "${/ avail_gb}GB" .. markups.vspace1,
                 2)

widget_fs = wibox.widget.imagebox()
widget_fs:set_image(beautiful.widget_fs)
fswidget = wibox.widget.background()
fswidget:set_widget(fs_widget)
fswidget:set_bgimage(beautiful.widget_display)

return {
   icon = widget_fs,
   widget = fswidget
}
