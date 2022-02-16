let g:lightline = {}

" Buffers in the tabline
let g:lightline.tabline          = {'left': [['buffers']], 'right': [[]]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
set showtabline=2

" Powerline-like separators
let g:lightline.subseparator = {
    \ 'left': '', 'right': ''
    \ }

let g:lightline.separator = {
    \ 'left': '', 'right': ''
    \ }

" Devicons
let g:lightline#bufferline#enable_devicons = 1
