let g:config_dir = $HOME . '/.config/nvim'

call plug#begin('$HOME/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Mofiqul/vscode.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'brenoprata10/nvim-highlight-colors'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lualine/lualine.nvim'
Plug 'tami5/sqlite.lua'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'mg979/vim-visual-multi',{'branch':'master'}
call plug#end()

"basic configuration"
set shiftwidth=4
set tabstop=4
set expandtab
set encoding=utf-8
set mouse=a
set nobackup
set nowrap
set showmode
set showcmd
set nowritebackup
set updatetime=300
set signcolumn=yes
set number
set cursorline
set cursorbind
set tabpagemax=4
set title
set noswapfile
set termguicolors
set t_Co=256


"import setting or configuration
execute 'source ' . g:config_dir . '/configuration/coc.vim'
execute 'source ' . g:config_dir . '/configuration/treesitter.lua'
execute 'source ' . g:config_dir . '/configuration/vscode.lua'
execute 'source ' . g:config_dir . '/configuration/highlight-color.lua'
execute 'source ' . g:config_dir . '/configuration/neo-tree.lua'
execute 'source ' . g:config_dir . '/configuration/lualine.lua'
execute 'source ' . g:config_dir . '/configuration/telescope.lua'
execute 'source ' . g:config_dir . '/keymap/keymap.lua'
execute 'source ' . g:config_dir . '/keymap/default.lua'
