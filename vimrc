set nocompatible " Use Vim not Vi settings. Must be first command.

set encoding=utf-8

" Allow pathogen.vim to be used as a Git submodule. See github.com/tpope/vim-pathogen
source ~/dotfiles/vim/bundle/pathogen/autoload/pathogen.vim

syntax on

filetype plugin indent on

call pathogen#infect()
call pathogen#helptags()

" http://www.vim.org/scripts/script.php?script_id=1891
colorscheme vividchalk

