" Plugins
call plug#begin('~/.local/share/nvim/site/pack')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
" Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'slashmili/alchemist.vim'
" Plug 'pbogut/deoplete-elm'
" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'

Plug 'mhartington/oceanic-next'
Plug 'ayu-theme/ayu-vim'
call plug#end()

" base
syntax on                             " syntax highlighting
filetype plugin indent on             " try to recognise filetype and load plugins and indent files
set noswapfile

" interface
set number                            " show line numbers
set relativenumber                    " show relative line numbers
set ruler                             " show current position at bottom
set sidescroll=1                      " scroll sideways a char at a time, rather than a screen at a time
set showcmd                           " show any commands

" color scheme
set termguicolors                     " enable true colors
"colorscheme oldbook
"colorscheme OceanicNext
let ayucolor="mirage"
colorscheme ayu

" whitespace
set nojoinspaces                      " use one space, not two, after punctuation
set shiftround                        " shift to next tabstop
set softtabstop=2                     " about how far cursor moves while typing tab
set tabstop=2                         " use two spaces for tabs
set shiftwidth=2                      " amount of space used for indentation
set expandtab                         " ensure that when you hit tab it will actually use spaces

" text appearance
set list                              " show all invisible characters
set listchars=tab:>·,trail:·,nbsp:¬   " but only show useful chaaracters

" line wrapping
" set nowrap                            " disable line wrapping
set wrap linebreak nolist
set showbreak=â€¦

" searching
set hlsearch                          " highlight search matches
hi Search guibg=LightBlue
set ignorecase                        " set case insensitive searching
set incsearch                         " find as you type search
set smartcase                         " case sensitive searching when not all lowercase

" window splitting
set splitbelow                        " create new splits below
set splitright                        " create new splits to the right

" key mapping base
inore jk <Esc>
inore kj <Esc>
inore jj <Esc>
inore kk <Esc>

" window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" move with linewrap
vmap <A-j> gj
vmap <A-k> gk
vmap <A-4> g$
vmap <A-6> g^
vmap <A-0> g^
nmap <A-j> gj
nmap <A-k> gk
nmap <A-4> g$
nmap <A-6> g^
nmap <A-0> g^
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

" move in insert mode
" inoremap ˙ <C-o>h
" inoremap ∆ <C-o>j
" inoremap ˚ <C-o>k
" inoremap ¬ <C-o>l
" inoremap å <C-o>A
" inoremap ˆ <C-o>I
" inoremap <A-h> <C-o>h
" inoremap <A-j> <C-o>j
" inoremap <A-k> <C-o>k
" inoremap <A-l> <C-o>l
" inoremap <A-a> <C-o>A
" inoremap <A-i> <C-o>I

" hardmode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap h <NOP>
noremap l <NOP>
noremap j <NOP>
noremap k <NOP>

" move a line
nnoremap <A-UP> :m-2<CR>
nnoremap <A-DOWN> :m+<CR>
inoremap <A-UP> <ESC>:m-2<CR>
inoremap <A-DOWN> <ESC>:m+<CR>
vnoremap <A-UP> :m '<-2<CR>gv=gv
vnoremap <A-DOWN> :m '>+<CR>gv=gv

" LEADER
let mapleader = ","
" save file
" map <leader>w :w<CR>
" open fzf
map <C-p> :Files<CR>
" switch last 2 files
map <leader><leader> <C-^>
" open nerdtree
map <C-b> :NERDTreeToggle<CR>

" deoplete
" let g:deoplete#enable_at_startup = 1

" deoplete-go
" let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'

" Yggdroot/indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setColors = 0

" nerdcommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" nerdtree
let NERDTreeShowHidden=1

" dense-analysis/ale
let g:ale_fixers = {
\ 'javascript': ['prettier'],
\ 'jsx': ['prettier'],
\ 'css': ['prettier'],
\}
let g:ale_fix_on_save = 1

" Make transparent background
highlight Normal guibg=NONE ctermbg=NONE
" highlight NonText guibg=NONE ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE

