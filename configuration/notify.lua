local notify = require("notify")

notify.setup({
  background_colour = "#1a1b26", 
  timeout = 3000,
  max_width = 120,
  render = "default", 
  stages = "fade",
})

-- handle if title is empty and create custom title
local orig_notify = vim.notify
vim.notify = function(msg, level, opts)
    -- handle if empty messages
  if type(msg) == "string" and msg:match("^%s*$") then
    return
  end

  opts = opts or {}
  if not opts.title or opts.title == "" then
    opts.title = "Message"
  end

  return orig_notify(msg, level, opts)
end
