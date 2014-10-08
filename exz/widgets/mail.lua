mail_widget = wibox.widget.textbox()
vicious.register(mail_widget, vicious.widgets.gmail, vspace1 .. "${count}" .. vspace1, 1200)

widget_mail = wibox.widget.imagebox()
widget_mail:set_image(beautiful.widget_mail)
mailwidget = wibox.widget.background()
mailwidget:set_widget(mail_widget)
mailwidget:set_bgimage(beautiful.widget_display)

mail_widget = wibox.widget.textbox()
vicious.register(mail_widget, vicious.widgets.gmail, vspace1 .. "${count}" .. vspace1, 1200)

widget_mail = wibox.widget.imagebox()
widget_mail:set_image(beautiful.widget_mail)
mailwidget = wibox.widget.background()
mailwidget:set_widget(mail_widget)
mailwidget:set_bgimage(beautiful.widget_display)
