" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/wombat256.vim'
Plug 'Vimjas/vim-python-pep8-indent'  "better indenting for python
Plug 'kien/ctrlp.vim'  " fuzzy search files
Plug 'tweekmonster/impsort.vim'  " color and sort imports
Plug 'w0rp/ale'  " python linters
Plug 'airblade/vim-gitgutter'  " show git changes to files in gutter
Plug 'tpope/vim-commentary'  "comment-out by gc
Plug 'Valloric/YouCompleteMe'

Plug 'nvie/vim-flake8'
Plug 'scrooloose/syntastic'

call plug#end()
let g:python3_host_prog = '/usr/bin/python3.6'

set enc=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

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
let g:deoplete#enable_at_startup = 1
colorscheme wombat256mod
let g:ycm_python_binary_path = '/usr/bin/python3.6'
"
"---
" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ["$HOME/.local/lib/python3.6/site-packages/flake8"]
"---
" ncm2 settings
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
set shortmess+=c
inoremap <c-c> <ESC>
" make it fast
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'
"---
" Disable Jedi-vim autocompletion and enable call-signatures options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
