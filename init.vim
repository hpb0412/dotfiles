" Plugins
call plug#begin('~/.config/nvim/bundle')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'slashmili/alchemist.vim'
Plug 'pbogut/deoplete-elm'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'mhartington/oceanic-next'
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
colorscheme OceanicNext

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
set nowrap                            " disable line wrapping

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

" window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
" noremap j <NOP>
" noremap k <NOP>

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
map <leader>w :w<CR>
" open nerdtree
map <leader>b :NERDTreeToggle<CR>

" deoplete
let g:deoplete#enable_at_startup = 1

" nerdcommenter
let g:NERDSpaceDelims = 1
