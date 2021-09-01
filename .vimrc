set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'morhetz/gruvbox'
Plugin 'powerman/vim-plugin-AnsiEsc'
Plugin 'vim-scripts/matchit.zip'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'Chiel92/vim-autoformat'
Plugin 'preservim/tagbar'
Plugin 'preservim/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'mindriot101/vim-yapf'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required

set enc=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformat=unix

syntax on

set tabstop=8 expandtab shiftwidth=4 softtabstop=4
set autoindent
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

colorscheme gruvbox
autocmd vimenter * ++nested colorscheme gruvbox
set bg=dark

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


if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif


"================
" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ["flake8"]


"================
" vim-markdown
let g:vim_markdown_folding_disabled = 1

"==============
" NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "hide files in NERDTree


"==============
" NerdTree-Tabs
nnoremap <F9> :NERDTreeTabsToggle<CR>

"=============
" tagbar
nmap <F8> :TagbarToggle<CR>

"================
" vim-autoformat
let g:formatterpath = ['/usr/bin/autopep8']
au BufWrite * :Autoformat
noremap <F3> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
autocmd FileType vim,tex let b:autoformat_autoindent=0


"==================
" nvie/vim-flake8
let python_highlight_all=1
syntax on

"================
" ctrlpvim/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

"=========
" Flagging unnecessary whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
" The following alternative may be less obtrusive.
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
" Try the following if your GUI uses a dark background.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" Show trailing whitespace:
match ExtraWhitespace /\s\+$/

" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/

" Show tabs that are not at the start of a line:
match ExtraWhitespace /[^\t]\zs\t\+/

" Show spaces used for indenting (so you use only tabs for indenting).
match ExtraWhitespace /^\t*\zs \+/
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match ExtraWhitespace /\s\+$/
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h /\s\+$/

"==============
" PEP8
 au BufNewFile,BufRead *.py set
     \ tabstop=4
     \ softtabstop=4
     \ shiftwidth=4
     \ textwidth=80
     \ expandtab
     \ autoindent
     \ fileformat=unix

"================
" mindriot101/vim-yapf
nnoremap <leader>y :call Yapf()<cr> 


"==================
" /vim-autoformat/vim-autoformat
let g:python3_host_prog="/usr/bin/python3"
let g:formatterpath = ['/home/ubuntu/anaconda3/bin/black']
noremap <F3> :Autoformat<CR>
au BufWrite * :Autoformat


