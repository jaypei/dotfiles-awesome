
local os = os
module("exz.config")

-- This is used later as the default terminal and editor to run.
-- terminal = "x-terminal-emulator"
terminal = "urxvt"

default_editor = "emacs"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"


-- DO NOT EDIT --
home = os.getenv("HOME")
awconf_dir = home .. "/.config/awesome"
editor = os.getenv("EDITOR") or default_editor
editor_cmd = terminal .. " -e " .. editor
