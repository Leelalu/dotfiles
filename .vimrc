" Vim

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
" Max tabs tabs
set tabpagemax=15
" Column limit
set colorcolumn=80
" Folding
set foldenable foldmethod=indent
" Cursor guides
set cursorline cursorcolumn

"" Keymaps
" Editing shortcuts
noremap zz :w<CR>
noremap <C-e> :e<Space>
noremap <C-b> :b<Space>
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
noremap tt gt
noremap te :tabnew<CR>
noremap td :tabclose<CR>
noremap tj :tabp<CR>
noremap tk :tabn<CR>

"" Hooks
" Auto commands for files
filetype plugin on
"  Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
" Cursor line only on one window
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

""  Status line
" Always show statusline
set laststatus=2
" Create map for better modeline status
let g:currentmode={
\ 'n'  : 'Normal',	'no' : 'Normal·Operator Pending',
\	's'  : 'Select','S'  : 'S·Line', '^S' : 'S·Block', 'i'  : 'Insert',
\	'v'  : 'Visual', 'V' : 'V·Line', '^V' : 'V·Block',
\	'R'  : 'Replace', 'Rv' : 'V·Replace', 'c'  : 'Command',
\	'r?' : 'Confirm', '!'  : 'Shell', 't'  : 'Terminal',
\	'cv' : 'Vim Ex', 'ce' : 'Ex', 'r'  : 'Prompt', 'rm' : 'More'}
" Create Highlights
hi sldpur   ctermfg=white ctermbg=55
hi sllpur   ctermfg=white ctermbg=135
hi sld2l   ctermfg=55 ctermbg=135
hi sll2d   ctermfg=135 ctermbg=55
hi sldend   ctermfg=55 ctermbg=235
hi slmid   ctermfg=235 ctermbg=235
"   Empty statusline var
set statusline=
" Fill in statusline
"  File info
set statusline+=%#sldpur#\ %F%y\ %#sld2l#
"  File Type
set statusline+=\ %#sllpur#%t\ %#sll2d#
"  Byte size and current modifier info
set statusline+=\ %#sldpur#ByteSize:%{getfsize(expand(@%))}%m%r%h%w\ %#sldend#
"   Switch side
set statusline+=%#slmid#%=
"  Start  right side
set statusline+=%#sldend#
"  Percentage through file
set statusline+=%#sldpur#\ %p%%\ %#sll2d#\ 
"  Cursor placement
set statusline+=%#sllpur#\ %c-%l:%L%#sld2l#\ 
"  Current mode
set statusline+=%#sldpur#\ %{get(g:currentmode,mode())}

"" Themeing
" Editor Info
hi Normal				 ctermfg=NONE ctermbg=NONE cterm=NONE
hi StatusLine    ctermfg=234  ctermbg=234  cterm=NONE
hi StatusLineNC  ctermfg=84   ctermbg=234  cterm=NONE
hi VertSplit     ctermfg=NONE ctermbg=234  cterm=NONE
hi ColorColumn   ctermfg=NONE ctermbg=238  cterm=NONE
hi LineNr        ctermfg=140  ctermbg=235  cterm=NONE
hi CursorLineNr  ctermfg=135  ctermbg=235  cterm=NONE
hi CursorLine    ctermfg=NONE ctermbg=240  cterm=NONE
hi CursorColumn  ctermfg=NONE ctermbg=242  cterm=NONE
hi TabLine       ctermfg=140  ctermbg=235  cterm=NONE
hi TabLineSel    ctermfg=11   ctermbg=135  cterm=NONE
hi TabLineFill   ctermfg=NONE ctermbg=234  cterm=NONE
" Menus
hi WildMenu      ctermfg=NONE ctermbg=234  cterm=NONE
hi PMenu         ctermfg=130  ctermbg=135  cterm=NONE
hi PMenuSel      ctermfg=159  ctermbg=236  cterm=NONE
" Searching
hi Search        ctermfg=NONE ctermbg=97   cterm=NONE
hi IncSearch     ctermfg=234  ctermbg=11   cterm=NONE
hi SpellBad      ctermfg=204  ctermbg=NONE cterm=NONE
" Unique text
hi Special       ctermfg=159  ctermbg=NONE cterm=NONE
hi Underlined    ctermfg=202  ctermbg=NONE cterm=underline
hi MatchParen    ctermfg=195  ctermbg=91   cterm=BOLD
hi Folded        ctermfg=140  ctermbg=234  cterm=NONE
" Windows
hi Title         ctermfg=159  ctermbg=NONE		 cterm=NONE
hi NonText       ctermfg=140  ctermbg=NONE 	 cterm=NONE
" Visual selection
hi Visual        ctermfg=NONE ctermbg=97   cterm=NONE
" Data types
hi String        ctermfg=156  ctermbg=NONE cterm=NONE
hi Number        ctermfg=160  ctermbg=NONE cterm=NONE
hi Constant      ctermfg=110  ctermbg=NONE cterm=NONE
hi Structure     ctermfg=172  ctermbg=NONE cterm=NONE
" Language constructs
hi Comment       ctermfg=135  ctermbg=NONE cterm=NONE
hi Type          ctermfg=121  ctermbg=NONE cterm=NONE
hi Identifier    ctermfg=11   ctermbg=NONE cterm=NONE
hi Function      ctermfg=214  ctermbg=NONE cterm=NONE
hi Conditional	 ctermfg=2		ctermbg=NONE cterm=NONE
" Language utils, pipes/builtinfuncs
hi Operator      ctermfg=135  ctermbg=NONE cterm=NONE
hi StorageClass  ctermfg=214  ctermbg=NONE cterm=NONE
" Errors
hi Error         ctermfg=203  ctermbg=NONE cterm=underline
hi ErrorMsg      ctermfg=203  ctermbg=NONE cterm=underline
hi WarningMsg    ctermfg=220  ctermbg=NONE cterm=NONE
