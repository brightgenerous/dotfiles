" .vimrc

scriptencoding utf-8


" ____________________________________________________________
"  swp file
set directory=/tmp
set directory+=~/.vim/tmp
set directory+=.

"  backup file
set backupdir=/tmp
set backupdir+=~/.vim/tmp
set backupdir+=.
" ------------------------------------------------------------


" ____________________________________________________________
"  file type
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,ucs-bom,euc-jp,eucjp-ms,cp932
set fileencoding=utf-8
" ------------------------------------------------------------


" ____________________________________________________________
set splitright
set laststatus=2
set backspace=start,eol,indent,
" ------------------------------------------------------------


" ____________________________________________________________
"  syntax
syntax on
set number
set ruler
set highlight=on
set scrolloff=10
set hlsearch
set incsearch

"  highlight indegraphic space
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline cterm=underline ctermbg=Cyan guibg=Cyan
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

"  guide line
"augroup cch
"  autocmd! cch
"  autocmd WinLeave * set nocursorline
"  autocmd WinLeave * set nocursorcolumn
"  autocmd WinEnter,BufRead * set cursorline
"  autocmd WinEnter,BufRead * set cursorcolumn
"augroup END
set cursorline
"set cursorcolumn

"  indent
set autoindent
set tabstop=2
set expandtab
set shiftwidth=2
set shiftround

"  for white-space detection
set list
set listchars=tab:>-,trail:-,nbsp:-,extends:>,precedes:<,eol:↲

"  color scheme
colorscheme desert
" ------------------------------------------------------------


" ____________________________________________________________
"  mouse support
set mouse=a

"  for screen
if &term =~ "^screen"
  augroup MyAutoCmd
    autocmd VimLeave * :set mouse=
  augroup END
  " for avoid freeze
  set ttymouse=xterm2
endif

if has('gui_running')
  " show popup menu if right click
  set mousemodel=popup
  " don't focus the window when the mouse pointer is moved
  set mousefocus
  " hide mouse pointer on insert mode
  set mousehide
endif
" ------------------------------------------------------------


" ____________________________________________________________
" -- key map --
"  ESC
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

"  backspace
noremap  
noremap!  
noremap <BS> 
noremap! <BS> 

"  save
nnoremap ; :w<CR>

"  tabe
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <Space> <C-w>
" ------------------------------------------------------------


" ____________________________________________________________
" -- NeoBundle --
set nocompatible
filetype off
if has ('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/neobundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'


NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

filetype plugin on
filetype indent on

NeoBundleCheck
" ------------------------------------------------------------


" ____________________________________________________________
"  set history must come after set no compatible statement
set history=1000
" ------------------------------------------------------------


" ____________________________________________________________
" -- unite vim --
nnoremap [unite] <Nop>
nmap <Space>u [unite]

" history yank
let g:unite_source_history_yank_enable=1
" hilight color
let g:unite_cursor_line_highlight='TabLineSel'

nnoremap [unite]f :<C-u>Unite file file/new<CR>
nnoremap [unite]b :<C-u>Unite buffer tab<CR>
nnoremap [unite]t :<C-u>Unite tab<CR>
nnoremap [unite]a :<C-u>Unite file file/new buffer tab<CR>
nnoremap [unite]h :<C-u>Unite file_mru<CR>
nnoremap [unite]s :<C-u>Unite file_rec<CR>
nnoremap [unite]l :<C-u>Unite line<CR>
nnoremap [unite]y :<C-u>Unite history/yank<CR>
nnoremap [unite]r :<C-u>UniteResume<CR>
nnoremap [unite]bd :<C-u>UniteWithBufferDir file file/new<CR>
nnoremap [unite]cd :<C-u>UniteWithCurrentDir file file/new<CR>
nnoremap <expr> [unite]% ':<C-u>Unite file file/new -input=' . expand('%:p') . '<CR>'

" ------------------------------------------------------------
