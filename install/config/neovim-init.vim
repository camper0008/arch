set rnu nu expandtab smartindent autoindent noswapfile splitbelow splitright
syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set wildmode=longest,list
filetype plugin on
filetype plugin indent on
set mouse=a
set clipboard=unnamedplus

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

tnoremap <Esc> <C-\><C-N>

noremap <silent> <C-Left> :vertical resize +2 <CR>
noremap <silent> <C-Right> :vertical resize -2 <CR>
noremap <silent> <C-Up> :resize +2 <CR>
noremap <silent> <C-Down> :resize -2 <CR>

call plug#begin()
    Plug 'rust-lang/rust.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'AlessandroYorba/Alduin'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

colorscheme alduin
let g:rustfmt_autosave = 1

" lualine
lua << END
    require('lualine').setup {
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'filename'},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {'location'},
        },  
    }
END

" indent_blankline
lua << END
require("indent_blankline").setup {}
END
