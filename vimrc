" Vundle config
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle manages itself
Plugin 'VundleVim/Vundle.vim'

" NERDTree - Intuitive file system
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Status Line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Code Folding
Plugin 'tmhedberg/SimpylFold'

" Python Editor
Plugin 'Vimjas/vim-python-pep8-indent'         " PEP8
Plugin 'scrooloose/syntastic'                  " Syntax
Plugin 'altercation/vim-colors-solarized'      " Coloring
Plugin 'vim-scripts/indentpython.vim'          " Indenting

" Auto-completion for python
" Plugin 'Valloric/YouCompleteMe'

" Vim Plugin for latex
Plugin 'vim-latex/vim-latex'

" End vundle plugin
call vundle#end()
filetype plugin on

" Autosave
autocmd InsertLeave * silent! update

" Enabling Mouse
set mouse=a

" Use system clipboard
set clipboard=unnamed

" Tabbing
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start

" PEP8 Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set textwidth=79|
    \ set fileformat=unix |
    \ set encoding=utf-8 |
    \ set autoindy yyp|
    \ set smartindent |
    \ set smarttab |
    \ set cindent |
    \ set cinoptions=g-1 |
    \ set colorcolumn=79

" White space highlighting
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225'
let g:python_pep8_indent_multiline_string = 1

" Coloring
set background=dark
colorscheme solarized

" Full stack Indentation
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2i |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Visuals
set number                      " Numbering
set noshowmode                  " Hide command line
set laststatus=2                " Show status
syntax on                       " syntax highlighting
set cursorline                  " Line under cursor
set showmatch                   " Show matching brakets [], {}, ()

" Indenting
set autoindent

" Word Processing Mode - English spell check
func! WordProcessorMode()
 setlocal textwidth=80
 setlocal spell spelllang=en_us
 setlocal noexpandtab
 setlocal colorcolumn=80
endfu
com! WP call WordProcessorMode()


" SimpylFold stuff
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" NERDtree stuff
autocmd Vimenter * NERDTree
autocmd VimEnter * wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
noremap <Leader>t :NERDTreeToggle<cr>
noremap <Leader>o :NERDTreeFind<cr>
let NERDTreeMapHelp='<f1>'
let NERDTreeIgnore=['\.pyc$', '\~$']           " ignore files in NERDTree

