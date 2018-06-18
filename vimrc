"VIMRC holalluis
"useful bash alias: vimrc='vim ~/vimrc/vimrc'

"edit ~/vimrc/vimrc with ':Vimrc'
:command Vimrc edit ~/vimrc/vimrc

syntax on
set nocompatible

"PLUGINS:
"execute pathogen#infect()
"desactivar auto comentaris
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"INTERMINTENTS: (estan al principi per evitar reactivar-los)
"nnoremap <C-e> :e#<CR>
"set autochdir               "canviar pwd automaticament
"set foldcolumn=1            "valors: 0 a 12, informacio lateral sobre folds
"set foldmethod=manual       "manera de plegar text
"set nofoldenable            "inicialment folds oberts
"set hidden                  "navega per finestres sense haver de guardar canvis (no m'agrada)
"set cursorline              "ilumina linia del cursor
"set cursorcolumn            "ilumina columna del cursor
"let g:netrw_browse_split=4  "open in prior window
"let g:netrw_altv=1          "open splits to the right
set scrolloff=1              "minimal number of screen lines to keep above and below the cursor
set nolist                   "see invisible characters
set listchars=eol:$          "makes 'set list' look prettier
set noruler                  "show position always
set norelativenumber         "relative number for line number
set nohlsearch               "highlight search
set noincsearch              "incremental search
set laststatus=2             "veure titol finestra (2=sempre, 1=només si n'hi ha més d'una oberta)
"set mouse=a                 "move between windows with the mouse
"autocmd bufwritepost vimrc source $MYVIMRC "auto reload vimrc (no funciona)
"--------------------------------------------------------------

"PERMANENTS:

"SYNTAX:
"colorscheme default
"troba trailing whitespaces
match ErrorMsg '\s\+$'
"underline urls, extret de https://gist.github.com/tobym/584909
highlight Url_underline term=underline cterm=underline ctermbg=black
match     Url_underline 'https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*'

"MISC:
set clipboard=unnamed           "system clipboard
set history=200                 "history of ':' commands, and history of previous search patterns
set nowrap                      "les linies que surten de la pantalla no es veuen
set number                      "show line number
set showcmd                     "mostra quina comanda estas escribint a baix a la dreta
set tags=tags                   "ctags (veure man ctags)
set backspace=indent,start,eol  "proper backspace
set modelines=5                 "modeline/modelines (:help modeline)
set nrformats=bin,hex           "C-a suma decimals i hexadecimals correctament
"prova: 0b10000 54 0x47

"INDENTING AND FOLDING:
set autoindent
set foldmethod=indent   "manera de plegar text
set foldlevel=10        "inicialment folds oberts

"TABS:
set expandtab    "insert spaces instead of tab
set tabstop=2    "width of tab character
set shiftwidth=2 "number of space character to use for indent
set shiftround   "use multiple of shiftwidth when indenting with '<' and '>'
set foldignore=  "ignora caràcter '#' per folding, plega'l correctament (útil per CSS)

"FINDING FILES:
set path+=** "(** searches subdirectories)
set wildmenu "display all matching files in tab complete

"FILE BROWSING:
let g:netrw_banner=0    "disable annoying banner
let g:netrw_liststyle=3 "tree view

"MAPS:
"següent pestanya
nmap , :tabnext<cr>
"reset syntax colors
nmap <f10> :syntax sync fromstart<CR>
"obrir tag (ctags) o link a help (~"go to definition" visual studio style)
nmap <f12> <C-]>
"back from a jump
nmap <f11> <C-T>
"escape rapid a normal mode
inoremap kj <Esc>
"moure's per finestres amb <espai>
nmap <space> <C-w>w
"paste amb autoindent
map p ]p
"moure's sense tenir en compte el line wrapping
nnoremap j gj
nnoremap k gk

"remember last position opening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"BUSCAR I CENTRAR: problema: els warnings de 'eof reached' no apareixen
"nnoremap N Nzz
"nnoremap n nzz
"nnoremap * *zz
"nnoremap # #zz

"EVITAR ERRORS: "desactivat perquè anula poder escriure Q mentre busques
"cmap Wq wq
"cmap WQ wq
"cmap Q q

"syntax crontabs
autocmd filetype crontab setlocal nobackup nowritebackup

