set nocompatible
filetype on
set nocp
syntax on
set history=2000
set ruler
set showcmd
set showmatch		" Show matching brackets.
set incsearch
set ttyfast
set gdefault
set encoding=utf-8
setglobal fileencoding=utf-8
set nonumber
set backspace=indent,eol,start
set binary
set noeol
set secure
set background=dark
set laststatus=2

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set undodir=/home/dmitry/.vim/tmp/undo//
set backupdir=/home/dmitry/.vim/tmp/backup//
set directory=/home/dmitry/.vim/tmp/swap//

set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
autocmd FileType text setlocal textwidth=78

if has('mouse')
	set mouse=a
endif

set hlsearch!
nnoremap <F10> :set hlsearch!<CR>

cmap w!! w !sudo tee > /dev/null %

""" Plugin setup

set rtp+=/etc/vim/bundle/Vundle.vim
call vundle#begin('/etc/vim/bundle')

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree' " left <C-n> tree repo
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinPos = "left"

Plugin 'majutsushi/tagbar' " right <F8> module artifacts observer
map <F8> :TagbarToggle<CR>

Plugin 'kien/ctrlp.vim' " search files, dirs with <C-p>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"Plugin 'vim-airline/vim-airline'
"let g:airline#extensions#tabline#enabled = 1
"set laststatus=2 " Always display the statusline in all windows
"set showtabline=2 " Always display the tabline, even if there is only one tab
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

Plugin 'airblade/vim-gitgutter'

"Plugin 'dense-analysis/ale'
"let g:ale_completion_enabled = 1

Plugin 'ycm-core/YouCompleteMe'
map <F12> :YcmCompleter GoToDefinition<CR>
map <c-F> :YcmCompleter Format<CR>

"Plugin 'bfrg/vim-cpp-modern'

Plugin 'ap/vim-css-color'

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()
filetype plugin indent on
