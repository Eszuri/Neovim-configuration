let g:config_dir = $HOME . '/.config/nvim'
let g:sqlite_clib_path = $HOME . '/.config/nvim/dll/sqlite3Win.dll'
autocmd! User avante.nvim


call plug#begin('$HOME/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Mofiqul/vscode.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'branch': 'master'}
Plug 'brenoprata10/nvim-highlight-colors'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'mg979/vim-visual-multi',{'branch':'master'}
Plug 'kkharji/sqlite.lua'
Plug 'stevearc/dressing.nvim'
Plug 'mrjones2014/legendary.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-fugitive'
Plug 'supermaven-inc/supermaven-nvim'
Plug 'folke/noice.nvim'
Plug 'folke/snacks.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'MeanderingProgrammer/render-markdown.nvim'
Plug 'HakonHarnes/img-clip.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'windwp/nvim-ts-autotag'
Plug 'yetone/avante.nvim', { 'branch': 'main' }
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
set hlsearch
set incsearch
set winblend=10
set pumblend=10
set background=dark
colorscheme vscode



"import setting or configuration
execute 'source ' . g:config_dir . '/configuration/coc.vim'
execute 'source ' . g:config_dir . '/configuration/treesitter.lua'
execute 'source ' . g:config_dir . '/configuration/vscode.lua'
execute 'source ' . g:config_dir . '/configuration/highlight-color.lua'
execute 'source ' . g:config_dir . '/configuration/neo-tree.lua'
execute 'source ' . g:config_dir . '/configuration/lualine.lua'
execute 'source ' . g:config_dir . '/configuration/telescope.lua'
execute 'source ' . g:config_dir . '/configuration/legendary.lua'
execute 'source ' . g:config_dir . '/configuration/comment.lua'
execute 'source ' . g:config_dir . '/configuration/commentstring.lua'
execute 'source ' . g:config_dir . '/configuration/indent.lua'
execute 'source ' . g:config_dir . '/configuration/supermaven.lua'
execute 'source ' . g:config_dir . '/configuration/nvim-ts-autotag.lua'
execute 'source ' . g:config_dir . '/configuration/avante.lua'
execute 'source ' . g:config_dir . '/configuration/notify.lua'
execute 'source ' . g:config_dir . '/configuration/noice.lua'
execute 'source ' . g:config_dir . '/keymap/keymap.lua'
" execute 'source ' . g:config_dir . '/keymap/default.lua'
" gunakan keymap default jika arrow error    
