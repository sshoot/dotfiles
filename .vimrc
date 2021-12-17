"
" minpack settings
"
if &compatible
    set nocompatible
endif

function! PackInit() abort
    packadd minpac

    call minpac#init()
    
    call minpac#add('preservim/nerdtree')
    call minpac#add('dense-analysis/ale')
    call minpac#add('prabirshrestha/vim-lsp')
    call minpac#add('mattn/vim-lsp-settings')
    call minpac#add('vim-denops/denops.vim', {'type': 'opt'})
    call minpac#add('Shougo/ddc.vim', {'type': 'opt'})
    call minpac#add('Shougo/ddc-matcher_head', {'type': 'opt'})
    call minpac#add('shun/ddc-vim-lsp')
endfunction

command! PackUpdate call PackInit() | call minpac#update()
command! PackClean call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

"
" End minpack settings
"

"
" ddc settings
"
packadd denops.vim
packadd ddc.vim
packadd ddc-matcher_head

call ddc#custom#patch_global('sources', ['vim-lsp'])
call ddc#custom#patch_global('sourceOptions', {
                \ 'vim-lsp': {
                \ 'matchers': ['matcher_head'],
                \ 'mark': 'lsp',
                \ },
                \ })
call ddc#enable()

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
set wrapscan
set undodir=D:expand('$HOME/.cache/vim/undo')

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
