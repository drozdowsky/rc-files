set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" colorschemes
Plugin 'tomasr/molokai'
Plugin 'dylanaraps/wal.vim'


" Git in vim
Plugin 'tpope/vim-fugitive'


" airline in vim
Plugin 'vim-airline/vim-airline'


" sort imports in vim, requirement: pip install isort
Plugin 'fisadev/vim-isort'


" Folding
Plugin 'tmhedberg/SimpylFold'


" Indent for python - my fork
Plugin 'drozdowsky/indentpython.vim'


" vyper language syntax highlight
Plugin 'jacqueswww/vim-vyper' 


" jedi is shit, long live the ctags & cscope!
Plugin 'drozdowsky/cscope_maps.vim'
set complete-=i  " stackoverflow.com/questions/2169645


" color highlight :ColorHighlight/Clear/Toggle
Plugin 'lilydjwg/colorizer'
let g:colorizer_startup = 0
let g:colorizer_nomap = 1
let g:colorizer_fgcontrast = 0


" syntax highlighting
set encoding=utf-8
syntax on
Plugin 'w0rp/ale'
let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_completion_enabled = 0
let g:ale_echo_msg_format = '%severity%  %s (%code%)' 
let g:ale_lint_on_save = 1
let g:ale_python_pylint_options = "--rcfile ~/.config/.pylintrc"
let g:ale_python_flake8_options = "--config ~/.config/flake8"


" nerdtree under Ctrl+t
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\~$'] "ignore files in NERDTree
let NERDTreeRespectWildIgnore = 1
let NERDTreeMinimalUI = 1
let NERDTreeNatualSort = 1
" let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
map <C-t> :NERDTreeToggle<CR>


" fuzzy search in vim
set rtp+=~/builds/fzf
Plugin 'drozdowsky/minimal-fzf.vim'
nnoremap <C-p> :Files<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" color scheme & show line highlight
"colorscheme wal
set t_Co=256
colorscheme molokai
set background=dark
set cursorline
hi CursorLine   cterm=NONE cterm=bold ctermbg=237 term=bold ctermfg=NONE


" Window switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitright splitbelow


" Folding options
nnoremap <space> za
set foldmethod=indent
set foldlevel=99


" Configs per buffer type
autocmd ColorScheme * highlight BadWhitespace guibg=red ctermbg=darkred
autocmd ColorScheme * highlight SuspiciousComma guibg=red ctermbg=103
au BufRead,BufNewFile *.py,*.pyw,*.vy set expandtab
au BufRead,BufNewFile *.py,*.pyw,*.vy set textwidth=120
au BufRead,BufNewFile *.py,*.pyw,*.vy set tabstop=4
au BufRead,BufNewFile *.py,*.pyw,*.vy set softtabstop=4
au BufRead,BufNewFile *.py,*.pyw,*.vy set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw,*.vy set autoindent
"au BufRead,BufNewFile *.py,*.pyw,*.vy match BadWhitespace /^\t\+/
"au BufRead,BufNewFile *.py,*.pyw,*.vy match BadWhitespace /\s\+$/
" match ,$ as the bad whitespace
"au BufRead,InsertLeave *.py,*.pyw,*.vy match SuspiciousComma /,$/
au         BufNewFile *.py,*.pyw,*.vy set fileformat=unix
au BufRead,BufNewFile *.py,*.pyw,*.vy let b:comment_leader = '#'

" Delete trailing whitespaces when saving python file
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
au BufWrite           *.py,*.pyw,*.vy :call DeleteTrailingWS()

" disable vim comments on new line
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro

" when resizing vim - make windows equal size
autocmd VimResized * wincmd =

" Fast ESC in visual/insert mode
set timeoutlen=1000
set ttimeoutlen=0
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END

" frontend
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent

" markdown
au BufNewFile,BufRead *.md
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent


" fzf doesnot use wildignore but .rgignore
set wildignore+=*.pyc,*.swp,
" always show X line at the top/bottom when scrolling
set scrolloff=2
" show line number in current line
set nu
" show jump numbers
set relativenumber
" use fast terminal
set ttyfast
" always show statusline
set laststatus=2
" set PWD in to path
set path=$PWD/**
" dont exit buffers but hide them
set hidden


" better vim's builtin autocompletion
set wildmenu
set wildmode=longest:full,full
set ignorecase
set smartcase


" store swaps in ~/.vim/tmp
set directory^=$HOME/.vim/tmp//


" Allow saving of files as sudo when I forgot to start vim using sudo. Usage: $w
cmap $w w !sudo tee > /dev/null %


" \b buffer,mark,text switching in vim (needs fzf.vim to work)
"nnoremap <Leader>b :set nomore<Bar>:ls<Bar>:set more<CR>:b<Space>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>m :Marks<CR>
nnoremap <Leader>t :Rg<CR>
" add tab switching under \\ and \'
nnoremap <Leader>\ :tabnext<CR>
nnoremap <leader>' :tabprev<CR>
nnoremap <leader>] :tabprev<CR>


" disable arrows in vim
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>


" Super Tab completion under Shift+Tab
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction
inoremap <S-Tab> <c-r>=Smart_TabComplete()<CR>
