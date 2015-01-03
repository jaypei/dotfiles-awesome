-----------------------------------------------------------------------------
-- Copyright @ 2015 jaypei
-- Author: jaypei <jaypei97159@gmail.com>
-----------------------------------------------------------------------------

local tag       = require("awful.tag")
local beautiful = require("beautiful")
local math      = { ceil  = math.ceil,
                    floor = math.floor,
                    max   = math.max }
local tonumber  = tonumber

local layout = { name = "coding" }

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

   -- How many vertical columns?
   local t = tag.selected(p.screen)
   local num_x = layout.nmaster or tag.getnmaster(t)

   -- Do at least "desired_y" rows.
   local desired_y = layout.ncol or tag.getncol(t)

   local useless_gap_half = math.ceil(useless_gap / 2)
   local term_width = math.ceil(wa.width / 2.85) - useless_gap_half
   local term_height = math.ceil(wa.height / 2) - useless_gap_half
   local editor_width = wa.width - term_width - useless_gap
   local editor_height = wa.height
   local term_width_half = math.ceil(term_width / 2)
   local term_height_half = math.ceil(term_height / 2)

   if #cls > 0 then
      local c, is_focused
      local g = {}
      local block_idx
      local zoom_in_gap = useless_gap
      for i = #cls,1,-1 do
         c = cls[i]
         is_focused = client.focus == c

         -- set block index
         if i == #cls then
            block_idx = 3
         elseif i == #cls-1 then
            block_idx = 2
         elseif i == #cls-2 then
            block_idx = 1
         else
            block_idx = 99
         end

         -- zoom in
         if block_idx == 99 then
            zoom_in_gap = zoom_in_gap + useless_gap * 4
         end

         -- x
         if block_idx <= 2 then
            g.x = wa.x
         elseif block_idx == 3 then
            g.x = term_width + useless_gap * 2
            if is_focused then
               g.x = g.x - term_width_half
            end
         else
            g.x = wa.x + zoom_in_gap
         end
         -- y
         if block_idx == 1 or block_idx == 3 then
            g.y = wa.y
         elseif block_idx == 2 then
            g.y = wa.y + term_height + useless_gap
         else
            g.y = wa.y + zoom_in_gap
         end
         -- width / height
         if block_idx <= 2 then
            g.width = term_width
            g.height = term_height
         elseif block_idx == 3 then
            g.width = editor_width
            g.height = editor_height
            if is_focused then
               g.width = g.width + term_width_half
            end
         else
            g.width = wa.width - zoom_in_gap * 2
            g.height = wa.height - zoom_in_gap * 2
         end

         -- set geometry
         c:geometry(g)
      end
   end

end

return layout
