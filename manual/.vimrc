set confirm 

" work has following symbol do not split
set iskeyword+=_,$,@,%,#,-

"Tlist and wm setting
set fileformat=unix
set tags=tags
set showcmd
set autoread
set wrap
set cc=80

" For vundle

set nocompatible 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'bash-support.vim'
Bundle 'perl-support.vim'
Bundle 'ctrlp.vim'
Bundle 'Tagbar'
Bundle 'CCTree'
nmap <F8> :TagbarToggle<CR>
" Bundle 'L9'
" Bundle 'winmanager'
" Bundle 'c.vim'
" Bundle 'cscope_win'
" Bundle 'cscope-quickfix'
filetype plugin indent on "

set runtimepath^=~/.vim/bundle/ag
" ctrlp settings
let g:ctrlp_max_files = 0
let g:ctrlp_max_height = 20
" end of vundle
" tagbar setting
let g:tagbar_sort = 0
" close quickfix window
nmap <F6> :cclose<CR><CR>
" close quickfix window
nmap <F7> :copen<CR><CR>
" open Most recently used files
nmap <F5> :CtrlPMRUFiles<CR>
" Bundle 'L9'

set number
" config pragramer and clore scheme
syntax on
filetype plugin on
set filetype=c
" setting color
" colorscheme desert
colorscheme darkblue

" if has('mouse')
"  set mouse=a
" endif

" remereber last edit postion
autocmd BufReadPost *  if line("'\"")>0&&line("'\"")<=line("$") | exe "normal g'\"" | endif

set cindent
function! GnuIndent()
  setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
  setlocal shiftwidth=2
  setlocal tabstop=8
endfunction

