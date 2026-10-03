local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  -- Daftarkan cmp-path sebagai sumber autocomplete
  sources = cmp.config.sources({
    { name = 'path' }
  })
})
