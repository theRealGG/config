set nocompatible              " be iMproved, required
filetype off                  " required

set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" intendation
filetype plugin indent on
" number of characters to indent by
set shiftwidth=4
" No. of characters for Tab key
set tabstop=4
" Set Tab character to expand as spaces
set expandtab

" show line numbers
set nu


au BufNewFile,BufRead *.html set filetype=htmldjango
" powerline
" load all additional packages
source $HOME/.config/nvim/packages.vim

" autocompletion and diagonstic setup
source $HOME/.config/nvim/autocomplete.vim

" nerdtree settings
source $HOME/.config/nvim/nerdtree.vim

" fzf finding
source $HOME/.config/nvim/fzf.vim



