" Vim

" Vim plugged for some niceties
call plug#begin()
Plug 'preservim/NERDTree'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'liuchengxu/vim-clap'
call plug#end()

"" Settings
" Menus
set wildmenu showcmd
" Searching
set ignorecase smartcase hlsearch
" Line numbers
set ruler number relativenumber
" Text tabs
set tabstop=2 softtabstop=2
set shiftwidth=2
set smarttab autoindent
" Max vim tabs
set tabpagemax=15
" Column limit
set colorcolumn=80
" Folding
set foldenable foldmethod=indent
" Cursor guides
set cursorline cursorcolumn
" Get filetypes
filetype plugin on

"" Keymaps
" Editing shortcuts
noremap zz :w<CR>
" Quick Movement
noremap <S-h> 0
noremap <S-j> 10j
noremap <S-k> 10k
noremap <S-l> $
" Windows
noremap <C-h> <C-w>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
" Tabs
noremap <C-t> gt
" NerdTree
noremap <C-n> :NERDTreeToggle<CR>

"" Hooks
" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
" Cursor line/column only on one window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
augroup CursorColumn
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  au WinLeave * setlocal nocursorcolumn
augroup END
" Syntax highlighting
syntax enable
if has('filetype')
  filetype indent plugin on
endif
if has('syntax')
  syntax on
endif

"" Colorscheme
colorscheme purpin

""  Status line
" Always show statusline
set laststatus=2
" Create map for better modeline status
let currentmode={
\ 'n'  : 'Normal',	'no' : 'Normal·Operator Pending',
\	's'  : 'Select','S'  : 'S·Line', '^S' : 'S·Block', 'i'  : 'Insert',
\	'v'  : 'Visual', 'V' : 'V·Line', '^v' : 'V·Block',
\	'R'  : 'Replace', 'Rv' : 'V·Replace', 'c'  : 'Command',
\	'r?' : 'Confirm', '!'  : 'Shell', 't'  : 'Terminal',
\	'cv' : 'Vim Ex', 'ce' : 'Ex', 'r'  : 'Prompt', 'rm' : 'More'}
" Create Satusline Highlights
hi sldpur  ctermfg=white	ctermbg=55
hi sllpur  ctermfg=white 	ctermbg=135
hi sld2l   ctermfg=55     ctermbg=135
hi sll2d   ctermfg=135		ctermbg=55
hi sldend  ctermfg=55 		ctermbg=235
hi slmid   ctermfg=235 		ctermbg=235
"   Empty statusline var
set statusline=
" Fill in statusline
"  File info
set statusline+=%#sldend#\ %#sldpur#%f%#sld2l#
"  File Type
set statusline+=%#sllpur#\ %{&filetype}\ %#sld2l#
"  Byte size and current modifier info
set statusline+=\%#sldpur#%{getfsize(expand(@%))}b%m%r%h%w\%#sldend#
"   Switch side
set statusline+=%#slmid#%=
"  Start  right side
set statusline+=%#sldend#
"  Percentage through file
set statusline+=%#sldpur#\%p%%\%#sld2l#
"  Cursor placement
set statusline+=%#sllpur#\ %c\ %l\/%L\ %#sld2l#
"  Current mode
set statusline+=%#sldpur#%{get(currentmode,mode())}%#sldend#\ ""
