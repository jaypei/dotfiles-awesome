
require("awful.layout")
require("awful.tag")

local awful = require("awful")
local screen = screen
local config = require("exz.config")
local utils = require("exz.utils")
local exz_menu = require("exz.menu")
local exz_tag = require("exz.tag")
local exz_wibox = require("exz.wibox")
local modkey = config.modkey
local root = root
local awesome = awesome
local mouse = mouse
local math = math
local client = client
local cyclefocus = require("cyclefocus")

local home   = config.home
local exec   = utils.exec
local shexec = utils.sexec

module("exz.keys")


-- | Mouse bindings | --
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () exz_menu.mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

-- | Key bindings | --
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w",      function () exz_menu.mainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q",
       function ()
          awful.util.spawn("gnome-session-quit")
       end
    ),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(exz_tag.layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(exz_tag.layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),
    awful.key({ modkey, "Control" }, "r",      awesome.restart),
    awful.key({ modkey, "Shift"   }, "q",      awesome.quit),
    awful.key({ modkey,           }, "Return", function () exec(config.terminal) end),
    awful.key({ modkey,           }, "s",      function () exec(config.filemanager) end),
    awful.key({ modkey            }, "Print",  function () exec("gnome-screenshot") end),
    awful.key({ modkey            }, "a",  function () exec("gnome-screenshot -a") end),
    awful.key({ modkey, "Control" }, "m",      function () shexec(ncmpcpp) end),

    -- Prompt
    awful.key({ modkey }, "r", function ()
          exz_wibox.mypromptbox[mouse.screen]:run()
    end),

    awful.key({ modkey }, "x", function ()
          awful.prompt.run({ prompt = "Run Lua code: " },
             exz_wibox.mypromptbox[mouse.screen].widget,
             awful.util.eval, nil,
             awful.util.getdir("cache") .. "/history_eval")
    end),


    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    -- awful.key({ modkey,           }, "Tab",
    --     function ()
    --         awful.client.focus.history.previous()
    --         if client.focus then
    --             client.focus:raise()
    --         end
    --     end),
    -- awful.key({ modkey,         }, "Tab", function(c)
    --         cyclefocus.cycle(1, {modifier="Super_L"})
    -- end),
    -- awful.key({ modkey, "Shift" }, "Tab", function(c)
    --         cyclefocus.cycle(-1, {modifier="Super_L"})
    -- end),
    cyclefocus.key({ "Mod1", }, "Tab", 1, {
        cycle_filters = { cyclefocus.filters.same_screen, cyclefocus.filters.common_tag },
        keys = {'Tab', 'ISO_Left_Tab'}
    })
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey            }, "Next",   function () awful.client.moveresize( 20,  20, -40, -40) end),
    awful.key({ modkey            }, "Prior",  function () awful.client.moveresize(-20, -20,  40,  40) end),
    awful.key({ modkey            }, "Down",   function () awful.client.moveresize(  0,  20,   0,   0) end),
    awful.key({ modkey            }, "Up",     function () awful.client.moveresize(  0, -20,   0,   0) end),
    awful.key({ modkey            }, "Left",   function () awful.client.moveresize(-20,   0,   0,   0) end),
    awful.key({ modkey            }, "Right",  function () awful.client.moveresize( 20,   0,   0,   0) end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#exz_tag.tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do

   globalkeys = awful.util.table.join(
      globalkeys,
      awful.key({ modkey }, "#" .. i + 9,
         function ()
            local screen = mouse.screen
            local tag = awful.tag.gettags(screen)[i]
            if tag then
               awful.tag.viewonly(tag)
            end
      end),
      awful.key({ modkey, "Control" }, "#" .. i + 9,
         function ()
            local screen = mouse.screen
            local tag = awful.tag.gettags(screen)[i]
            if tag then
               awful.tag.viewtoggle(tag)
            end
      end),
      awful.key({ modkey, "Shift" }, "#" .. i + 9,
         function ()
            if client.focus then
               local tag = awful.tag.gettags(client.focus.screen)[i]
               if tag then
                  awful.client.movetotag(tag)
               end
            end
      end),
      awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
         function ()
            if client.focus then
               local tag = awful.tag.gettags(client.focus.screen)[i]
               if tag then
                  awful.client.toggletag(tag)
               end
            end
   end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

awful.menu.menu_keys = {
    up    = { "k", "Up" },
    down  = { "j", "Down" },
    exec  = { "l", "Return", "Space" },
    enter = { "l", "Right" },
    back  = { "h", "Left" },
    close = { "q", "Escape" }
}

-- Set keys
root.keys(globalkeys)
