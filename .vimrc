set nocompatible

au BufNewFile,BufRead *.txt :set ft=c " all my .txt files are c

filetype off                   " required!

call plug#begin()
Plug 'rightson/vim-p4-syntax'
call plug#end()

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Make vim file:line work!
Bundle 'bogado/file-line' 

"Auto tries to compile files and show errors. Only for gvim because it adds a
"bar on the left that is likely to be a pain in the *** in vim (especially
"when copying code)
if has("gui_running")
   let g:syntastic_check_on_open=1
   let g:syntastic_c_no_default_include_dirs = 0
   let g:syntastic_c_include_dirs = [ '../include', 'include', '../../include', '.' ]
   let g:syntastic_cpp_compiler = 'g++'
   let g:syntastic_cpp_compiler_options = ' -std=c++0x'
   Bundle 'scrooloose/syntastic'
endif

let mapleader = ","
let g:mapleader = ","
source $HOME/.vim/mswin.vim 

"Activation de la coloration et de l'indentation
syn on
set syntax=on
filetype indent on
filetype plugin on
au BufNewFile,BufRead *.txt :set ft=c " all my .txt files are c

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
"set softtabstop=3
"set expandtab

"Recherche
set incsearch
set ignorecase
set smartcase

"Complétion
set wmnu "affiche le menu
set wildmode=list:longest,list:full "affiche toutes les possibilités
set wildignore=*.o,*.r,*.so,*.sl,*.tar,*.tgz "ignorer certains types de fichiers pour la complétion des includes

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

set switchbuf=usetab,newtab

function! InsertCloseTag()
  " inserts the appropriate closing HTML tag
  " may require ignorecase to be set, or to type HTML tags in exactly the same case
  if &filetype == 'html' || &filetype=='php' || &filetype=='xml'
  
    " list of tags which shouldn't be closed:
    let UnaryTags = ' Area Base Br br BR DD dd Dd DT dt Dt HR hr Hr Img img IMG input INPUT Input link LINK Link meta Meta p P Param param PARAM '

    " remember current position:
    normal mz
    normal mw

    " loop backwards looking for tags:
    let Found = 0
   let NBL = 0
    while Found == 0
       let NBL = NBL+1
       if NBL == 50
          break
      endif

      " find the previous <, then go forwards one character and grab the first
      " character plus the entire word:
      execute "normal ?\<LT>\<CR>l"
      normal "zyl
      let Tag = expand('<cword>')

      " if this is a closing tag, skip back to its matching opening tag:
      if @z == '/'
        execute "normal ?\<LT>" . Tag . "\<CR>"

      " if this is a unary tag, then position the cursor for the next
      " iteration:
      elseif match(UnaryTags, ' ' . Tag . ' ') > 0
        normal h

      " otherwise this is the tag that needs closing:
      else
        let Found = 1

      endif
    endwhile " not yet found match

    " create the closing tag and insert it:
    let @z = '</' . Tag . '>'
    normal `z"zp
   normal `w
   execute "normal />\<cr>"
  else " filetype is not HTML
   normal mw
    let @z = '</'
    normal "zp`wll
  endif " check on filetype
endfunction " InsertCloseTag()
imap <lt>/ <Esc>:call InsertCloseTag()<CR>a


let g:autosave_time = 1
function! UpdateFile()
  if((localtime() - b:save_time) >= g:autosave_time)
      update
      let b:save_time = localtime()
  else
      " just debugging info
      echo "[+] ". (localtime() - b:save_time) ." seconds have elapsed so far."
  endif
endfunction
au BufWritePre * let b:save_time = localtime()

autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e
