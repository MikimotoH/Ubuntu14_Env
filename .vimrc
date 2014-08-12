set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
Plugin 'wombat256.vim'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set enc=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

syntax on

set tabstop=8 expandtab shiftwidth=4 softtabstop=4
set cindent
set cino=g0

set whichwrap=l,h,[,],<,>
set backspace=2
set autoread
set ruler " always show cursor position
set hlsearch incsearch ignorecase title ttyfast ls=2 showcmd showmatch
set laststatus=2
set cursorline

colorscheme wombat256mod

nnoremap <F8> :TagbarToggle<CR>
nnoremap <F7> :NERDTreeToggle<CR>
set statusline=%f\ %{tagbar#currenttag('%s','','f')}%<%=POS=[%l,%v]%p%%
set title titlestring=%-.355{tagbar#currenttag('%s','','fs')}%<

let g:ycm_confirm_extra_conf = 0
set tags+=/usr/include/tags,./tags,tags;

" Tip 1235
" " Use embedded Python Calculator
command! -nargs=+ Calc :py print <args>
:py from math import *

" http://www.vimbits.com/bits/532
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    nnoremap <key> :silent! grep! "\b<C-r><C-w>\b"<CR>:cwindow<CR>:redraw!<CR>
    command! -nargs=+ -complete=file_in_path -bar Ag silent grep! <args>|cwindow|redraw!
endif

