call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'unblevable/quick-scope'
Plug 'itchyny/lightline.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe'
Plug 'matze/vim-move'
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'leafgarland/typescript-vim'
Plug 'mtth/scratch.vim'
Plug 'rking/ag.vim'

call plug#end()

" How can I open a NERDTree fish when vim starts up? Fish
" autocmd vimenter * NERDTree
" How can I close vim if the only window left open is a NERDTree?<Paste>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" How can I map a specific key or shortcut to open NERDTree?
" map <C-n> :NERDTreeToggle<CR>

" ctrp respect .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" How do I make vim indent with spacs?
" http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" How can I set up a ruler at a specific column?
" http://vi.stackexchange.com/questions/356/how-can-i-set-up-a-ruler-at-a-specific-column
set colorcolumn=100
highlight ColorColumn ctermbg=8

" How do I trim trailing whitespace?
autocmd BufWritePre * StripWhitespace

" How do I ensure there's a trailing new line?

" How do I keep the gitgutter in view?
let g:gitgutter_sign_column_always = 1

" What's my leader key?
let mapleader="\\"

" Quick-save?
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

" Quick-close?
nnoremap <leader>q :close<cr>
inoremap <leader>q <C-c>:close<cr>

" Quick-only?
nnoremap <leader>o :only<cr>
inoremap <leader>o <C-c>:only<cr>

" Quick-nohlsearch?
nnoremap <leader><leader> :noh<cr>
inoremap <leader><leader> <C-c>:noh<cr>
nnoremap <Esc><Esc> :noh<cr>
inoremap <Esc><Esc> <C-c>:noh<cr>

" Clipboard?
set clipboard+=unnamedplus
