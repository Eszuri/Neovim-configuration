require('legendary').setup({
   sort = {
     most_recent_first = true,
     user_items_first = true,
   },

    include_builtin = true,
    include_legendary_cmds = true,

    keymaps = {
    {
      '<C-/>',
      function()
        require('Comment.api').toggle.linewise.current()
      end,
      description = 'Toggle comment (line)',
      mode = 'n',
    },
    {
      '<C-/>',
      function()
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes('<Esc>', true, false, true),
          'n',
          false
        )
        require('Comment.api').toggle.linewise.current()
      end,
      description = 'Toggle comment (line from insert mode)',
      mode = 'i',
    },
    {
      '<C-/>',
      function()
        local esc = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
        vim.api.nvim_feedkeys(esc, 'nx', false)
        require('Comment.api').toggle.linewise(vim.fn.visualmode())
      end,
      description = 'Toggle comment (selection text)',
      mode = 'v',
    },
    },

    commands = {
    
    },
  })