"""
" vim-plug settings
"""
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'dense-analysis/ale'

call plug#end()

set number
syntax enable
inoremap jj <ESC>
nnoremap Y y$
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
set autoread
set showcmd
set virtualedit=onemore
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
set list listchars=tab:>-
set expandtab
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set incsearch 
set modeline
set modelines=5
set undodir=$HOME/.cache/vim/undo
set backupdir=$HOME/.cache/vim/backup

if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
