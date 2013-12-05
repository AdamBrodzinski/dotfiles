" no vi
set nocompatible     

" Get pathogen up and running
call pathogen#infect()

" System default for mappings is now the "," character
let mapleader = ","


" Set ctags
map <leader>ct :!/usr/local/bin/ctags -R --exclude=.git --exclude=log *<CR>
set tags=./tags

" Use Ack
set grepprg=ack

" Ultisnips Config
let g:UltiSnipsSnippetDirectories = [ "snippets" ]
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Quick edit Ultisnips
nmap <silent> ,es :UltiSnipsEdit<CR>

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

" Tabstops are 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" These are 4 spaces
"autocmd FileType javascript setlocal softtabstop=4 shiftwidth=4 tabstop=4
autocmd FileType c setlocal softtabstop=4 shiftwidth=4 tabstop=4
autocmd FileType php setlocal softtabstop=4 shiftwidth=4 tabstop=4

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" set the search scan to wrap lines
set wrapscan

set ignorecase

" Make command line two lines high
set ch=2

" set visual bell -- i hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Don't update the display while executing macros
set lazyredraw

" Don't show the current command in the lower right corner.  In OSX, if this is
" set and lazyredraw is set then it's slow as molasses, so we unset this
set showcmd

" Show the current mode
set showmode

" Switch on syntax highlighting.
syntax on

" Hide the mouse pointer while typing
set mousehide

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions-=T

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
"      "," key and the "d" key.  If the "d" key isn't pressed before the
"      timeout expires, one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
set timeoutlen=1200

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Make the command-line completion better
set wildmenu

" get rid of the silly characters in separators
set fillchars = ""

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Enable search highlighting
set hls

" Incrementally match the search
set incsearch

" Automatically read a file that has changed on disk
set autoread

" Line numbering
set nu

" Custom mappings
" HTML
map <leader>b <s-s>tstrong>
map <leader>e <s-s>tem>
" map <leader>p <s-v><s-s>tp><s-j>x<s-j>x
map <leader>a <s-s>ta href="#">f#xi
nnoremap <leader>a f>
" Ack
map <C-n> :cn<CR>
map <C-p> :cp<CR>
" Haml                                
map <leader>ch 0<c-v>lr/<cr>
                                
" File Movement
"imap j gj
"imap k gk

" Indenting in insert
inoremap <D-]> <esc>>>i
inoremap <D-[> <esc><<i

" Awesome status line
set encoding=utf-8  
let g:Powerline_symbols = 'fancy'

" easy match bracket pairs
nnoremap <tab> %
vnoremap <tab> %  

" Command + Enter doesnt disturb line for css
inoremap <D-CR> <C-O>o
inoremap <D-S-CR> <esc>:/}<cr>o<cr><esc>:nohls<cr>cc

" Autoclose setting
let AutoCloseExpandEnterOn = '{'

" Ctrl + Enter to block-edit element
inoremap <c-cr> <cr><esc>kl%a<cr>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

" Turn off that stupid highlight search
nmap <silent> ,n :nohls<CR>

" The following beast is something i didn't write... it will return the 
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as 
" syntax highlighting goes.
nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" set text wrapping toggles
nmap <silent> ,ww :set invwrap<CR>:set wrap?<CR>

" Delete empty lines
nmap ,del :g/^$/d<cr>

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Make horizontal scrolling easier
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh

" Underline the current line with '='
nmap <silent> ,u= :t.\|s/./=/g\|:nohls<cr>
nmap <silent> ,u- :t.\|s/./-/g\|:nohls<cr>

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Highlight the current line and column
" Don't do this - It makes window redraws painfully slow
set nocursorline
set nocursorcolumn


"-----------------------------------------------------------------------------
"                     Syntastic Syntax Highlighing
"-----------------------------------------------------------------------------
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_javascript_checkers = ['jshint']
" manually check html due to shitty handlebars support
let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }


"-----------------------------------------------------------------------------
"                     Rspec - (sweet-rspec-vim)
"                     https://github.com/duskhacker/sweet-rspec-vim
"-----------------------------------------------------------------------------
" Run file: Cmd+r
"map <D-r> :SweetVimRspecRunFile<CR>
" Run focused spec: Cmd+Shift+r
"map <D-R> :SweetVimRspecRunFocused<CR>
" Run last spec: Opt+Cmd+r
"map <M-D-r> :SweetVimRspecRunPrevious<CR>
" show specs in quickfix window
let $SWEET_VIM_RSPEC_SHOW_PASSING="true"


"-----------------------------------------------------------------------------
"                     Set up the window colors and size
"-----------------------------------------------------------------------------

" toggle between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" hide scrollbars
set guioptions-=L
set guioptions-=r

set background=dark

"-------------------- FONTS -------------------- 

"set guifont=Anonymous\ Pro:h16
"set guifont=monaco:h13
set guifont=Source\ Code\ Pro\:h14
"set linespace=3



" ------------------ COLOR SCHEMES --------------- 

colorscheme hybrid
"colorscheme cobalt
"colorscheme distinguished

" dark navy
"hi Normal guibg=#000325
" dark slate grey
"hi Normal guibg=#18181B


map <leader>h :set hlsearch!<cr>
set hlsearch!

au BufNewFile,BufRead *.rs set filetype=ruby
" Toggle spell check
map <F6> :setlocal spell! spelllang=en_us<CR>

set omnifunc=csscomplete#CompleteCSS
" remap omni complete to Ctrl-space
inoremap <C-space> <C-x><C-o>

"insert line below without entering insert mode
map <CR> o<esc>

" Command + Enter doesnt disturb current line
inoremap <D-CR> <esc>o

" start nerdtree up
" autocmd vimenter * NERDTree

" inoremap ,d :NERDTreeToggle<cr>

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber


if has("gui_macvim")
 " macmenu File.New\ Tab key=<nop>
 map <C-p> <Plug>PeepOpen
end  

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

