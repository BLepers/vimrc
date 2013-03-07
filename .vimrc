set nocompatible

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

"Make vim file:line work!
Bundle 'bogado/file-line' 

"if( -> adds ) !
Bundle 'Raimondi/delimitMate' 
let delimitMate_expand_cr = 1

"Auto tries to compile files and show errors. Only for gvim because it adds a
"bar on the left that is likely to be a pain in the *** in vim (especially
"when copying)
if has("gui_running")
   let g:syntastic_c_no_default_include_dirs = 0
   let g:syntastic_c_include_dirs = [ '../include', 'include', '../../include', '.' ]
   Bundle 'scrooloose/syntastic'
endif

"A nice autocomplete tools, but it breaks YouCompleteMe.
let g:neocomplcache_enable_at_startup = 1
"Bundle 'Shougo/neocomplcache'

"Ultimate autocomplete stuff
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
Bundle 'Valloric/YouCompleteMe'
let g:ycm_add_preview_to_completeopt = 0
set completeopt=menuone

"Hightligh html tags 
Bundle 'Valloric/MatchTagAlways'

"Autoformat
Bundle "Chiel92/vim-autoformat"
noremap <F7> :Autoformat<CR><CR>


let mapleader = ","
let g:mapleader = ","
source $HOME/.vim/mswin.vim 

"Activation de la coloration et de l'indentation
syn on
set syntax=on
filetype indent on
filetype plugin on

"Afficher les n° de ligne
set nu

"Activer la souris dans vim (dans gvim elle est déjà active)
"set mouse=a

"Afficher les parenthèses correspondantes
set showmatch


"Modifier la police
set guifont=Courier\ New\ 14

"Modifier la taille des tabulations
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab "supprime les tabulations et met des espaces


"Recherche
set incsearch
set ignorecase
set smartcase

"Complétion
set wmnu "affiche le menu
set wildmode=list:longest,list:full "affiche toutes les possibilités
set wildignore=*.o,*.r,*.so,*.sl,*.tar,*.tgz "ignorer certains types de fichiers pour la complétion des includes


"Folding
function! MyFoldFunction()
	let line = getline(v:foldstart)
	let sub = substitute(line,'/\*\|\*/\|^\s+', '', 'g')
	let lines = v:foldend - v:foldstart + 1
	return v:folddashes.sub.'...'.lines.' Lines...'.getline(v:foldend)
endfunction
"set foldmethod=syntax "Réduira automatiquement les fonctions et blocs (#region en C# par exemple)
set foldtext=MyFoldFunction() "on utilise notre fonction (optionnel)


"Afficher la ligne du curseur
set cursorline
:hi CursorLine cterm=bold




imap <C-Space> <C-x><C-o>
iab #i #include

au BufNewFile,BufRead *.tpl :set ft=html " all my .tpl files ARE html

autocmd BufEnter * lcd %:p:h
autocmd BufWritePost *grub !sudo update-grub

set tabpagemax=30

" Tell vim to remember certain things when we exit
"  '100  :  marks will be remembered for up to 100 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='100,\"100,:20,%,n~/.viminfo                                                                                                                                                              
" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au! 
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 | 
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 | 
 \ let b:doopenfold = 2 | 
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END

"set equalprg=astyle\ --align-pointer=name\ --style=java\ --indent=spaces=3\ -w\ -Y\ -p\ -U


set undodir=~/.vim/undodir
set undofile
set undolevels=5000 "maximum number of changes that can be undone
set undoreload=50000 "maximum number lines to save for undo on a buffer reload
set lazyredraw

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

set switchbuf=usetab,newtab
"autocmd BufNewFile,BufRead *.c set formatprg=indent\ -kr\ -ts4
