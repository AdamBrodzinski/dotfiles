" ------ Initialize Vundle Plugin Manager -----
nnoremap <space> <Nop>
let mapleader=' '
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'



" ---------------- Plugins ----------------
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ntpeters/vim-better-whitespace'
let g:ctrlp_custom_ignore = 'build\|_build\|deps\|plugins\|node_modules\|git\'



" ----------- Language Support ------------
Bundle 'pangloss/vim-javascript'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'Slava/vim-spacebars'
Plugin 'mxw/vim-jsx'
Plugin 'lambdatoast/elm.vim'
Plugin 'elixir-lang/vim-elixir'
" json like files
au BufRead,BufNewFile .{eslintrc,babelrc} setf json
" enable Sass
set omnifunc=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.scss  set ft=scss.css
" redscript
au BufReadPost *.rs set ft=elixir
let g:jsx_ext_required = 0 " Allow JSX in normal JS files



" -------------------- Themes ---------------------
"Plugin 'chriskempson/base16-vim'
"Plugin 'yosiat/oceanic-next-vim'
Bundle "Slava/vim-colors-tomorrow"



" ---------------- end plugins ----------------
call vundle#end()            " required
filetype plugin indent on    " required



" ------------------ Customize -------------
set backspace=2     " backspace in insert mode works like normal editor
set wildmenu        " show auto complete menus like Bash
set relativenumber  " use ultra swift rel numbering
set expandtab       " use spaces instead of tabs
set tabstop=2       " each tab is 2 spaces unless overridden below
set shiftwidth=2    " auto intents will be 2 spaces
set vb              " set visual bell to prev beeping
set history=100     " keep some stuff
set virtualedit=all " allow cursor to go in "invalid" places
set splitbelow      " split windows the `right` way
set splitright
set diffopt+=iwhite
" toggle rel/reg number on insert
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" spell check
map <F6> :setlocal spell! spelllang=en_us<CR>

set background=dark
" set terminal vim background to none
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
set t_Co=256
let g:tomorrow_termcolors = 256
let g:tomorrow_termtrans = 0 " set to 1 if using transparant background
let g:tomorrow_diffmode = "high"
try
  colorscheme tomorrow
catch
    " we don't have this theme or it throws
endtry
set guifont=Sauce\ Code\ Powerline\:h15
set encoding=utf-8
set linespace=4
set mousehide
set guioptions-=T
set scrolloff=8
set fillchars = ""
syntax on
" hide scrollbars
set guioptions-=L
set guioptions-=r
" speed up vim
set synmaxcol=2048
set nocursorline
set nocursorcolumn


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

" toggle search highlighting
let hlstate=0
nnoremap <space><space> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

set t_Co=256

" Automatically reload vimrc when it's saved
augroup VimrcSo
  au!
  autocmd BufWritePost $MYVIMRC so $MYVIMRC
augroup END
" Edit vimrc file
nmap <leader>ev <Esc> :tabe ~/.vimrc<CR>


" spacemacs bindings
nnoremap <leader>pt :NERDTreeTabsToggle<CR>
nnoremap <leader>pf :CtrlP<CR>
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wh :split<CR>
nnoremap <leader>0 :NERDTreeFocus<CR>
nnoremap <leader>1 :NERDTreeFocus<CR>
