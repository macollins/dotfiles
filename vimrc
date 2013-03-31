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

" ==============
" CtrlP Settings
" ==============
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|.DS_Store|pyc)$'
  \ }

" ===================
" Tabularize Settings
" ===================
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>

" ================
" General Settings
" ================

" Turn off swap and backup files
set noswapfile
set nobackup
set nowb

" Explicitly define local leader
"let mapleader="\\"

" See www.vim.org/scripts/script.php?script_id=1891
colorscheme vividchalk

" Use visual instead of audible bell
set visualbell

" Show line numbers
set number

" Highlight cursor line and column
set cursorline cursorcolumn

" Don't wrap lines
set nowrap

" A more informative status line positioned just above the command buffer
set statusline=%F%m%r%h%w\ [POS=%04l,%04v]\ [LINES=%L]
set laststatus=2

" ===============
" Search Settings
" ===============

" Incremental search
set incsearch

" Highlight search results
set hlsearch

" Clear highlighting of search results
map <silent> <LocalLeader>nh :nohls<CR>

" ====================
" Development Settings
" ====================

" Highlight hamlc as haml
au BufRead,BufNewFile *.hamlc set ft=haml

" Highlight characters after line 80
highlight LineLengthError ctermbg=darkgrey guibg=darkgrey ctermfg=white guifg=black
autocmd BufRead,InsertEnter,InsertLeave * match LineLengthError /\%>80v.\+/

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

