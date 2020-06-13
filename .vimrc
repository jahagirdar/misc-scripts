set rtp+=~/.vim/bundle/Vundle.vim
filetype off    " required
call vundle#begin()
  "Plugin 'lervag/vimtex'
  Plugin 'vim-scripts/LargeFile'
  Plugin 'gmarik/Vundle.vim'
  Plugin 'vim-latex/vim-latex'
  Plugin 'w0rp/ale'
  Plugin 'tpope/vim-fugitive'
  "Plugin 'HerringtonDarkholme/yats.vim'
  "Plugin 'Valloric/YouCompleteMe'
  "Plugin 'Shougo/vimproc.vim'
  "Plugin 'Quramy/tsuquyomi'
  "Plugin 'scrooloose/syntastic'
  Plugin 'bling/vim-airline'
  Plugin 'farseer90718/vim-taskwarrior'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'leafgarland/typescript-vim'
  Plugin 'jason0x43/vim-js-indent'
  Plugin 'vim-scripts/Align'
  Plugin 'vim-perl/vim-perl'
  "Plugin 'jahagirdar/Vimplate-Enhanced'
  "Plugin 'MarcWeber/vim-addon-mw-utils'
  "Plugin 'tomtom/tlib_vim'
  "Plugin 'garbas/vim-snipmate'
  Plugin 'Yggdroot/indentLine'
  Plugin 'honza/vim-snippets'
  Plugin 'sirver/ultisnips'
  Plugin 'vimwiki/vimwiki'
  Plugin 'luochen1990/rainbow'
  Plugin 'ledger/vim-ledger' 
  Plugin 'kalafut/vim-taskjuggler'
  Plugin 'nathangrigg/vim-beancount'
  Plugin 'python-rope/ropevim'
  "Plugin 'bling/vim-bufferline'
"  Bundle 'ervandew/supertab'
call vundle#end()            " required
set t_Co=256
"#set t_AB=^[[48;5;%dm
"#set t_AF=^[[38;5;%dm
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
  nmap <silent> <C-k> <Plug>(ale_previous)
  nmap <silent> <C-j> <Plug>(ale_next)
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
set hidden



" UltiSnips triggering
 let g:UltiSnipsExpandTrigger = '<C-j>'
 let g:UltiSnipsJumpForwardTrigger = '<C-j>'
 let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
 " =============================
 " Set default Templates for new files
 " =============================
let Vimplate= "$HOME/.vim/bundle/Vimplate-Enhanced/vimplate.pl"
au BufNewFile *.ts  Vimplate ts 
au BufNewFile *.pl  Vimplate pl 

let g:ale_linters ={
			\ 'perl':['perl','perlcritic','podchecker'],
			\ 'cpp' :['clang', 'clangcheck', 'clangtidy', 'cppcheck', 'g++'],
			\ 'tjp':['alex', 'languagetool', 'proselint', 'redpen', 'textlint', 'vale', 'writegood'],
			\}
let g:ale_linter_aliases = {
			\ 'tjp': ['tjp', 'text']
			\ }

let g:ale_fixers = {
			\'cpp' : [
			\'clang-format'
			\],
			\'c' : [
			\'clang-format'
			\],
			\'python' : [
			\'autopep8'
			\],
			\'perl':[
			\'perltidy'
			\],
			\'typescript':[
			\'tslint'
			\]
			\}

let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker','perlcritic']

let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2 
highlight default link taskwarrior_tablehead   Tabline
highlight default link taskwarrior_field       IncSearch
highlight default link taskwarrior_selected    Visual
highlight default link taskwarrior_id          VarId
highlight default link taskwarrior_project     String
highlight default link taskwarrior_Status      Include
highlight default link taskwarrior_priority    Class
highlight default link taskwarrior_due         Todo
highlight default link taskwarrior_end         Keyword
highlight default link taskwarrior_description Normal
highlight default link taskwarrior_entry       Special
highlight default link taskwarrior_depends     Todo
highlight default link taskwarrior_tags        Keyword
highlight default link taskwarrior_uuid        VarId
highlight default link taskwarrior_urgency     Todo
"setglobal spell spelllang=en_us

colorscheme elflord

"""""""""
" Vim-Snippets setting.
"""""""""
let g:snips_author = 'Vijayvithal Jahagirdar'
let g:snips_email = 'jvs@dyumnin.com'

"""""""""""""""""
" RAinbow brackets
" """""""""""""""
let g:rainbow_active = 1
	let g:rainbow_conf = {
		\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
		\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
		\	'operators': '_,_',
		\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
		\	'separately': {
		\		'*': {},
		\		'tex': {
		\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
		\		},
		\		'lisp': {
		\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
		\		},
		\		'vim': {
		\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
		\		},
		\		'html': {
		\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
		\		},
		\		'css': 0,
		\	}
		\}

	" VimWiki Cubelink  Flowcommand  Intensivate  Personal
	"
	let g:vimwiki_list = [ 
	 \{'path':'~/vimbook'             , 'syntax':'markdown' , 'ext':'.md', 'path_html': '~/public_html/books'}       , 
	 \{'path':'~/vimwiki/Personal'    , 'syntax':'markdown' , 'ext':'.md', 'path_html': '~/public_html/personal'}    , 
	 \{'path':'~/vimwiki/Dyumnin'  , 'syntax':'markdown' ,    'ext':'.md', 'path_html': '~/public_html/dyumnin'}     , 
	 \{'path':'/prj/dyumnin_projects/websites/edaindia/md/'  , 'syntax':'markdown' ,    'ext':'.md', 'path_html': '~/public_html/edaindia'}     , 
	 \{'path':'/prj/dyumnin_projects/websites/dyumnin/md/'  , 'syntax':'markdown' ,    'ext':'.md', 'path_html': '~/public_html/dyumnin'}     , 
	 \{'path':'~/vimwiki/Cubelink'    , 'syntax':'markdown' , 'ext':'.md', 'path_html': '~/public_html/cubelink'}    , 
	 \{'path':'~/vimwiki/Intensivate' , 'syntax':'markdown' , 'ext':'.md', 'path_html': '~/public_html/intensivate'} , 
	 \{'path':'~/vimwiki/Flowcommand' , 'syntax':'markdown' , 'ext':'.md', 'path_html': '~/public_html/flowcommand'}
	 \]
	let custom_wiki2html = '~/scripts/misaka_md2html.py'


	"Setup vim Ledger
 au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger
augroup filetypedetect
au BufNewFile,BufRead *.tjp,*.tji               setf tjp
augroup end
" Using a different diff program
set diffexpr=DiffW()
function DiffW()
  let opt = ""
   if &diffopt =~ "icase"
     let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
     let opt = opt . "-w " " swapped vim's -b with -w
   endif
   silent execute "!diff -a --binary " . opt .
     \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
endfunction
map ,af :ALEFix<CR>
set mouse=
