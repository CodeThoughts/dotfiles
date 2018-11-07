colorscheme default
set nocompatible
filetype plugin on

" #############################################################################
" ### INSTALL PLUGINS
" #############################################################################

" NOTE: Vundle Plugin followed by configuration for the plugin

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' " plugin manager

"
" EDITOR
"

Plugin 'scrooloose/nerdtree' " left <C-n> tree repo
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinPos = "left"

Plugin 'majutsushi/tagbar' " right <F8> module artifacts observer
map <F8> :TagbarToggle<CR>
Plugin 'lyuts/vim-rtags'

Plugin 'kien/ctrlp.vim' " search files, dirs with <C-p>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Plugin 'Align'

Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1

"
" EDITOR_END
"


"
" CODE
"

Plugin 'tpope/vim-commentary' " gcc

Plugin 'w0rp/ale'
let g:ale_completion_enabled = 1
let g:ale_c_parse_compile_commands = 1
let g:ale_c_build_dir_names = ['build', 'release']

Plugin 'maralla/completor.vim'
let g:completor_clang_binary = '/usr/bin/clang'

Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'

Plugin 'gilligan/vim-lldb' " Debugger

"
" CODE_END
"

"
" GIT
"

Plugin 'airblade/vim-gitgutter' " vim git client
Plugin 'tpope/vim-fugitive' " git perks

"
" GIT_END
"


"
" CPP
"

Plugin 'quark-zju/vim-cpp-auto-include'
Plugin 'bfrg/vim-cpp-modern'
Plugin 'vim-scripts/taglist.vim'

"
" CPP_END
"

call vundle#end()

" #############################################################################
" ### GENERAL SETUP
" #############################################################################

set nocp
syntax on
" keep 50 lines of command line history
set history=100
set ruler
set showcmd
" display incomplete commands
" do incremental searching
set incsearch
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don't use Ex mode, use Q for formatting
set nonumber
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
set binary
set noeol
set secure

set tabstop=2
set shiftwidth=2
set smarttab
set expandtab

set cursorline

set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set colorcolumn=78
" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

set hlsearch

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif



" #############################################################################
" ### KEY BINDINGS
" ############################################################################

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
" Switch between buffers
map <C-Right> :bnext<CR>
map <C-Left> :bprevious<CR>
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

highlight Pmenu ctermbg=gray guibg=gray
highlight PmenuSel ctermbg=gray guibg=gray
highlight PmenuSbar ctermbg=gray guibg=gray
highlight PmenuThumb ctermbg=gray guibg=gray
