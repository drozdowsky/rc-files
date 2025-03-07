" Install plug if now available
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has('nvim')
    " override intrusive neovim settings
    set guicursor=n-v-c-sm-i-ci-ve:block,r-cr-o:hor20
    set noincsearch
    set nohlsearch
    tnoremap <C-W> <C-\><C-n>
    command! -nargs=* T split | resize 20 | terminal <args>
    nnoremap <C-W>t :T<CR>
else
    nnoremap <C-W>t :terminal<CR>
endif

call plug#begin('~/.vim/plugged')
" ============================================================================
" Plugins here
" Plugins & configurations
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'tzachar/local-highlight.nvim'

" colorschemes
Plug 'tomasr/molokai'
" Plug 'dylanaraps/wal.vim'

" Git in vim
Plug 'tpope/vim-fugitive'

" airline in vim
Plug 'vim-airline/vim-airline'

" Indent for python - my fork
Plug 'drozdowsky/indentpython.vim'

" color highlight :ColorHighlight/Clear/Toggle
Plug 'lilydjwg/colorizer'
let g:colorizer_startup = 0
let g:colorizer_nomap = 1
let g:colorizer_fgcontrast = 0

" syntax highlighting
syntax on
"set shortmess-=F
set shortmess+=c
set completeopt-=preview
set cmdheight=2
set updatetime=300

" nerdtree under Ctrl+t (netrw - sucks)
Plug 'scrooloose/nerdtree'
let NERDTreeIgnore=['\~$'] "ignore files in NERDTree
let NERDTreeRespectWildIgnore = 1
let NERDTreeMinimalUI = 1
let NERDTreeNatualSort = 1
" let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
map <C-t> :NERDTreeToggle<CR>

" fuzzy search in vim
Plug 'junegunn/fzf'
Plug 'drozdowsky/minimal-fzf.vim'
nnoremap <C-p> :Files<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }
" \b buffer,mark,text switching in vim (needs fzf.vim to work)
"nnoremap <Leader>b :set nomore<Bar>:ls<Bar>:set more<CR>:b<Space>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>m :Marks<CR>
nnoremap <Leader>t :Rg<CR>

" All of your Plugins must be added before the following line
call plug#end()            " required


" ============================================================================
" VIM related
" Color scheme, colors, draw, cursor, windows, folds

"colorscheme wal
set t_Co=256
set lazyredraw
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

" when resizing vim - make windows equal size
autocmd VimResized * wincmd =

" Preserve these settings on colorscheme change
autocmd ColorScheme * highlight BadWhitespace guibg=red ctermbg=darkred
autocmd ColorScheme * highlight SuspiciousComma guibg=red ctermbg=103



" ============================================================================
" Buffers config
" Per filetypes configs

" defaults
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=0
set autoindent
set notitle
set showcmd
set fileformats=unix,dos,mac
set backspace=indent,eol,start
" disable vim comments on new line
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro

" per buffer
au BufRead,BufNewFile *.py,*.pyw,*.vy set expandtab
au BufRead,BufNewFile *.py,*.pyw,*.vy set tabstop=4
au BufRead,BufNewFile *.py,*.pyw,*.vy set softtabstop=4
au BufRead,BufNewFile *.py,*.pyw,*.vy set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw,*.vy set autoindent
au         BufNewFile *.py,*.pyw,*.vy set fileformat=unix
au BufRead,BufNewFile *.py,*.pyw,*.vy let b:comment_leader = '#'

" Delete trailing whitespaces when saving python file
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
au BufWrite           *.py,*.pyw,*.vy,*.js :call DeleteTrailingWS()

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

" yaml
au BufNewFile,BufRead *.yml,*.yaml
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent


" ============================================================================
" VIM related 2
" Fast ESC, search, swaps, show number lines

set timeoutlen=1000
set ttimeoutlen=0
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END

" fzf doesnot use wildignore but .rgignore
set wildignore+=*.pyc,*.swp,*.swo
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
" utf-8
set encoding=utf-8
" bigger history
set history=500

" better vim's builtin autocompletion
set wildmenu
set wildmode=longest:full,full
set ignorecase
set smartcase

" store swaps in ~/.vim/tmp
set directory^=$HOME/.vim/tmp//

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" persistent undo
try
    set undodir=~/.vim/tmp/undodir
    set undofile
catch
endtry


" ============================================================================
" VIM binds
" Custom maps, functions, shortcuts

" Allow saving of files as sudo when I forgot to start vim using sudo. Usage :W
cmap $w w !sudo tee > /dev/null %
" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

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

" switch to previously used buffer with \\ or \' etc.
function! GoToPreviousBuffer()
  let startName = bufname('%')
  let timeout = 100
  while timeout > 0
    exe "normal! \<c-o>"
    let nowName = bufname('%')
    let timeout -= 1
    if nowName != startName
      break
    endif
  endwhile
  if nowName == startName
    echo "No previous file"
  endif
endfunction

function! GoToNextBuffer()
  let startName = bufname('%')
  let timeout = 100
  while timeout > 0
    exe "normal! 1\<c-i>"
    let nowName = bufname('%')
    let timeout -= 1
    if nowName != startName
      break
    endif
  endwhile
  if nowName == startName
    echo "No next file"
  endif
endfunction

function! ExecuteTest()
  execute "normal! ?def test_\<CR>w"
  let l:Command = expand("<cword>")
  execute "!pytest -n0 % -v -s --vcr-record=once -k " . l:Command
endfu


" to switch tabs use gt and gT (vim built-in shortcuts)
nnoremap <Leader>\ :call GoToNextBuffer()<CR>
nnoremap <leader>' :call GoToPreviousBuffer()<CR>
nnoremap <leader>] :call GoToPreviousBuffer()<CR>
nnoremap <leader>1 :call ExecuteTest()<CR>

" enable spell check
set spell

highlight MyHighlightGroup ctermbg=238 guibg=#2d4f67 guifg=#dcd7ba
