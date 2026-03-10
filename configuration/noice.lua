require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },

  routes = {
    {
      filter = {
        event = "msg_show",
        find = "written",
      },
      view = "notify", 
      opts = { title = "Message" },
    },
  },

  presets = {
    bottom_search = false,
    command_palette = true,
    long_message_to_split = true,
    lsp_doc_border = true,
  },

  views = {
    cmdline_popup = {
      position = {
        row = "40%", 
        col = "50%", 
      },
      size = {
        width = 60,
        height = "auto",
      },
    },
  popupmenu = {
      relative = "editor",
      position = {
        row = "53%",
        col = "50%",
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
    },
  },


})


vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    vim.cmd("redraw")
  end,
})
