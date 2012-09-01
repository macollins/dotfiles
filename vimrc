" Use Vim not Vi settings. Must be first command.
set nocompatible

set encoding=utf-8

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

" See www.vim.org/scripts/script.php?script_id=1891
colorscheme vividchalk

" Use visual instead of audible bell
set visualbell

" Show line numbers
set number

" Highlight line and column cursor is on
set cursorline cursorcolumn

" Don't wrap lines
set nowrap

" A more informative status line positioned just above the command buffer
set statusline=%F%m%r%h%w\ [POS=%04l,%04v]\ [LINES=%L]
set laststatus=2

