local home = vim.fn.expand("$HOME")
local dll_path = home .. "/.config/nvim/dll/avante_win/?.dll"
package.cpath = package.cpath .. ";" .. dll_path
require('avante_lib').load()

require('avante').setup({
  provider = "ollama",
  
  providers = {
    ollama = {
      endpoint = "http://127.0.0.1:11434",
      model = "qwen2.5-coder",
      timeout = 30000,
      extra_request_body = {
        temperature = 0.1,
        keep_alive = "5m",
      },
    },

    gemini = {
      api_key = os.getenv("AVANTE_GEMINI_API_KEY"),
      timeout = 30000, -- Timeout in milliseconds
      model = "gemini-2.5-flash",
      context_window = 1048576,
      use_ReAct_prompt = true,
      extra_request_body = {
        generationConfig = {
          temperature = 0.75,
        },
      },
    },

    grok= {
      __inherited_from = "openai",
      endpoint = "https://api.x.ai/v1/chat/completions",
      model = "grok-4-latest",
      api_key_name = os.getenv("AVANTE_GROK_API_KEY"),
    },

    openai = {
      api_key = os.getenv("AVANTE_OPENAI_API_KEY"),
      endpoint = "https://api.openai.com/v1",
      model = "gpt-3.5-turbo",
      timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
      context_window = 128000, -- Number of tokens to send to the model for context
      support_previous_response_id = true, -- OpenAI Response API supports previous_response_id for stateful conversations
    },

    claude = {
      api_key = os.getenv("AVANTE_ANTHROPIC_API_KEY"),
      endpoint = "https://api.anthropic.com",
      auth_type = "api",
      timeout = 30000, -- Timeout in milliseconds
      context_window = 200000,
      extra_request_body = {
        temperature = 0.75,
        max_tokens = 64000,
      },
    },

},
  behaviour = {
    auto_focus_sidebar = true,
    auto_suggestions = false,
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
