local home = vim.fn.expand("$HOME")
local dll_path = home .. "/.config/nvim/dll/avante_win/?.dll"
package.cpath = package.cpath .. ";" .. dll_path
require('avante_lib').load()

require('avante').setup({
  provider = "ollama",
  
  -- FIX: Struktur providers yang benar untuk Ollama
  providers = {
    ollama = {
      endpoint = "http://127.0.0.1:11434",
      timeout = 30000,
      model = "qwen2.5-coder",
      extra_request_body = {
        temperature = 0.1,
        keep_alive = "5m",
      },
    },
  },
  
  behaviour = {
    auto_focus_sidebar = true,
    auto_suggestions = true,
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = true,
    minimize_diff = true,
    enable_token_counting = true,
    auto_add_current_file = true,
    auto_approve_tool_permissions = true,
    confirmation_ui_style = "inline_buttons",
  },
  
  suggestion = {
    debounce = 600,
    throttle = 600,
  },
  
  windows = {
    position = "right",
    wrap = true,
    width = 30,
    sidebar_header = {
      enabled = true,
      align = "center",
      rounded = true,
      include_model = true,
    },
    input = {
      prefix = "> ",
      height = 8,
    },
  },
})
