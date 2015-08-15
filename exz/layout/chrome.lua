-----------------------------------------------------------------------------
-- Copyright @ 2015 jaypei
-- Author: jaypei <jaypei97159@gmail.com>
-----------------------------------------------------------------------------

local beautiful = require("beautiful")
local tonumber  = tonumber

local layout = { name = "chrome" }

function is_sidebar (c)
  return
    -- Chrome Tabs Outline
    c.instance == "crx_eggkanocgddhmamlbiijnphhppkpkmkl"
end

function layout.arrange(p)

  -- A useless gap (like the dwm patch) can be defined with
  -- beautiful.useless_gap_width.
  local useless_gap = tonumber(beautiful.useless_gap_width) or 0
  if useless_gap < 0 then useless_gap = 0 end

  -- A global border can be defined with
  -- beautiful.global_border_width
  local global_border = tonumber(beautiful.global_border_width) or 0
  if global_border < 0 then global_border = 0 end


  -- Themes border width requires an offset
  local bw = tonumber(beautiful.border_width) or 0

  -- Screen.
  local wa = p.workarea
  local cls = p.clients

  -- Borders are factored in.
  wa.height = wa.height - ((global_border * 2) + (bw * 2))
  wa.width = wa.width - ((global_border * 2) + (bw * 2))

  local chrome_sidebar_width = 300
  local chrome_sidebar_orientat = "left"

  if #cls > 0 then
    local c
    local g = {}
    local has_sidebar = false
    for i = #cls, 1, -1 do
      c = cls[i]
      if is_sidebar(c) then
        has_sidebar = true
      end
    end
    for i = #cls,1,-1 do
      c = cls[i]
      -- sidebar
      if has_sidebar then
        if is_sidebar(c) then
          g.width = chrome_sidebar_width
          if chrome_sidebar_orientat == "left" then
            g.x = wa.x
          else
            g.x = wa.width - chrome_sidebar_width + useless_gap
          end
          g.y = wa.y
          g.width = chrome_sidebar_width
          g.height = wa.height
        else
          if chrome_sidebar_orientat == "left" then
            g.x = wa.x + chrome_sidebar_width + useless_gap
          else
            g.x = wa.x
          end
          g.y = wa.y
          g.width = wa.width - chrome_sidebar_width - useless_gap
          g.height = wa.height
        end
      else
        g.x = wa.x
        g.y = wa.y
        g.width = wa.width
        g.height = wa.height
      end

      -- set geometry
      c:geometry(g)
    end
  end

end

return layout
