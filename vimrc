" Use Vim not Vi settings. Must be first command.
set nocompatible

set encoding=utf-8

" Explicitly define leader
let mapleader="\\"

" ==============
" Pathogen Setup
" ==============
" Allow pathogen.vim to be used as a Git submodule. See github.com/tpope/vim-pathogen
source ~/dotfiles/vim/autoload/pathogen.vim
syntax on
filetype plugin indent on
call pathogen#infect()
call pathogen#helptags()

" ==================
" NERD Tree Settings
" ==================

" Toggle NERD Tree open/closed with F2
" See www.catonmat.net/blog/vim-plugins-nerdtree-vim
map <F2> :NERDTreeToggle<CR>

" Show hidden files
let NERDTreeShowHidden = 1

" ==============
" CtrlP Settings
" ==============
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|.DS_Store|pyc)$'
  \ }
let g:ctrlp_show_hidden = 1

" ===================
" Tabularize Settings
" ===================
nmap <leader>t= :Tabularize /=<CR>
vmap <leader>t= :Tabularize /=<CR>
nmap <leader>t: :Tabularize /:\zs<CR>
vmap <leader>t: :Tabularize /:\zs<CR>
nmap <leader>t, :Tabularize /,\zs<CR>
vmap <leader>t, :Tabularize /,\zs<CR>

" ================
" General Settings
" ================

" Increase history from 20 default
set history=50

" Turn off swap and backup files
set noswapfile
set nobackup
set nowritebackup

" Disable entering Ex mode
:map Q <Nop>

" See www.vim.org/scripts/script.php?script_id=1891
colorscheme vividchalk

" Use visual instead of audible bell
set visualbell

" Show line numbers relative to current line
set relativenumber

" Increase width of line number column from default 4 chars
set numberwidth=5

" Color line numbers
highlight CursorLineNr term=bold ctermfg=LightGreen gui=bold guifg=MediumSeaGreen
highlight LineNr       term=bold ctermfg=LightBlue  gui=bold guifg=SteelBlue

" Highlight cursor line
set cursorline

" Start scrolling n lines before bottom of screen
set scrolloff=8

" Don't wrap lines
set nowrap

" A more informative status line positioned just above the command buffer
set statusline=%F%m%r%h%w\ [POS=%04l,%04v]\ [LINES=%L]
set laststatus=2

" =================
" Spelling Settings
" =================

" See http://vimcasts.org/episodes/spell-checking/

" Set region to US English
set spelllang=en_us

" Toggle spell checking with <leader>s
nmap <silent> <leader>s :set spell!<CR>

" ===============
" Search Settings
" ===============

" Incremental search
set incsearch

" Highlight search results
set hlsearch

" Ignore case for search pattern
set ignorecase

" Override 'ignorecase' when pattern contains upper case character
set smartcase

" Clear highlighting of search results
map <silent> <LocalLeader>nh :nohls<CR>

" ====================
" Development Settings
" ====================

" Highlight 80th column and columns beyond 100
highlight ColorColumn ctermbg=246 guibg=gray4
let &colorcolumn="80,".join(range(100,200),",")

" Highlight trailing whitespace
highlight ExtraWhiteSpace ctermbg=red guibg=red
autocmd InsertEnter * 2match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * 2match ExtraWhitespace /\s\+$/

" See vimcasts.org/episodes/tabs-and-spaces
" Replace tabs with spaces
set expandtab

" Tabs are two spaces
set shiftwidth=2
set softtabstop=2

