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

" ==============
" CtrlP Settings
" ==============
" Commented out CtrlP settings as they are ignored when using
" The Silver Searcher and ctrlp_user_command
" See http://stackoverflow.com/questions/18285751/use-ag-in-ctrlp-vim
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(exe|so|dll|.DS_Store|pyc)$'
"  \ }
"let g:ctrlp_show_hidden = 1

" ==================
" Syntastic Settings
" ==================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Increase history from 20 default
set history=50

" Turn off swap and backup files
set noswapfile
set nobackup
set nowritebackup

" Disable entering Ex mode
:map Q <Nop>

colorscheme vividchalk " See www.vim.org/scripts/script.php?script_id=1891
"colorscheme molokai " See https://github.com/fatih/molokai

" Use visual instead of audible bell
set visualbell

" Show line numbers using the hybrid line number mode
" See http://jeffkreeftmeijer.com/2013/vims-new-hybrid-line-number-mode
set relativenumber
set number

" Increase width of line number column from default 4 chars
set numberwidth=5

" Color line numbers
highlight CursorLineNr term=bold ctermfg=LightGreen gui=bold guifg=MediumSeaGreen
highlight LineNr       term=bold ctermfg=LightBlue  gui=bold guifg=SteelBlue

" Highlight cursor line
set cursorline

" Start scrolling n lines before bottom of screen
set scrolloff=8

" Don't wrap lines except...
set nowrap
" ...for Markdown and text files
autocmd FileType text,markdown setlocal wrap linebreak nolist

" A more informative status line positioned just above the command buffer
set statusline=%F%m%r%h%w\ [POS=%04l,%04v]\ [LINES=%L]
set laststatus=2

" Insert new line without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" ================
" Windows Settings
" ================

" Open horizontal split window beneath current window
set splitbelow

" Open vertical split window to right of current window
set splitright

" Move to next window
map <leader>w <C-w>w

" =================
" Spelling Settings
" =================

" See http://vimcasts.org/episodes/spell-checking/

" Set region to US English
set spelllang=en_us

" Toggle spell checking with <leader>s
nmap <silent> <leader>s :set spell!<CR>

" Enable spell checking for Git commmit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" Enable spell checking for Markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.markdown setlocal spell

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

" ============================
" The Silver Searcher Settings
" ============================

" See http://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag instead of grep
  set grepprg=ag\ --no-group\ --no-color
  " Use ag in CtrlP
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  " No need for CtrlP to cache
  let g:ctrlp_use_caching = 0
endif

" ====================
" Development Settings
" ====================

" Terraform indentation
let g:terraform_align = 1

" Terraform vim-commentary comment style
autocmd FileType terraform setlocal commentstring=#%s

" Enable vim-ruby-minitest completion with <C-x> <C-u>
set completefunc=syntaxcomplete#Complete

" Setup text-object for Ruby blocks.
" http://vimcasts.org/blog/2010/12/a-text-object-for-ruby-blocks/
runtime macros/matchit.vim

" Highlight 81st column
highlight ColorColumn ctermbg=Magenta guibg=Magenta
call matchadd('ColorColumn', '\%81v', 100)

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

" Move visual block with J or K
" See http://vimrcfu.com/snippet/77
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
