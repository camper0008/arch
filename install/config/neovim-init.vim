set rnu nu expandtab smartindent autoindent noswapfile
syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set wildmode=longest,list
filetype plugin on
filetype plugin indent on
set mouse=a
set clipboard=unnamedplus

call plug#begin()
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'shaunsingh/nord.nvim'
call plug#end()

colorscheme nord
