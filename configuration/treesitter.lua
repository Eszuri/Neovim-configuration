local ts = require('nvim-treesitter')

ts.setup({
    install_dir = vim.fn.stdpath('data') .. '/site'
})

-- Instal parser
ts.install({
    'bash', 'c', 'cmake', 'cpp', 'css', 'csv', 'dart',
    'dockerfile', 'gitignore', 'go', 'html', 'typescript',
    'json', 'lua', 'php', 'python', 'rust', 'javascript',
    'tsx', 'xml', 'vim', 'yuck','markdown', 'markdown_inline',
    'regex','yaml','toml','make','jsonc','c_sharp','java',
    'rust'
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})
