" Enable mouse usage
set mouse=a

" Turn on line numbers
set number

" Map ; -> : for easy commands
nmap ; :
noremap ;; ;

" Map Ctrl-C, Ctrl-C to quit
nmap <C-C><C-C> :q!

" Map w, w -> force write
nmap ww :w!

" Map Ctrl-W, Ctrl-W -> force write and quit
nmap <C-W><C-W> :wq!

" Map M -> make
nmap mm :make

" In normal mode, map jj -> jump to previous window
nmap jj <C-W><C-P>
nmap <Tab> <C-W><C-P>

" :read to paste file into another file

" In normal mode, map Ctrl-F -> find
nmap <C-F> :%s/find/replace/gc

" Map R -> run sh command on current line
noremap R !!sh<CR>

" Use ctags
autocmd BufWritePost *
      \ if filereadable('tags') |
      \   call system('ctags -a '.expand('%')) |
      \ endif

" Use cscope
if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

set tags=tags

" Enable filename completion in : mode
set path+=**
set wildmenu

" Enable syntax highlighting
syntax on

" Make vim splitting behavior more natural
set splitbelow
set splitright

" Use CapsLock as Esc inside vim
" au VimEnter * :silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
" au VimLeave * :silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock
