set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'
" Plugin 'scrooloose/nerdtree'
" Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'wombat256.vim'
Plugin 'powerman/vim-plugin-AnsiEsc'
Plugin 'vim-scripts/matchit.zip'
" Plugin 'klen/python-mode'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required

set enc=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformat=unix

syntax on

set tabstop=8 expandtab shiftwidth=4 softtabstop=4
set cindent
set cino=g0
set modeline

set whichwrap=l,h,[,],<,>
set backspace=2
set autoread
set ruler " always show cursor position
set hlsearch incsearch ignorecase title ttyfast ls=2 showcmd showmatch
set laststatus=2
set cursorline

colorscheme wombat256mod

nnoremap <F8> :TagbarToggle<CR>
" nnoremap <F7> :NERDTreeToggle<CR>
set statusline=%f\ %{tagbar#currenttag('%s','','f')}%<%=POS=[%l,%v]%p%%
set title titlestring=%-.355{tagbar#currenttag('%s','','fs')}%<

let g:ycm_python_binary_path = '/usr/bin/python3'
set tags+=/usr/include/tags,./tags,tags;

" Tip 1235
" " Use embedded Python Calculator
command! -nargs=+ Calc :python3 print(<args>)
:python3 from math import *

" http://www.vimbits.com/bits/532
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    nnoremap <key> :silent! grep! "\b<C-r><C-w>\b"<CR>:cwindow<CR>:redraw!<CR>
    command! -nargs=+ -complete=file_in_path -bar Ag silent grep! <args>|cwindow|redraw!
endif

let g:jedi#force_py_version = 3

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" ---
" pymode
let g:pymode_python = 'python3'

let g:pymode_options = 0
"If this option is set to 1, pymode will enable the following options for
"python buffers: >
setlocal complete+=t
setlocal formatoptions-=t
setlocal nowrap
setlocal textwidth=79
setlocal commentstring=#%s
setlocal define=^\s*\\(def\\\\|class\\)
let g:pymode_lint_ignore = "E501,W404,E303,W0611,W391"


