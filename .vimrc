set nocompatible

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

"Make vim file:line work!
Bundle 'bogado/file-line' 

"if( -> adds ) !
"Do not auto create {} because it breaks astyle autoformating
let delimitMate_expand_cr = 0
let delimitMate_matchpairs = "(:),[:],<:>"
Bundle 'Raimondi/delimitMate' 

"Simple autocomplete that does its job.
"Bundle 'vim-scripts/AutoComplPop'

"A nice autocomplete tools that tries to be a little more intelligent that CTRL+P and works quite well
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_cursor_hold_i = 1
let g:neocomplcache_enable_insert_char_pre = 1
Bundle 'Shougo/neocomplcache'

"Ultimate autocomplete stuff that tries to be too intelligent and sucks at it
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_add_preview_to_completeopt = 0
"set completeopt=menuone
"Bundle 'Valloric/YouCompleteMe'

"Hightligh html tags 
Bundle 'Valloric/MatchTagAlways'

"Autoformat when hitting <F7> 
Bundle "Chiel92/vim-autoformat"
noremap <F7> :Autoformat<CR><CR>

"Auto tries to compile files and show errors. Only for gvim because it adds a
"bar on the left that is likely to be a pain in the *** in vim (especially
"when copying code)
if has("gui_running")
   let g:syntastic_check_on_open=1
   let g:syntastic_c_no_default_include_dirs = 0
   let g:syntastic_c_include_dirs = [ '../include', 'include', '../../include', '.' ]
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

function! InsertCloseTag()
  " inserts the appropriate closing HTML tag
  " may require ignorecase to be set, or to type HTML tags in exactly the same case
  if &filetype == 'html' || &filetype=='php' || &filetype=='xml'
  
    " list of tags which shouldn't be closed:
    let UnaryTags = ' Area Base Br br BR DD dd Dd DT dt Dt HR hr Hr Img img IMG input INPUT Input li Li LI link LINK Link meta Meta p P Param param PARAM '

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


function! AutoFormatC2()
  let a = line('.')
  let content = getline('.')
  let save_cursor = col(".")

  if &filetype == 'c' || &filetype=='cpp'
     if(content =~ '}')
        if(len(content) == save_cursor)
           startinsert!
        else
           normal l
           startinsert
        endif
     elseif(len(content) != save_cursor)
        normal l
        startinsert
     else
        execute a.','.a."!astyle --align-pointer=name --style=java --indent=spaces=3 -w -Y -p -U"
        normal ==
        startinsert!
     endif
  else
     if(len(content) == save_cursor)
        startinsert!
     else
        normal l
        startinsert
     endif
  endif
endfunction
inoremap <expr> <cr> pumvisible() ?"\<C-y>" : "\<Esc>:call AutoFormatC2()\<CR>\<CR>"

function! AutoFormatC()
  if &filetype == 'c' || &filetype=='cpp'
     normal mwk
     let a = line('.')
     let content = getline('.')
     execute a.','.a."!astyle --align-pointer=name --style=java --indent=spaces=3 -w -Y -p -U"
     normal ==`wl
  endif
  normal ia
  normal ==
  normal x
  call feedkeys('a', 'n')
endfunction
"inoremap <cr> <CR><Esc>:call AutoFormatC()<CR>

"set equalprg=astyle\ --align-pointer=name\ --style=java\ --indent=spaces=3\ -w\ -Y\ -p\ -U
"vnoremap = <Esc>`<dwgv=`<<C-Q>`>I<C-r>"<Esc>
