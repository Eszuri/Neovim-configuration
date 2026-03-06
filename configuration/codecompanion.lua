require("blink.cmp").setup({
  sources = {
    per_filetype = {
      codecompanion = { "codecompanion" },
    },
    default = { "lsp", "path", "snippets", "buffer" },
  },
})
-- Keymap untuk insert file path di codecompanion
vim.api.nvim_create_autocmd("FileType", {
  pattern = "codecompanion",
  callback = function()
    -- <C-f> untuk buka file picker lalu insert path
    vim.keymap.set("i", "<C-f>", function()
      require("telescope.builtin").find_files({
        attach_mappings = function(prompt_bufnr, map)
          local actions = require("telescope.actions")
          local action_state = require("telescope.actions.state")
          
          actions.select_default:replace(function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            if selection then
              -- Insert path ke buffer
              local path = selection.path or selection.value
              vim.api.nvim_put({ path }, "", false, true)
            end
          end)
          return true
        end,
      })
    end, { buffer = true, desc = "Insert file path" })
    
    -- <Tab> untuk complete path jika setelah /file
    vim.keymap.set("i", "<Tab>", function()
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local before = line:sub(1, col)
      
      if before:match("/file%s+%S*$") then
        -- Trigger cmp jika sedang di path
        if cmp.visible() then
          cmp.select_next_item()
        else
          cmp.complete()
        end
      else
        -- Tab biasa
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
      end
    end, { buffer = true, expr = false })
  end,
})






vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#000000" })

require("notify").setup({
  background_colour = "NotifyBackground",
  stages = "fade_in_slide_out",
  timeout = 3000,
  render = "default",
  top_down = false,
})
local orig_notify = vim.notify

vim.notify = function(msg, level, opts)
  opts = opts or {}
  
  if opts.title == "CodeCompanion" then
    return require("notify")(msg, level, opts)
  end
  
  return require("notify")(msg, level, vim.tbl_extend("force", opts, {
    top_down = false,
  }))
end

require("noice").setup({
  messages = { enabled = false },
  notify = { enabled = false },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
  },
})



-- 3. Setup CodeCompanion dengan spinner
local spinner_state = {
  timer = nil,
  notif_id = nil,
  active = false,
}

local frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }

local function start_spinner()
  if spinner_state.active then return end
  spinner_state.active = true
  
  spinner_state.notif_id = require("notify")("⣾ AI is thinking...", "info", {
    title = "AI is thinking...",
    icon = "✨",
    timeout = false,
    hide_from_history = true,
  })
  
  local i = 1
  spinner_state.timer = vim.loop.new_timer()
  spinner_state.timer:start(0, 80, vim.schedule_wrap(function()
    if not spinner_state.active then return end
    i = (i % #frames) + 1
    
    local ok, new_id = pcall(require("notify"), 
      string.format("%s Processing...", frames[i]), 
      "info", 
      {
        replace = spinner_state.notif_id,
        title = "AI is thinking...",
        timeout = false,
        hide_from_history = true,
      }
    )
    
    if ok then spinner_state.notif_id = new_id end
  end))
end

local function stop_spinner()
  spinner_state.active = false
  
  if spinner_state.timer then
    spinner_state.timer:stop()
    spinner_state.timer:close()
    spinner_state.timer = nil
  end
  
  if spinner_state.notif_id then
    pcall(require("notify").dismiss, spinner_state.notif_id)
    spinner_state.notif_id = nil
  end
end

require("codecompanion").setup({
  adapters = {
    ollama = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "ollama",
        schema = { model = { default = "qwen2.5-coder" } },
      })
    end,
  },
  strategies = {
    chat = { 
     adapter = "ollama" ,
     roles = {
        llm = "AI",    
        user = "Eszuri",        
      },
  },
    inline = { adapter = "ollama" },
  },
  opts = {
      language = "Indonesian",
  },
  display = {
    chat = {
      window = {
        layout = "vertical",
        position = "right", 
        border = "single",
        height = 0.8,       
        width = 0.45,       
        relative = "editor",
      },
      show_token_count = true,
      start_in_insert_mode = true,
    },
  },
  prompt_library = {

    -- Action 2: Refactor Code
    ["Refactor Kode"] = {
      strategy = "inline", -- atau "chat"
      description = "Refactor kode jadi lebih clean",
      prompts = {
        {
          role = "system",
          content = "Refactor kode untuk meningkatkan readability dan performance.",
        },
        {
          role = "user",
          content = "Refactor kode ini:\n\n#buffer\n\nBerikan penjelasan perubahannya.",
        },
      },
    },

      -- Action 4: Debug Error
    ["Debug Error"] = {
      strategy = "chat",
      description = "Bantu debug error di kode",
      prompts = {
        {
          role = "system",
          content = "Kamu adalah expert debugger. Analisis error dan berikan solusi.",
        },
        {
          role = "user",
          content = "Saya ada error di kode ini:\n\n#buffer\n\n#lsp\n\nTolong bantu debug dan berikan solusi.",
        },
      },
    },


  }
})

-- Autocommands
vim.api.nvim_create_autocmd("User", {
  pattern = "CodeCompanionRequestStarted",
  callback = function() vim.schedule(start_spinner) end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "CodeCompanionRequestFinished",
  callback = function() vim.schedule(stop_spinner) end,
})
