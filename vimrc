" Shortcuts
" C-r - Redo
" cw  - delete until the end of word 


" ----------------  Initialize Vundle Plugin Manager  ----------------
filetype off                       " required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim  " set runtime path to include Vundle and init
call vundle#begin()
Plugin 'gmarik/Vundle.vim'         " let Vundle manage Vundle, required


" ----------------  Sane Default Settings  ----------------
" general
let mapleader=' '   " remap vim leader to ,
set nocompatible    " do not make vim compatible with vi.
set backspace=2     " backspace in insert mode works like normal editor
set wildmenu        " show auto complete menus like Bash
set relativenumber  " use ultra swift rel numbering
set expandtab       " use spaces instead of tabs
set tabstop=2       " each tab is 2 spaces unless overridden below
set shiftwidth=2    " auto intents will be 2 spaces
filetype indent on  " load indent file for filetype if found

" code folding
" `zR` - open all
" `zM` - close all
map <leader>f za
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Use Ack for searching
set grepprg=ack


" ----------------  Language Support  ----------------
Bundle 'pangloss/vim-javascript' 
Bundle 'cakebaker/scss-syntax.vim'


" ----------------  Plugins  ----------------
"
" closes ( and { after opening them
Plugin 'AutoClose'

" NerdTree file finder tray
Plugin 'scrooloose/nerdtree'   
map <leader>d :NERDTreeToggle<CR>
" If buffer closes before NerdTree, close NerdTree too
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Control P - Fuzzy finder like PeepOpen & Sublime
Plugin 'kien/ctrlp.vim'   


" ----------------  Theme / UI  ----------------
syntax on           " syntax highlighting



" End Vundle, ** all plugins must be above this line **
call vundle#end()            " required for vundle
filetype plugin indent on    " required for vundle

