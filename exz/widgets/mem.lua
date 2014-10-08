
local lain = require("lain")
local wibox = require("wibox")
local markups = require("exz.widgets.markups")
local beautiful = require("beautiful")

mem_widget = lain.widgets.mem({
    settings = function()
        widget:set_markup(markups.space3 .. mem_now.used .. "MB" .. markups.markup.font("Tamsyn 4", " "))
    end
})

widget_mem = wibox.widget.imagebox()
widget_mem:set_image(beautiful.widget_mem)
memwidget = wibox.widget.background()
memwidget:set_widget(mem_widget)
memwidget:set_bgimage(beautiful.widget_display)

return {
   icon = widget_mem,
   widget = memwidget
}
