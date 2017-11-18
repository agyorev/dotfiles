"
" Vundle
" https://github.com/gmarik/vundle
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'elzr/vim-json'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" apparently those don't work w/o the gui
if has("gui_running")
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'scrooloose/syntastic'
endif

call vundle#end()

" Enable filetype plugins
filetype plugin on

" Enable auto-indentation
filetype plugin indent on

" Get rid of that dreadful 'Shift' key-pressing
nnoremap ; :

" Set to auto read when a file is changed from the outside
set autoread

" Leader is the comma
let mapleader=","

" Fast saving
nmap <leader>w :w!<cr>

" Fast closing
nmap <leader>q :q<cr>

" Map jk to esc
inoremap jk <esc>

" Turn on the WiLd menu
" Visual autocomplete for command menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Show command in bottom bar
set showcmd

" A buffer becomes hidden when it is abandoned
set hid

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Make search act like in modern browsers
set incsearch

" Highlight search results
set hlsearch

" Unhighlight search matches
nmap <silent> ,/ :nohlsearch<CR>

" Show relative line numbers
set relativenumber

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Trying to look cool and all
syntax enable
set background=dark

if has("gui_running")
    colorscheme desert
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
    set guifont=Menlo\ Regular:h13
endif

" Recommended settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Turn backup off
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

set autoindent "Auto indent
"set copyindent "Copyt indent
"
set wrap "Wrap lines

"set shiftwidth=4

" Leanplum settings
" Number of visual spaces per tab
set tabstop=2

"Number of spaces in tab when editing
set softtabstop=2

set shiftwidth=2

" More natural split opening
set splitbelow
set splitright

" Open NERDTree
map <Leader>n :NERDTree<CR>

" Going old C style
set colorcolumn=101

" Highlighting the current line
set cursorline

set history=1000
set undolevels=1000

set hidden

" Aligning to '=' sign
nmap <leader>l= :Tabularize /=<CR>
vmap <leader>l= :Tabularize /=<CR>

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Move vertically by visual line (e.g. when a line is wraped)
nnoremap j gj
nnoremap k gk

" Easier split navigations
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Maps Shift-[h,j,k,l] to resizing a window split
map <silent> <S-h> <C-w><
map <silent> <S-j> <C-W>-
map <silent> <S-k> <C-W>+
map <silent> <S-l> <C-w>>

" Maps Control-[s.v] to horizontal and vertical split respectively
map <silent> <C-s> :split<CR>
map <silent> <C-a> :vsplit<CR>

" Useful mapping for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same dir
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Return to last edit position when opening files
" You want this!
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" Remember info about open buffers on close
set viminfo^=%

" Always show the status line
set laststatus=2
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Remav VIM 0 to fist non-blank character
map 0 ^

" Delete trailing white space on save, useful for Python and CoffeeScript
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Pressing leader+ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Highlist last inserted text
nnoremap gV `[`v`]

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Returns true if paste mode is on
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Syntastic check
map <leader>sc :SyntasticCheck<cr>
map <leader>st :SyntasticToggleMode<cr>

" Indent setup
"set nofoldenable
"set foldlevel=2

" Enable folding
set foldenable

" Open most folds by default
set foldlevelstart=10

" Ten nested fold max
set foldnestmax=10

" Space open/closes folds
nnoremap <space> za

" Fold based on indent level
set foldmethod=indent

" Some fixes if we have TMUX
if exists('$TMUX')
    set term=screen-256color
endif

" tmux static cursor shape
if exists('$ITERM_PROFILE')
    if exists('$TMUX') 
        let &t_SI = "\<Esc>[3 q"
        let &t_EI = "\<Esc>[0 q"
    else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
end

" Something that fixes the 'Still no compile flags' YCM problem
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" CtrlP settings
let g:ctrlp_match_window='bottom,order:ttb'
let g:ctrlp_switch_buffer=0
let g:ctrlp_working_path_mode=0
let g:ctrlp_max_files=0

" Open CtrlP search in a new tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': [],
    \ 'AcceptSelection("t")': ['<cr>', '<c-m'],
    \ }

" Speed up CtrlP using ag (Silver Searcher)
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

" Toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" This is a slew of commands that create language-specific settings for certain 
" filetypes/file extensions. It is important to note they are wrapped in an 
" augroup as this ensures the autocmd's are only applied once. In addition, the 
" autocmd! directive clears all the autocmd's for the current group.
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    "autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                "\:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType python setlocal shiftwidth=2
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" Airline
let g:airline_theme='molokai'
