" #############################################################################
" ### INSTALL PLUGINS
" #############################################################################

" NOTE: Vundle Plugin followed by configuration for the plugin

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' " plugin manager

Plugin 'dracula/vim' " vim color scheme

Plugin 'scrooloose/nerdtree' " left <C-n> tree repo
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinPos = "left"
" Close when last buffer is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Always start on init
autocmd vimenter * NERDTree
" Go to previous (last accessed) window (so it will not focus on NerdTree).
autocmd VimEnter * wincmd p

Plugin 'majutsushi/tagbar' " right <F8> module artifacts observer
map <F8> :TagbarToggle<CR>

Plugin 'tpope/vim-fugitive' " git perks

Plugin 'kien/ctrlp.vim' " search files, dirs with <C-p>
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

Plugin 'L9' " extra vim functions

Plugin 'SuperTab' " auto complete on tab key

Plugin 'snipMate' " template snippets

Plugin 'airblade/vim-gitgutter' " vim git client

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'scrooloose/syntastic' " syntax checker
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1

Plugin 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" All plugins must be added before the following line
call vundle#end()



" #############################################################################
" ### GENERAL SETUP
" #############################################################################

syntax on
color dracula
set nocompatible
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
set number
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
set binary
set noeol
set secure
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set cursorline
set noswapfile
set noundofile
set nobackup
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
" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
    " Also switch on highlighting the last used search pattern.
    set hlsearch
    " I like highlighting strings inside C comments.
    let c_comment_strings=1
endif
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif
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

