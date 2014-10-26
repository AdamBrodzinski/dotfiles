" ----------------  Initialize Vundle Plugin Manager  ----------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'


" General settings before plugins
let mapleader=' '   " remap vim leader to ,


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

" code folding
map <leader>f za
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Use Ack for searching
set grepprg=ack

