" ----------------  Initialize Vundle Plugin Manager  ----------------
let mapleader=' '
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'


" ----------------  Start Plugins  ----------------


" Snippet Manager
Plugin 'SirVer/ultisnips'
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
nmap <silent> <leader>es :UltiSnipsEdit<CR>


" Auto close brackets/parens
Plugin 'AutoClose'
let AutoCloseExpandEnterOn = '{'


" NerdTree file finder tray
Plugin 'scrooloose/nerdtree'
map <leader>d :NERDTreeToggle<CR>
" If buffer closes before NerdTree, close NerdTree too
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" Control P - Fuzzy finder like PeepOpen & Sublime
Plugin 'kien/ctrlp.vim'


" Language Support
Bundle 'pangloss/vim-javascript'
Bundle 'cakebaker/scss-syntax.vim'


" Themes
Plugin 'chriskempson/base16-vim'



call vundle#end()            " required
filetype plugin indent on    " required

" ----------------  End Plugins  ----------------



" sane defaults
set backspace=2     " backspace in insert mode works like normal editor
set wildmenu        " show auto complete menus like Bash
set relativenumber  " use ultra swift rel numbering
set expandtab       " use spaces instead of tabs
set tabstop=2       " each tab is 2 spaces unless overridden below
set shiftwidth=2    " auto intents will be 2 spaces
set vb              " set visual bell to prev beeping
set history=100     " keep some stuff
set virtualedit=all " allow cursor to go in "invalid" places
set diffopt+=iwhite

" code folding
map <leader>f za
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use


" Theme UI Settings
set background=dark
colorscheme base16-ocean
set guifont=Source\ Code\ Pro\:h14
set encoding=utf-8  
set linespace=2
set mousehide
set guioptions-=T
set scrolloff=8
set fillchars = ""
syntax on



" window tabs
if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif

" toggle between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Search Settings 
set grepprg=ack
set wrapscan
set ignorecase
set hls            " search highlighting
set incsearch      " incrementally match the search


