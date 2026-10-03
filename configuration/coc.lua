-- dependency untuk auto completion
vim.g.coc_global_extensions = {
  'coc-json',
  'coc-tsserver',
  'coc-html',
  'coc-css',
  'coc-yaml',
  'coc-highlight',
  '@yaegassy/coc-tailwindcss3',
  'coc-pairs',
}

-- Root patterns untuk html
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'html',
  callback = function()
    vim.b.coc_root_patterns = { '.git', '.env', 'tailwind.config.js', 'tailwind.config.cjs' }
  end,
})

-- Gunakan <cr> (Enter) untuk mengonfirmasi completion
vim.keymap.set('i', '<CR>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], { silent = true, expr = true })

-- highlight the symbol and its references when holding the cursor
vim.api.nvim_create_autocmd('CursorHold', {
  pattern = '*',
  callback = function()
    vim.fn.CocActionAsync('highlight')
  end,
})

-- completion trigger
-- if not work ctrl+Space use neovim gui (neovide)
local trigger_key = vim.fn.has('nvim') == 1 and '<C-Space>' or '<c-@>'
vim.keymap.set('i', trigger_key, 'coc#refresh()', { silent = true, expr = true })
