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
    Plug 'rust-lang/rust.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'shaunsingh/nord.nvim'
call plug#end()

let g:rustfmt_autosave = 1
colorscheme nord
