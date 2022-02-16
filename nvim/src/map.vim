" Leader
let mapleader = ','
set mouse=a

" FZF
nnoremap <Leader>e :Files<Cr>
nnoremap <Leader>b :Buffers<Cr>

" Navigate completion
inoremap <silent><expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr><S-Tab> pumvisible() ? "\<c-p>" : "\<S-Tab>"

" Buffers
nnoremap <silent> <Leader>t :enew<Cr>
nnoremap <silent> <Leader>l :bnext<Cr>
nnoremap <silent> <Leader>h :bprevious<Cr>
nnoremap <silent> <Leader>q :bnext <Bar> bd! #<Cr>

" Search
nnoremap / :noh<Cr>/
nnoremap ? :noh<Cr>?

" NERDTree
map <silent> <F2> :NERDTreeToggle<Cr>

" CoC
" Navigate diagnostics
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)
" Goto
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Rename
nmap <leader>rn <Plug>(coc-rename)
" CocList
nnoremap <silent> <space>a :CocList diagnostics<Cr>
