"-----------------------------------------------------------------------------
" Vundle
"-----------------------------------------------------------------------------
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-git.git'
"Bundle 'tpope/vim-bundler.git'
Bundle 'tpope/vim-cucumber.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-rake.git'
Bundle 'tpope/vim-rbenv.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'tpope/vim-surround.git'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'
"Bundle 'wincent/Command-T'
Bundle 'mileszs/ack.vim'
Bundle 'rking/ag.vim'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-haml'
Bundle 'scrooloose/syntastic'
"Bundle 'astashov/vim-ruby-debugger'
" vim-snipmate dependencies
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'nanotech/jellybeans.vim'
Bundle 'alindeman/grb256'
Bundle 'ZoomWin'
Bundle 'majutsushi/tagbar'
Bundle 'kchmck/vim-coffee-script'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
" Bundle 'janx/vim-rubytest'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'benmills/vimux'
Bundle 'tpope/vim-dispatch'
Bundle 'airblade/vim-gitgutter'
Bundle 'vim-scripts/ruby-matchit'
"Bundle 'tpope/vim-fireplace'
"Bundle 'guns/vim-clojure-static'
"Bundle 'tpope/vim-classpath'
Bundle 'marijnh/tern_for_vim'
Bundle 'christoomey/vim-tmux-navigator'
"-----------------------------------------------------------------------------
" Global Stuff
"-----------------------------------------------------------------------------

filetype on
filetype plugin on
filetype indent on
set noswapfile

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set wildignore=*.o,*.obj,*.class
set backspace=2 " make backspace work like most other apps
set sp=>
set nu

" Set the status line the way i like it
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Don't update the display while executing macros
set lazyredraw

" Don't show the current command int he lower right corner.  In OSX, if this is
" set and lazyredraw is set then it's slow as molasses, so we unset this
set showcmd

" Show the current mode
set showmode

" Switch on syntax highlighting.
syntax on

" Hide the mouse pointer while typing
set mousehide

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

set showmatch

" highlight current line
set cursorline
set cmdheight=2

set switchbuf=useopen


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set t_Co=256 " 256 colors
:set background=dark
:color grb256

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set foldmethod=syntax
"set foldlevelstart=1

" au FileType javascript call JavaScriptFold()
"let javaScript_fold=1         " JavaScript
"let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" System default for mappings is now the "," character
let mapleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>y "+y
map <leader>p "+p
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
map <F8> :TagbarToggle<CR>

" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>
" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

imap jj <esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" wrap and cursor movement
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    noremap  <buffer> <silent> k gk
    noremap  <buffer> <silent> j gj
    noremap  <buffer> <silent> 0 g0
    noremap  <buffer> <silent> $ g$    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

"-----------------------------------------------------------------------------
"" CUSTOM AUTOCMDS
"-----------------------------------------------------------------------------
augroup vimrcEx
  "autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
  autocmd BufRead * normal zR
augroup END

"-----------------------------------------------------------------------------
"" CtrlP Plugin Settings
"-----------------------------------------------------------------------------
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_height = 30

"-----------------------------------------------------------------------------
"" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
"" Toggle the NERD Tree on an off with F7
nmap <F7> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F7
" nmap <S-F7> :NERDTreeClose<CR>
"
" " Show the bookmarks table on startup
" let NERDTreeShowBookmarks=1
"

"-----------------------------------------------------------------------------
"" Command-T Plugin Settings
"-----------------------------------------------------------------------------
let g:CommandTMaxFiles=100000


"-----------------------------------------------------------------------------
"" Ctrl-P Plugin Settings
"-----------------------------------------------------------------------------
let g:ctrlp_max_files = 0

"-----------------------------------------------------------------------------
" ruby path using rbenv
"-----------------------------------------------------------------------------
let g:ruby_path = system('echo $HOME/.rbenv/shims')

"-----------------------------------------------------------------------------
" ruby-debugger
"-----------------------------------------------------------------------------
let g:ruby_debugger_no_maps = 1
let g:ruby_debugger_debug_mode = 1


"-----------------------------------------------------------------------------
" ruby-test
"-----------------------------------------------------------------------------
" let g:rubytest_cmd_test = "ruby %p"
" let g:rubytest_cmd_testcase = "ruby %p -n '/%c/'"
" let g:rubytest_cmd_spec = "spec -f specdoc %p"
" let g:rubytest_cmd_example = "spec -f specdoc %p -e '%c'"
" let g:rubytest_cmd_feature = "cucumber %p"
" let g:rubytest_cmd_story = "cucumber %p -n '%c'"

:let g:test_cmd="rspec"
nmap <leader>t :call VimuxRunCommand("clear; " . g:test_cmd . " --color " . expand('%') . ":" . expand(line('.')) )<CR>
nmap <leader>rr :let g:test_cmd="rspec" <CR>
nmap <leader>rc :let g:test_cmd="cucumber" <CR>

let g:dash_map = {
        \ 'ruby'       : 'AllRubyDocs'
        \ }

"-----------------------------------------------------------------------------
" Functions
"-----------------------------------------------------------------------------
function CopyPath()
    let @+=expand('%:p')
endfunction

function CopyFileName()
    let @+=expand('%:t')
endfunction

command! -nargs=0 CopyPath     call CopyPath()
command! -nargs=0 CopyFileName call CopyFileName()

" Copies the fully qualified (package.class) name of the current Java class or the filename only (no extension) if there
" is no package statement in the class.
function! GetFqn()
 " Store the cursor position
 normal ma 
 let packageLine = '^\s*package\s\+\(.*\);'
 0
 let packageLineNumber = search( packageLine, 'w' )
 " Restore cursor position
 normal `a
 if ( packageLineNumber == 0 )
   return expand( "%:t:r" )
 endif
 let package = substitute( getline( packageLineNumber ), packageLine, '\1', '' )
 let result = package . "." . expand( "%:t:r" )
 return result
endfunction
com! Copyfqn let @+=GetFqn() | echo @+


" Run a given vim command on the results of fuzzy selecting from a given shell
" " command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
    try
        silent let selection = system(a:choice_command . " | selecta " .  a:selecta_args)
    catch /Vim:Interrupt/
        " Swallow the ^C so that the redraw below happens; otherwise there will be
        " leftovers from selecta on the screen
        redraw!
        return
    endtry
    redraw!
    exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>
