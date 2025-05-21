require('telescope').setup{
  defaults = {
    -- Pengaturan default lainnya
  },
 }


vim.api.nvim_set_keymap('n', '<C-f>', "<cmd>Telescope grep_string<cr>", { noremap = true, silent = true })
