require'nvim-treesitter.configs'.setup{
    ensure_installed = {
	    "html",
	    "css",
	    "scss",
	    "javascript",
	    "tsx",
	    "typescript",
	    "json",
	    "lua",
	    "bash",
	    "cmake",
	    "cpp",
	    "c",
	    "php",
	    "csv",
	    "dart",
	    "dockerfile",
	    "vim"
	    },
    highlight = {enable=true},
    auto_install = true
}


require ('nvim-treesitter.install').compilers = { 'gcc' }
