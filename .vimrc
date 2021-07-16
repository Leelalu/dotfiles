""" Vim """
"""""""""""

""""""""""""""""""""""""
""" Enable vim-plugs """
"""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf.vim'
Plug 'vim-python/python-syntax'
Plug 'Rigellute/shades-of-purple.vim'
call plug#end()

"""""""""""""""""""
""" Functioning """
"""""""""""""""""""
" Use prev lines indent for newline
set autoindent
" At line start use shiftwidth with tab
set smarttab
" Better command line completion
set wildmenu
" Show partial commands
set showcmd
" Set ignore case unless cap is explicitally used
set ignorecase
set smartcase
" Set hidden
set hidden
"  Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
" Disable backspace
set backspace=
" Auto commands for files
filetype plugin on

""""'""""""""""""""
""" Set visuals """
"""""""""""""""""""
" Enable line numbers
set relativenumber
set number
" Highlight searches
set hlsearch
" Set command win to two lines
set cmdheight=2
" Set colorscheme
colorscheme shades_of_purple
" Syntax highlighting
syntax enable
if has('filetype')
  filetype indent plugin on
endif
if has('syntax')
  syntax on
endif

""""""""""""""""""""
"""  Status line """
""""""""""""""""""""
" Set to always show statusline
set laststatus=2
" Create map for modeline
let g:currentmode={ 'n'  : 'Normal', 'no' : 'Normal·Operator Pending', 'v'  : 'Visual', 'V'  : 'V·Line', '^V' : 'V·Block', 's'  : 'Select', 'S'  : 'S·Line', '^S' : 'S·Block', 'i'  : 'Insert', 'R'  : 'Replace', 'Rv' : 'V·Replace', 'c'  : 'Command', 'cv' : 'Vim Ex', 'ce' : 'Ex', 'r'  : 'Prompt', 'rm' : 'More', 'r?' : 'Confirm', '!'  : 'Shell', 't'  : 'Terminal'}
" Create Highlights
highlight sl1   ctermfg=white ctermbg=55
highlight sl2   ctermfg=white ctermbg=135
highlight sl122   ctermfg=55 ctermbg=135
highlight sl221   ctermfg=135 ctermbg=55
highlight sl1end   ctermfg=55 ctermbg=black
highlight sl2end   ctermfg=135 ctermbg=black
"   Empty/darken statusline
set statusline=
" Start Statusling
"  File info
set statusline+=\ %#sl1#%F%y\ %#sl122#
"  File Type
set statusline+=\ %#sl2#%t\ %#sl221#
"  Byte size and current modifier info
set statusline+=\ %#sl1#ByteSize:%{getfsize(expand(@%))}%m%r%h%w\ %#sl1end#
"   Switch side
set statusline+=%=
"  Start  right side
set statusline+=%#sl1end#
"  Percentage through file
set statusline+=%#sl1#\ %p%%\ %#sl221#\ 
"  Cursor placement
set statusline+=%#sl2#\ %c-%l:%L%#sl122#\ 
"  Current mode
set statusline+=%#sl1#\ %{get(g:currentmode,mode())}
"  Reset highlighting for vim
hi Normal guibg=NONE ctermbg=NONE
