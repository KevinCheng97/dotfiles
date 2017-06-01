let $VIM = '/lxhome/chengkev/vim/src/vim'
let $VIMRUNTIME='/lxhome/chengkev/vim/runtime/'
set runtimepath^=$VIMRUNTIME
set helpfile=$VIMRUNTIME/doc/help.txt 

set clipboard=unnamed
set autoread
set mouse=a

call plug#begin('~/.vim/plugged')
" My bundles here:
" original repos on GitHub
Plug 'airblade/vim-gitgutter'
Plug 'lyuts/vim-rtags' , { 'for': 'cpp' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang', 'for': ['cpp', 'python'] }
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/vim-peekaboo'
Plug 'Valloric/ListToggle'
Plug 'jistr/vim-nerdtree-tabs'
call plug#end()

"Multiple cursors
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_start_word_key='g<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"Airline stuff
set noshowmode
set laststatus=2
:let g:airline_theme='understated'

"Tmux navigator stuff
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-A>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-A>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-A>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-A>l :TmuxNavigateRight<cr>
nnoremap <silent> <C-A>\ :TmuxNavigatePrevious<cr>

"YCM settings
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_binary_path = '/opt/rh/python27/root/usr/bin/python'
let g:ycm_python_binary_path = 'python'


"Only applicable when vim-rtags not loaded
nnoremap <leader>rj :YcmCompleter GoToDefinition<CR>
nnoremap <leader>rf :YcmCompleter GoToReferences<CR>

"Make stuff
nnoremap <leader>b :Make<CR>
cabbrev make Make 
set autowrite

"Dispatch stuff
nnoremap <leader>d :Dispatch<CR>

"Ack stuff
"Don't open the first result automatically
cabbrev ack Ack!

"Disable diagnostics at work until we compile in clang++
let g:ycm_enable_diagnostic_highlighting = 0 
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_python_binary_path = '/opt/rh/python27/root/usr/bin/python'

"Rtags stuff
let g:rtagsUseLocationList = 0

" Always have quickfix take the entire bottom of the screen
au FileType qf wincmd J

" peekaboo stuff 
let g:peekaboo_prefix = '<leader>'

"Gitgutter stuff
let g:gitgutter_map_keys = 0
nmap <Leader>hn <Plug>GitGutterNextHunk<cr>
nmap <Leader>hp <Plug>GitGutterPrevHunk<cr>
nmap <Leader>hu <Plug>GitGutterUndoHunk<cr>
nmap <Leader>hs <Plug>GitGutterStageHunk<cr>

"Nerdtree stuff
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
noremap <Leader>t :NERDTreeToggle<cr>
noremap <Leader>o :NERDTreeFind<cr>
let NERDTreeMapHelp='<f1>'
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
map <Leader>n <plug>NERDTreeTabsToggle<CR>

syntax on
set t_Co=256
set nocompatible

"Indent stuff
set expandtab
set tabstop=4
set shiftwidth=4

"Don't treat the hash is a special case when indenting
set cindent
set cinkeys-=0#
set indentkeys-=0#

" Use smart indenting when starting a new line.
set smartindent

" Look for tags starting at the current directory and all the way up to root
set tags=./tags;/

" Don't add the comment prefix when I hit enter or o/O on a comment line.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Key remaps
noremap zk zt
noremap zj zb
nnoremap Q <nop>

"Produce the oposite effect from J
nnoremap K i<CR><Esc>

"Tab navigation
nnoremap <S-tab> :tabnext<CR>
nnoremap <C-S-tab> :tabprevious<CR> 

"Use more intuitive binding for scrolling
noremap <C-j> <C-f>
noremap <C-k> <C-b>
map <C-L> 20zl " Scroll 20 characters to the right
map <C-H> 20zh " Scroll 20 characters to the left

"Split related behavior
set splitbelow
set splitright
autocmd VimResized * wincmd =

"Misc
set ignorecase
set smartcase
set ruler
set nowrap
set number
set relativenumber
set incsearch
set backspace=2

"Disabble X clipboard for faster boot
set clipboard=exclude:.*

" Set to auto read when a file is changed from the outside
set autoread

" Use Unix as the standard file type
set ffs=unix,dos,mac

"Toggle auto-indenting for code paste
set pastetoggle=<F2>

"Display incomplete commands
set showcmd

"Easier hex editing
noremap <F8> :call HexMe()<CR>

"Autocomplete like bash
set wildmenu
set wildmode=list:longest

"Autoclose QuickFix window if it's the last window
aug QFClose
    au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

"Use persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

let $in_hex=0
function HexMe()
    set binary
    set noeol
if $in_hex>0
    :%!xxd -r
    let $in_hex=0
else
    :%!xxd
    let $in_hex=1
endif
endfunction

"Find out how many cores to use for make
function! SetMakeprg()
    if filereadable('/proc/cpuinfo')
        " this works on most Linux systems
        let n = system('grep -c ^processor /proc/cpuinfo') + 0
    else
        " default to single process if we can't figure it out automatically
        let n = 1
    endif
    
    " Don't go overboard on shared boxes
    if n > 8
        let n = 11
    endif

    let &makeprg = 'make' . (n > 1 ? (' -j'.(n + 1)) : '')
endfunction
call SetMakeprg()