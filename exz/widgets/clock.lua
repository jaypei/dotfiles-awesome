local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")
local markups = require("exz.widgets.markups")

mytextclock    = awful.widget.textclock(
  markups.markup(
    markups.clockgf,
    markups.space3 .. "%Y-%m-%d %H:%M" ..
      markups.markup.font("Tamsyn 3", " ")))
mytextcalendar = awful.widget.textclock(
  markups.markup(markups.clockgf, markups.space3 .. "%a %d %b %H:%M"))

widget_clock = wibox.widget.imagebox()
widget_clock:set_image(beautiful.widget_clock)

clockwidget = wibox.widget.background()
clockwidget:set_widget(mytextclock)
clockwidget:set_bgimage(beautiful.widget_display)

local index = 1
local loop_widgets = { mytextclock, mytextcalendar }
local loop_widgets_icons = { beautiful.widget_clock, beautiful.widget_cal }

clockwidget:buttons(awful.util.table.join(awful.button({}, 1,
    function ()
        index = index % #loop_widgets + 1
        clockwidget:set_widget(loop_widgets[index])
        widget_clock:set_image(loop_widgets_icons[index])
    end)))

return {
   icon = widget_clock,
   widget = clockwidget
}
