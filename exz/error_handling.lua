local awesome = awesome
local notify = require("exz.notify")

module("exz.error_handling")

-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
   notify.critical("Oops, there were errors during startup!",
                   awesome.startup_errors)
end

-- Handle runtime errors after startup
do
   local in_error = false
   awesome.connect_signal(
      "debug::error",
      function (err)
         -- Make sure we don't go into an endless error loop
         if in_error then
            return
         end
         in_error = true

         notify.critical("Oops, an error happened!",
                         err)
         in_error = false
      end
   )
end
