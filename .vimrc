set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Window switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

Plugin 'tmhedberg/SimpylFold'

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

highlight BadWhitespace guibg=red ctermbg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.vy set expandtab
au BufRead,BufNewFile *.py,*.pyw,*.vy set textwidth=120
au BufRead,BufNewFile *.py,*.pyw,*.vy set tabstop=4
au BufRead,BufNewFile *.py,*.pyw,*.vy set softtabstop=4
au BufRead,BufNewFile *.py,*.pyw,*.vy set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw,*.vy set autoindent
" au BufRead,BufNewFile *.py,*.pyw,*.vy match BadWhitespace /^\t\+/
" au BufRead,BufNewFile *.py,*.pyw,*.vy match BadWhitespace /\s\+$/
au         BufNewFile *.py,*.pyw,*.vy set fileformat=unix
au BufRead,BufNewFile *.py,*.pyw,*.vy let b:comment_leader = '#'
" Delete trailing whitespaces when saving python file
au BufWrite *.py :call DeleteTrailingWS()

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent

" Indent for python - my fork
Plugin 'drozdowsky/indentpython.vim'

"vyper language syntax highlight
Plugin 'jacqueswww/vim-vyper' 

" autocompletion for python 
Plugin 'davidhalter/jedi-vim'
" disable docstring window in jedi-vim when autocompleting
autocmd FileType python setlocal completeopt-=preview
" how to show signature of function 0 - dont show, 1 - show in place (brokes
" vim history (undo))  2 - show in command line (noshowmode must be set)
let g:jedi#show_call_signatures = "2"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 1
set noshowmode

set encoding=utf-8

Plugin 'w0rp/ale'
let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_completion_enabled = 0
let g:ale_echo_msg_format = '%severity%  %s (%code%)' 
let g:ale_lint_on_save = 0
let g:ale_python_pylint_options = "--rcfile ~/.config/.pylintrc"
let g:ale_python_flake8_options = "--config ~/.config/flake8"
"let g:ale_python_prospector_options = "--profile /home/self/.prospector.yaml --pylint-config-file /home/self/.pylintrc"

"Plugin 'vim-syntastic/syntastic'
"let g:syntastic_python_checkers = ['prospector']
"let g:syntastic_python_pylint_args = ['--rcfile=~/.pylint.conf']
"let g:syntastic_python_prospector_args = ['--pylint-config-file=~/.pylint.conf', '--member-warnings']
"let g:syntastic_check_on_wq = 0

syntax on
syntax enable
set t_Co=256
" show line highlight
set cursorline
hi CursorLine   cterm=NONE cterm=bold ctermbg=87 term=bold ctermfg=NONE
:highlight LineNr ctermfg=grey
highlight Comment cterm=bold

colorscheme molokai
Plugin 'dylanaraps/wal.vim'
"colorscheme wal
set background=dark

Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-t> :NERDTreeToggle<CR>


" fuzzy search in vim
Plugin 'kien/ctrlp.vim'
" Git in vim
Plugin 'tpope/vim-fugitive'
" powerline in vim
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" sort imports in vim, requirement: pip install isort
Plugin 'fisadev/vim-isort'

" always show X line at the top/bottom when scrolling
set scrolloff=2
" show line number in current line - otherwise show relative number line
set nu
set relativenumber
" use fast terminal
set ttyfast
set laststatus=2
set clipboard=unnamed
set path+=$PWD/**

set hidden
" Allow saving of files as sudo when I forgot to start vim using sudo. Usage: $w
cmap $w w !sudo tee > /dev/null %

" \b and \f - better buffer switching in vim
nnoremap <Leader>b :set nomore<Bar>:ls<Bar>:set more<CR>:b<Space>
nnoremap <Leader>f :set nomore<Bar>:ls<Bar>:set more<CR>:b<Space>
" \t - tabs 
nnoremap <Leader>t :set nomore<Bar>:tabs<Bar>:set more<CR>:tabn<Space>

" better autocompletion
set wildmenu
set wildmode=longest:full,full
set directory^=$HOME/.vim/tmp//
" CtrlP different mapping fo tabs
let g:ctrlp_prompt_mappings = {
			\ 'AcceptSelection("h")': ['<c-h>', '<c-i>'],
			\ 'AcceptSelection("t")': ['<c-t>'],
			\ 'AcceptSelection("v")': ['<c-v>', '<c-s>'],
			\ }

" Fast ESC in visual/insert mode
set timeoutlen=1000
set ttimeoutlen=0
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END

" provide hl movements in Insert mode via the <Alt> modifier key
"inoremap <Esc>h <C-o>h
"inoremap <Esc>l <C-o>l
"inoremap <Esc>k <C-o>k
"inoremap <Esc>j <C-o>j

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

" color highlight :ColorHighlight/Clear/Toggle
Plugin 'lilydjwg/colorizer'
let g:colorizer_startup = 0
let g:colorizer_nomap = 1
let g:colorizer_fgcontrast = 0

" disable vim comments on new line
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro

" when resizing vim - make windows equal size
autocmd VimResized * wincmd =

" smart tab in vim
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

" Note that this can break python autocompletion - for this we have ctrl + space mapping
inoremap <Tab> <c-r>=Smart_TabComplete()<CR>
