require('neo-tree').setup({
  filesystem = {
    filtered_items = {
      visible = true, -- untuk menampilkan semua item, termasuk yang tersembunyi
    },
    follow_current_file = {
      enabled = true, -- mengikuti file yang sedang dibuka
    },
    hijack_netrw_behavior = "open_current",
  },
  buffers = {
    follow_current_file = {
      enabled = true, -- mengikuti file yang sedang dibuka di buffer
    },
  },
  window = {
    position = "left",
  },
})


-- lua << EOF
--
-- EOF
--

vim.cmd([[highlight NeoTreeNormal guibg=#1e1e2e]])
vim.cmd([[highlight NeoTreeNormalNC guibg=#1e1e2e]])
