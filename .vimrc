" -----------------------------------------------------------------------------
" This has to come first -- do not change order
" Vundle initialization
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" color schemes
" Plug 'bzx/vim-theme-pack'
Plug 'AKurilin/vim-colorschemes'
Plug 'vim-scripts/CSApprox'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'tomtom/tlib_vim'
" Plug 'dense-analysis/ale'
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'AKurilin/matchit.vim'

Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Javascript
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Markdown
Plug 'tpope/vim-markdown'

" Ack / AG grep support
Plug 'mileszs/ack.vim'

" Quickfix / Location list toggle
Plug  'milkypostman/vim-togglelist'

" Ansi Colors support
Plug 'vim-scripts/AnsiEsc.vim'

" Mustache syntax support
Plug 'juvenn/mustache.vim'

" advanced ga character info
Plug 'tpope/vim-characterize'

" vim easymotion
Plug 'Lokaltog/vim-easymotion'

" call vundle#end()
call plug#end()
" -----------------------------------------------------------------------------

" syntax have to come first so that ftplugin folder is the one running last
syntax on
filetype on
filetype indent on
filetype plugin on

" prevents creation of .swp (use :w more, son)
set noswapfile
set backupdir-=.
set backupdir^=/tmp

" turns sounds off
set vb t_vb=

" prevents certain security exploits
set modelines=0

set viminfo^=!

set ignorecase
set smartcase

set cf
set history=256

set autowrite
set ruler
set nu
set nowrap
set timeoutlen=1000
set hidden

set tabstop=2
set backspace=2
set shiftwidth=2
set softtabstop=2
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr

" These MUST be disabled
set nocindent
set nosmartindent
set autoindent
set smarttab
set expandtab
set textwidth=80
set colorcolumn=+1

" vertical and horizontal line highlighting
set cursorline
set cursorcolumn

set showmatch
set mat=5
set list

" disable code folding
set nofoldenable

" " GVim-specific
" " Will remove the toolbar
" set guioptions-=m
" set guioptions-=T
" set guioptions-=r
" " text-style tabs
" set guioptions=agi

" make tabs and trailing spaces visible
set lcs=tab:»·,trail:~,extends:>,precedes:<
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.

" omnicompletion
set omnifunc=syntaxcomplete#Complete

" colorschemes
colorscheme desert
silent! colorscheme earendel

" map jk and kj to equal Esc
:inoremap jk <Esc>
:inoremap kj <Esc>

" tpope's buffer navigation shortcuts
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" flip through the arglist
nnoremap <silent> [a :previous<CR>
nnoremap <silent> ]a :next<CR>
nnoremap <silent> [A :first<CR>
nnoremap <silent> ]A :last<CR>

" switch between tabs analogously to the above
nnoremap <silent> [t :tabprev<CR>
nnoremap <silent> ]t :tabnext<CR>

" switch between quickfix list entries
nnoremap <silent> [c :cprev<CR>
nnoremap <silent> ]c :cnext<CR>
nnoremap <silent> [C :cfirst<CR>
nnoremap <silent> ]C :clast<CR>

" switch between quickfix list entries
nnoremap <silent> [x :lprev<CR>
nnoremap <silent> ]x :lnext<CR>
nnoremap <silent> [X :lfirst<CR>
nnoremap <silent> ]X :llast<CR>

" easy expansion of the active file directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" RELATIVE NUMBERS
au BufEnter * setl relativenumber

" " Always show line numbers, but only in current window.
:au WinEnter * :setlocal relativenumber
:au WinLeave * :setlocal number

" Absolute Line Numbers in Insert Mode
:au InsertEnter * :setlocal number
:au InsertLeave * :setlocal relativenumber

function! NumberToggle()
  if(&relativenumber == 1)
    setlocal number
  else
    setlocal relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" Ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column --ignore tags'

" Git gutter turn off by default
let g:gitgutter_enabled = 0

" vim2hs
let g:haskell_conceal = 0

autocmd! BufWritePost * Neomake

"
" vim-easymotion
"
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
"
" map <Leader>l <Plug>(easymction-lineforward)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" map <Leader>h <Plug>(easymotion-linebackward)
" let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

nnoremap gev :e $MYVIMRC<CR>
nnoremap gsv :so $MYVIMRC<CR>

" center screen on these keys
nnoremap N Nzz
nnoremap n nzz
nnoremap { {zz
nnoremap } }zz

" make the screen advance up or down when within n lines of the edge
set scrolloff=10

" move up and down by line, not row, useful when :wrap option is set
nnoremap j gj
nnoremap k gk
" move up and down by row with these commands
nnoremap gj j
nnoremap gk k

" remove commands we never use
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>

" remove startup message
set shortmess+=I

" make filename completion be like in bash
set wildignorecase
set wildmode=longest,list,full

" make split appear in the more intuitive location
set splitbelow
set splitright

"
" NEOVIM specific
"

" block cursor in normal mode, pipe in insert mode
" NB: only works for later versions of gnome terminal
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" FZF
" relies on fzf binary being present on the PATH somewhere
" NB: requires env var set in bashrc to use AG to find files, that way
" .gitignore is respected
nnoremap <leader>t :<C-u>FZF<cr>

" export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
" export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

" ALE
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_open_list = 0
let g:ale_list_window_size = 3
let g:airline#extensions#ale#enabled = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'javascriptreact': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\   'scss': ['prettier'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\   'json': ['prettier'],
\}

let g:ale_typescript_prettier_use_local_config = 1

let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}

" navigate bewteen ALE errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" open tag definition in a new vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
