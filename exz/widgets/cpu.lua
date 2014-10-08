local beautiful = require("beautiful")
local wibox = require("wibox")
local lain = require("lain")
local markups = require("exz.widgets.markups")

cpu_widget = lain.widgets.cpu({
    settings = function()
        widget:set_markup(markups.space3 .. cpu_now.usage .. "%" .. markups.markup.font("Tamsyn 4", " "))
    end
})

cpuwidget = wibox.widget.background()
cpuwidget:set_widget(cpu_widget)
cpuwidget:set_bgimage(beautiful.widget_display)

widget_cpu = wibox.widget.imagebox()
widget_cpu:set_image(beautiful.widget_cpu)

return {
   icon = widget_cpu,
   widget = cpuwidget
}


-- tmp_widget = wibox.widget.textbox()
-- vicious.register(tmp_widget, vicious.widgets.thermal, vspace1 .. "$1°C" .. vspace1, 9, "thermal_zone0")

-- widget_tmp = wibox.widget.imagebox()
-- widget_tmp:set_image(beautiful.widget_tmp)
-- tmpwidget = wibox.widget.background()
-- tmpwidget:set_widget(tmp_widget)
-- tmpwidget:set_bgimage(beautiful.widget_display)

