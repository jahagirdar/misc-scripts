set rtp+=~/.vim/bundle/Vundle.vim
filetype off    " required
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'HerringtonDarkholme/yats.vim'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'Shougo/vimproc.vim'
  Plugin 'Quramy/tsuquyomi'
  Plugin 'scrooloose/syntastic'
  Plugin 'bling/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'jason0x43/vim-js-indent'
  Plugin 'vim-scripts/Align'
  Plugin 'vim-perl/vim-perl'
  Plugin 'jahagirdar/Vimplate-Enhanced'
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'
  Plugin 'honza/vim-snippets'
call vundle#end()            " required
filetype plugin indent on    " required
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

set laststatus=2
source $VIMRUNTIME/vimrc_example.vim
au BufRead *.sifz set filetype=zip
augroup sifzgzip
	au BufReadPre     *.sifz setlocal bin
	au BufRead        *.sifz call gzip#read("gzip -dn -S .sifz")
	au BufWritePost   *.sifz call gzip#write("gzip -S .sifz")
	au FileAppendPost *.sifz call gzip#write("gzip -S .sifz")
	au FileAppendPre  *.sifz call gzip#appre("gzip -dn -S .sifz")
	au FileReadPost   *.sifz call gzip#read("gzip -dn -S .sifz")
	au FileReadPre    *.sifz setlocal bin
	au FileWritePost  *.sifz call gzip#write("gzip -S .sifz")
augroup END
nmap bu :buffers<cr>:b
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
set hidden
let Vimplate= "$HOME/.vim/bundle/Vimplate-Enhanced/vimplate.pl"
au BufNewFile *.ts  Vimplate ts 

