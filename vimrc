"standard settings
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set nocompatible
set backspace=indent,eol,start
syntax on
set autoread
let g:molokai_original=1
let g:rehash256=1
set background=dark


"showing
set number
set showmatch "comple to brathes
set tabstop=2
set shiftwidth=2
set softtabstop=0
set list
set listchars=tab:->,extends:$,trail:-,eol:$
set ruler
set cursorline
set lazyredraw "dont show doing macro
set cursorline
set scrolloff=10

"format
set autoindent
set smartindent
set formatoptions=c
set smarttab
set nostartofline "temp move match braches

"color
set t_Co=256

"exntends
set clipboard=unnamed

"keyymap"

"keymap-tab-control http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca"
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
