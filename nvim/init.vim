" Serpentri's config

call plug#begin('~/.config/nvim/plugged')

" Plug 'Shougo/echodoc'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'LnL7/vim-nix'

" Color schemes
Plug 'sainnhe/everforest'
Plug 'dylanaraps/wal.vim'

call plug#end()

" Sets and maps
for f in split(glob('~/.config/nvim/src/*.vim'), '\n')
    exe 'source' f
endfor

" Plugin settings
for f in split(glob('~/.config/nvim/src/plug/*.vim'), '\n')
    exe 'source' f
endfor

" For changing colorschemes quickly
colorscheme everforest
let g:lightline.colorscheme = 'everforest'
