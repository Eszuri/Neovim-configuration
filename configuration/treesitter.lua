require'nvim-treesitter.configs'.setup{
    ensure_installed = {
	   'bash',
     'c',
     'cmake',
     'cpp',
     'css',
     'csv',
     'dart',
     'dockerfile',
     'gitignore',
     'go',
     'html',
     'typescript',
     'json',
     'lua',
     'php',
     'python',
     'rust',
     'javascript',
     'tsx',
     'xml',
     'vim',
     'yuck',  
	    },
    highlight = {enable=true},
    
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
    sync_install = true,
}
require ('nvim-treesitter.install').compilers = { 'gcc' }
-- compiler can install using gcc 'scoop install mingw'
