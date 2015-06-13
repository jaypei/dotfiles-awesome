
config_dir = os.getenv("HOME") .. "/.config/awesome"

theme            = {}
theme.icons      = config_dir .. "/themes/exz/icons/"
theme.wallpaper  = config_dir .. "/themes/exz/wall.png"
theme.panel      = "png:" .. theme.icons .. "/panel/panel.png"
theme.font       = "Ubuntu Mono 11"

theme.fg_normal  = "#888888"
theme.fg_focus   = "#e4e4e4"
theme.fg_urgent  = "#CC9393"

theme.bg_normal  = "#3F3F3F"
theme.bg_focus   = "#5a5a5a"
theme.bg_urgent  = "#3F3F3F"
theme.bg_systray = "#343434" -- transparent tray fix

theme.clockgf    = "#d5d5c3"

-- | Borders | --

theme.border_focus_highprio  = "#FF0000"
theme.border_normal_highprio = "#A03333"

theme.border_focus_lowprio   = "#3333FF"
theme.border_normal_lowprio  = "#333366"

theme.border_width  = 1
theme.border_normal = "#006666"
theme.border_focus  = "#AAFF00"
theme.border_marked = "#666600"


-- | Menu | --

theme.menu_height = 16
theme.menu_width  = 160

-- | Layout | --

theme.layout_termfair      = config_dir .. "/lain/icons/layout/default/termfairw.png"
theme.layout_browse        = config_dir .. "/lain/icons/layout/default/browsew.png"
theme.layout_gimp          = config_dir .. "/lain/icons/layout/default/gimpw.png"
theme.layout_cascade       = config_dir .. "/lain/icons/layout/default/cascadew.png"
theme.layout_cascadebrowse = config_dir .. "/lain/icons/layout/default/cascadebrowsew.png"
theme.layout_centerwork    = config_dir .. "/lain/icons/layout/default/centerworkw.png"

theme.useless_gap_width = "8"


-- | Taglist | --

-- theme.taglist_bg_empty    = "png:" .. theme.icons .. "panel/taglist/empty.png"
-- theme.taglist_bg_occupied = "png:" .. theme.icons .. "panel/taglist/occupied.png"
-- theme.taglist_bg_urgent   = "png:" .. theme.icons .. "panel/taglist/urgent.png"
-- theme.taglist_bg_focus    = "png:" .. theme.icons .. "panel/taglist/focus.png"
theme.taglist_font = theme.font

-- | Tasklist | --

-- theme.tasklist_font                 = "Fantastic Mono 9"
theme.tasklist_disable_icon         = true
theme.tasklist_bg_normal            = "png:" .. theme.icons .. "panel/tasklist/normal.png"
theme.tasklist_bg_focus             = "png:" .. theme.icons .. "panel/tasklist/focus.png"
theme.tasklist_bg_urgent            = "png:" .. theme.icons .. "panel/tasklist/urgent.png"
theme.tasklist_fg_focus             = "#DDDDDD"
theme.tasklist_fg_urgent            = "#EEEEEE"
theme.tasklist_fg_normal            = "#AAAAAA"
theme.tasklist_floating             = ""
theme.tasklist_sticky               = ""
theme.tasklist_ontop                = ""
theme.tasklist_maximized_horizontal = ""
theme.tasklist_maximized_vertical   = ""

-- | Widget | --

theme.widget_display   = theme.icons .. "panel/widgets/display/widget_display.png"
theme.widget_display_r = theme.icons .. "panel/widgets/display/widget_display_r.png"
theme.widget_display_c = theme.icons .. "panel/widgets/display/widget_display_c.png"
theme.widget_display_l = theme.icons .. "panel/widgets/display/widget_display_l.png"

-- | MPD | --

theme.mpd_prev  = theme.icons .. "panel/widgets/mpd/mpd_prev.png"
theme.mpd_nex   = theme.icons .. "panel/widgets/mpd/mpd_next.png"
theme.mpd_stop  = theme.icons .. "panel/widgets/mpd/mpd_stop.png"
theme.mpd_pause = theme.icons .. "panel/widgets/mpd/mpd_pause.png"
theme.mpd_play  = theme.icons .. "panel/widgets/mpd/mpd_play.png"
theme.mpd_sepr  = theme.icons .. "panel/widgets/mpd/mpd_sepr.png"
theme.mpd_sepl  = theme.icons .. "panel/widgets/mpd/mpd_sepl.png"

-- | Separators | --

theme.spr    = theme.icons .. "panel/separators/spr.png"
theme.sprtr  = theme.icons .. "panel/separators/sprtr.png"
theme.spr4px = theme.icons .. "panel/separators/spr4px.png"
theme.spr5px = theme.icons .. "panel/separators/spr5px.png"

-- | Clock / Calendar | --

theme.widget_clock = theme.icons .. "panel/widgets/widget_clock.png"
theme.widget_cal   = theme.icons .. "panel/widgets/widget_cal.png"

-- | CPU / TMP | --

theme.widget_cpu    = theme.icons .. "panel/widgets/widget_cpu.png"

-- | MEM | --

theme.widget_mem = theme.icons .. "panel/widgets/widget_mem.png"

-- | FS | --

theme.widget_fs     = theme.icons .. "panel/widgets/widget_fs.png"
theme.widget_fs_hdd = theme.icons .. "panel/widgets/widget_fs_hdd.png"

-- | Mail | --

theme.widget_mail = theme.icons .. "panel/widgets/widget_mail.png"

-- | NET | --

theme.widget_netdl = theme.icons .. "panel/widgets/widget_netdl.png"
theme.widget_netul = theme.icons .. "panel/widgets/widget_netul.png"

-- | Battery | --

theme.widget_battery = theme.icons .. "panel/widgets/widget_battery.png"

-- | Misc | --

theme.menu_submenu_icon = theme.icons .. "submenu.png"

return theme
