" Use Vim not Vi settings. Must be first command.
set nocompatible

set encoding=utf-8

" OS X GUI Settings
" =================
if has("gui_running")
  set guifont=Inconsolata:h14
  set fuopt=maxhorz,maxvert
  set guioptions=t " Hide MacVim toolbar
end

" Pathogen Setup
" ==============
" Allow pathogen.vim to be used as a Git submodule. See github.com/tpope/vim-pathogen
source ~/dotfiles/vim/autoload/pathogen.vim
syntax on
filetype plugin indent on
call pathogen#infect()
call pathogen#helptags()

" General Settings
" ================

" Explicitly define local leader
let mapleader="\\"

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

" Search Settings
" ===============

" Incremental search
set incsearch

" Highlight search results
set hlsearch

" Development Settings
" ====================

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