au FileType c,cpp setlocal cinoptions=:0,g0,(0,w1 shiftwidth=4 tabstop=4 softtabstop=4
au FileType diff  setlocal shiftwidth=4 tabstop=4
au FileType html  setlocal autoindent indentexpr=
au FileType changelog setlocal textwidth=76


" if &term=="xterm-color"
  set t_Co=8
  set t_Sb=^[[4%dm
  set t_Sf=^[[3%dm
"set shiftwidth=2
"set tabstop=4
"set softtabstop=4
"set expandtab
"show special sytax
set ambiwidth=double
set autoread                
"set tags=tags;

"No bell settings {{{
set noerrorbells
set visualbell
if has('autocmd')
  autocmd GUIEnter * set vb t_vb=
endif
"No bell settings End }}}


set ruler
"set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)


set shortmess=atI

set nolinebreak             


set showcmd
set wrap                    
"CmdLine settings {{{
set cmdheight=1             
set laststatus=2            
set statusline=%f\ [%04v]\ [LEN=%L]
"

":highlight OverLength ctermbg=red ctermfg=white guibg=grey guifg=white
":match OverLength '\%101v.*'
" display xia hua xian
set cursorline

" highlight StatusLine guifg=SlateBlue guibg=Yello
highlight StatusLineNC guifg=Gray guibg=Blue
highlight Search term=reverse ctermfg=White  ctermbg=Yellow


set showmatch


set nobackup
set nowritebackup


set backspace=indent,eol,start


set nocp

set wildmenu


set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set enc=utf-8
let &termencoding=&encoding

set langmenu=none

set ai

set ic
" highlght search
set hls

set novisualbell


"set foldmethod=syntax
"set foldcolumn=3
"set foldclose=all

"set foldenable
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>



if version >= 603
  set helplang=cn
  set encoding=utf-8
endif




" highlight CursorLine  cterm=none ctermbg=black ctermfg=yellow guibg=none ctermbg=lightred
"highlight CursorColumn  cterm=none ctermbg=black ctermfg=yellow guibg=none ctermbg=lightred

"let OmniCpp_DefaultNamespaces = ["std"]
"let OmniCpp_GlobalScopeSearch = 1  " 0 or 1
"let OmniCpp_NamespaceSearch = 1   " 0 ,  1 or 2
"let OmniCpp_DisplayMode = 1
"let OmniCpp_ShowScopeInAbbr = 0
"let OmniCpp_ShowPrototypeInAbbr = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"let OmniCpp_MayCompleteScope = 1
highlight Pmenu ctermbg=13 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black


if getfsize(".vimscript")>0
  source .vimscript
endif

"rails.vim
runtime! macros/matchit.vim
augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END


set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

"cscope
if has("cscope")
  set cscopequickfix=s-,c-,d-,i-,t-,e-
  set csprg=/usr/bin/cscope
  set csto=0
  set nocst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
    " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
endif
"set cspc=0
map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>:cw<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>:cw<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>:cw<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>:cw<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:cw<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:cw<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>:cw<CR><CR>

" Using 'CTRL-spacebar' then a search type makes the vim window
" split horizontally, with search result displayed in
" the new window.

nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

" Hitting CTRL-space *twice* before the search type does a vertical
" split instead of a horizontal one

nmap <C-Space><C-Space>s
      \:vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>g
      \:vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>c
      \:vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>t
      \:vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>e
      \:vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>i
      \:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space><C-Space>d
      \:vert scs find d <C-R>=expand("<cword>")<CR><CR>
 
"runtime ftplugin/man.vim
let Vimplate = "$HOME/bin/vimplate"
fun! ReadMan()
  " Assign current word under cursor to a script variable:
  let s:man_word = expand('<cword>')

  " Open a new window:
  :exe ":wincmd n"

  " Read in the manpage for man_word (col -b is for formatting):
  :exe ":r!man " . s:man_word . " | col -b"

  " Goto first line...
  :exe ":goto"

  " and delete it:
  :exe ":delete"
endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

:map <F2> gg:read !date<CR>

" bind :CD to :cd %:h, then change cwd to the dir that includes current file
sil! com -nargs=0 CD exe 'cd %:h'


set encoding=utf-8
function! SetFileEncodings(encodings)
  let b:myfileencodingsbak=&fileencodings
  let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
  let &fileencodings=b:myfileencodingsbak
  unlet b:myfileencodingsbak
endfunction

au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()


"au BufRead,BufNewFile *  setfiletype txt

" Map the M key to the ReadMan function:
map M :call ReadMan()<CR>

"csupport
let g:alternateNoDefaultAlternate = 1

"a.vim
nnoremap <silent> <F12> :A<CR>

"let g:NERDTree_title="[NERDTree]"
""let g:winManagerWindowLayout='FileExplorer|taglist'
"let g:acp_behaviorSnipmateLength=1
"let g:winManagerWindowLayout = "FileExplorer|TagList|BufExplorer"
"function! NERDTree_Start()
"	exec 'NERDTree'
"endfunction
"function! NERDTree_IsValid()
"	return 1
"endfunction
"nmap wm :WMToggle<cr>
"
"map <leader><leader> \be
"map <F6> :BufExplorer

map C-Enter C-Tab

set cscopequickfix=s-,c-,d-,i-,t-,e-
" nnoremap <silent> <F3> :Grep<CR>


function ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf

" mapping

inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"

inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>"a

inoremap <expr> <cr>       pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr> <c-n>      pumvisible() ? "\<c-n>" : "\<c-n>\<c-r>=pumvisible() ? \"\\<down>\" : \"\\<cr>\""
inoremap <expr> <m-;>      pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>\<c-n>\<c-p>\<c-r>=pumvisible() ? \"\\<down>\" : \"\\<cr>\""



:vnoremap <silent> ,/ y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
:vnoremap <silent> ,? y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
:vnoremap <silent> ,? y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>



:runtime! ftplugin/man.vim
set keywordprg=dicty
" endif
set incsearch
set so=40
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1
map <C-n> :NERDTreeToggle<CR>

