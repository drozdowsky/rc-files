set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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

highlight BadWhitespace guibg=red ctermbg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.vy set expandtab
au BufRead,BufNewFile *.py,*.pyw,*.vy set textwidth=139
au BufRead,BufNewFile *.py,*.pyw,*.vy set tabstop=4
au BufRead,BufNewFile *.py,*.pyw,*.vy set softtabstop=4
au BufRead,BufNewFile *.py,*.pyw,*.vy set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw,*.vy set autoindent
au BufRead,BufNewFile *.py,*.pyw,*.vy match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw,*.vy match BadWhitespace /\s\+$/
au         BufNewFile *.py,*.pyw,*.vy set fileformat=unix
au BufRead,BufNewFile *.py,*.pyw,*.vy let b:comment_leader = '#'

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

Plugin 'vim-scripts/indentpython.vim'


set encoding=utf-8
Bundle 'Valloric/YouCompleteMe'

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
let python_highlight_all=1
syntax on

Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

set background=dark

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-t> :NERDTreeToggle<CR>


Plugin 'kien/ctrlp.vim'
set nu

Plugin 'tpope/vim-fugitive'

Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set laststatus=2
:highlight LineNr ctermfg=yellow
set clipboard=unnamed
set cursorline
hi CursorLine   cterm=NONE cterm=bold ctermbg=8 term=bold ctermfg=NONE
:highlight LineNr ctermfg=grey
set path=$PWD/**


colorscheme molokai
highlight Comment cterm=bold
set hidden
