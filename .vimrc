" BASICS

" we use vim, not vi
set nocompatible

" always search recursively (e.g. when using :find)
set path+=**

" edit runtimepath
set runtimepath+=~/.vim/syntax

" enable system clipboard
set clipboard=unnamed
" set clipboard=unnamedplus

let mapleader=' '
let maplocalleader=' '

" automatically source vimrc on save {{{
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost vimrc source $MYVIMRC
augroup END
" }}}

" cursor to the last line when reopening a file {{{
augroup line_jump_on_open
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
" }}}


" PLUGINS

" managed by Vundle. Install like this:
"       git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

" start vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'vim-airline/vim-airline'

" preview register contents
Plugin 'junegunn/vim-peekaboo'

Plugin 'airblade/vim-gitgutter'

Plugin 'haya14busa/incsearch.vim'

" generate tag file automagically
Plugin 'craigemery/vim-autotag'
let g:autotagTagsFile=".tags"

" automagically add closing braces etc
Plugin 'Raimondi/delimitMate'

" add/change/delete quotes/braces/... and more
Plugin 'tpope/vim-surround'

Plugin 'vim-scripts/toggle_words.vim'
noremap <silent> <Leader>o :ToggleWord<CR>

" amazing fuzzy finder
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plugin 'junegunn/fzf.vim'
let g:fzf_command_prefix = 'Fzf'
nnoremap <Leader>b :FzfBuffers<CR>
nnoremap <Leader>f :FzfFiles<CR>
nnoremap <Leader>s :FzfAg<CR>
nnoremap <Leader>t :FzfTags<CR>

Plugin 'w0rp/ale'

Plugin 'benmills/vimux'
let g:VimuxHeight = "34"
let g:VimuxOrientation = "v"
let g:VimuxUseNearest = 1
nnoremap <Leader>vo :VimuxRunCommand "clear; "<Left>
nnoremap <Leader>vf :VimuxRunCommand "clear; " . expand('%')<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
nnoremap <Leader>vv :update<CR>:VimuxRunLastCommand<CR>
nnoremap <Leader>vq :VimuxCloseRunner<CR>

" autocompletion in command mode
Plugin 'vim-scripts/CmdlineComplete'
cmap <C-p> <Plug>CmdlineCompleteBackward
cmap <C-n> <Plug>CmdlineCompleteForward

Plugin 'flazz/vim-colorschemes'

" finish vundle
call vundle#end()
filetype plugin indent on


" SETTINGS

" netrw file browser

" let g:netrw_liststyle = 1
" let g:netrw_winsize = 31
let g:netrw_liststyle = 0
let g:netrw_winsize = 16
let g:netrw_banner = 0
let g:netrw_browse_split = 4

" toggle netrw and start from current file
nnoremap <silent> <F2> :exe ':Lexplore! ' . expand('%:p:h')<CR>

" toggle netrw and start from working (project) dir
nnoremap <silent> <F3> :Lexplore!<CR>

" puts new split windows to the bottom of the current
set splitbelow

" puts new vsplit windows to the right of the current
set splitright

" allow mouse usage for bad days
if has('mouse')
    set mouse=a
endif

" disable all bells
set noerrorbells
set novisualbell
set t_vb=

" encoding should be utf-8 on every OS
set     encoding=utf-8
set fileencoding=utf-8

" reload files changed outside vim
" (still have to change buffer or call :checktime)
set autoread

" command history size
set history=9999

" do not create swap files (they annoy me more than they help)
set noswapfile

" persistent undo over file close
" (the undodir needs to exist!)
if has ('persistent_undo')
    set undofile
    set undodir=~/.vim/undodir
    set undolevels=1000
    set undoreload=10000
endif

" syntax highlighting
syntax enable

" do not wrap lines until I say so
set nowrap

" highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" some interface settings
set number
set showcmd
set ruler
set laststatus=2

" completions behaviour
set wildmode=longest,full
set wildmenu

" ignore some files
set wildignorecase
set wildignore+=*.swp
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*.o,*.obj,*.pyc,*.class
set wildignore+=*.pdf,*.doc,*.docx,*.xls,*.xlsx,*.ppt,*.pptx,*.odt,*.ods
set wildignore+=*.jpg,*.jpeg,*.png
set wildignore+=*.mp3,*.mp4,*.mpg,*.mpeg,*.flv,*.wav
set wildignore+=*.aux,*.bbl,*.blg,*.fdb_latexmk,*.fls,*.loe,*.lof,*.out,*.toc

" search preferences
set incsearch
set ignorecase
set smartcase

" allow <BS> to delete everything
set backspace=indent,eol,start

" allow to :edit multiple files in buffers without writing changes
set hidden

" Enable folding
set foldmethod=indent
set foldlevel=99


" KEYMAPPINGS

" open my vimrc right away
nnoremap <Leader>ev :execute 'edit ' . resolve(expand($MYVIMRC))<CR>

" scroll a little smoother (but still without plugin)
" (this actually is suggested in :help scroll-smooth)
noremap <M-j>  <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>
noremap <Esc>j <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>
noremap <M-k>  <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
noremap <Esc>k <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>

" swap ` and ' (jump to markers)
" (by default, ' marked line, ` marked line and column)
nnoremap ' `
nnoremap ` '

" goto last edit
nnoremap <Leader>. `.

" center line when jumping around
nnoremap <c-o> <c-o>zz
nnoremap <c-i> <c-i>zz

" change to LRU buffer
nnoremap <Space><Space> :buffer #<CR>
nnoremap <Space><Tab>   :buffer #<CR>

" change window
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

" open help in vertical window
cnoreabbrev <expr> h ((getcmdtype() is# ':' && getcmdline() is# 'h')
            \ ?('vertical help'):('h'))

" alternative way to go back to normal mode
inoremap jk <Esc>
cnoremap jk <C-c>

" move intuitively when text is wrapped
nnoremap j gj
nnoremap k gk

" move faster
nnoremap gj 8j
nnoremap gk 8k
vnoremap gj 8j
vnoremap gk 8k

" indent lines
vnoremap < <gv
vnoremap > >gv

" Enable folding with the spacebar
nnoremap <space> za

" appearance
set background=light
colorscheme PaperColor

" alternative color schemes
" colorscheme iceberg
" colorscheme luna-term

