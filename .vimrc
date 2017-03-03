"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

if has('nvim')
 let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
 let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
 nmap <BS> <C-W>h
else
 map <C-H> <C-W><C-H>
endif

" Required:
set runtimepath^=/Users/biboneup/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/Users/biboneup/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'mileszs/ack.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'wesQ3/vim-windowswap'

" Ctrl P
NeoBundle 'ctrlpvim/ctrlp.vim'

let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_extensions = ['tag', 'buffertag', 'line', 'funky']
let g:ctrlp_custom_ignore = {
     \ 'dir': 'node_modules\|DS_Store\|git',
     \ 'file': '\v\.(exe|so|dll|cs|pdb|csproj|xml)$' 
     \ }

" End Ctrl P

NeoBundle 'ternjs/tern_for_vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'crusoexia/vim-monokai'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'dkprice/vim-easygrep'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'christoomey/vim-tmux-navigator'
" Begin NerdCommenter
NeoBundle 'scrooloose/nerdcommenter'

let NERDSpaceDelims=1

" End NerdCommenter
" Begin Airline
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

let g:airline_powerline_fonts = 1
let g:airline_theme = 'simple'
" End Airline

NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'groenewege/vim-less'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'mtscout6/syntastic-local-eslint.vim'
NeoBundle 'editorconfig/editorconfig-vim'
" YCM begin
NeoBundle 'Valloric/YouCompleteMe', {
      \ 'build' : {
      \     'mac': './install.py --tern-completer'
      \   },
      \ }

set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" YCM end
NeoBundleLazy 'alvan/vim-closetag', {
  \   'autoload': {
  \     'filetypes': [
  \        'html',
  \        'xml',
  \        'javascript'
  \      ]
  \   }
  \ }

" fonts
NeoBundle 'powerline/fonts', {
      \ 'build' : {
      \     'mac': './install.sh'
      \   },
      \ }

" fonts end

" " You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5'  }

NeoBundle 'vim-scripts/nerdtree-ack'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------"

let g:closetag_filenames = "*.html, *.js"

set nocompatible        " vim > vi mode.
let mapleader = ","    " change <leader> from \ to ,

" Cursor fix
if has('gui_running')
    set guioptions+=t
    set guioptions-=T
    set transparency=2
else
    if exists('$TMUX')
      let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
      let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
      let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
      let &t_SI = "\<Esc>]50;CursorShape=1\x7"
      let &t_SR = "\<Esc>]50;CursorShape=2\x7"
      let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
endif


" Ctrl P Ignore
"set wildmode=list:longest,full
"set wildignore+=*.o,*.obj,.git,*.pyc.
"set wildignore+=*/.git/*

" Windows General
set wildignore+=.git\*,.sass-cache\\*,*.orig,*.cache,*.nupkg,*.exe

"
" Syntastic
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"


let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir='~/.vim/snippets'

map <leader>esd :let g:syntastic_debug = 1<CR>
map <leader>esp :let g:syntastic_debug = 0<CR>

filetype off

" ,v brings up .vimrc (thanks, sontek)
map <leader>v :sp ~/.vimrc<CR><C-W>

" ,V reloads it (as long as you remember to save it first)
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

set t_Co=256 " For 256 color mode support
colorscheme monokai

"
" Moving around / editing
"
set nostartofline      " Avoid moving cursor to BOL when moving
set scrolloff=5        " Keep 5 lines (top/bottom) for scope
set backspace=2        " makes backspace work normally
set showmatch          " Show matched paren when balanced
set matchtime=2        " for .2 seconds
set linebreak          " Don't wrap text in the middle of a word
set mouse=a            " Always enable mouse
if !has('nvim')
  set ttymouse=xterm2
endif
set clipboard+=unnamed  " Makes using clipboard easier

"
" Windowing
"
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" and lets make these all work in insert mode too ( <C-O> makes next cmd
" happen as if in command mode )
imap <C-W> <C-O><C-W>

" Window resizing made easy
map <A-k> <C-w>+
map <A-j> <C-w>-
map <A-l> <C-w>>
map <A-h> <C-w><
"
" Tabs
"
map th :tabfirst<CR>
map tk :tabnext<CR>
map tj :tabprev<CR>
map tl :tablast<CR>
map tt :tabedit<Space>
map tn :tabnext<Space>
map tm :tabm<Space>
map <silent><C-N> :tabn<CR>
map <silent><C-P> :tabp<CR>

"
" Search / Replace
"
set incsearch          " Show best match while typing a search
set ignorecase          " Case insensitive search
set smartcase          " Unless uppercase used in search expr.
set gdefault            " Default to /g global replace
set hlsearch            " Highlight searches and search results
set fen                 " Folding enabled
set fdc=4               " Fold gutter size
set fdm=manual          " Fold Method

" clear highlighted search using the space bar
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"
" Display
"
set guifont=DejaVu_Sans_Mono:h10:cANSI
if has("gui_gtk2")
  set guifont=Ubuntu\ Mono\ 11,Anonymous\ Pro\ 11,DejaVu\ Sans\ Mono\ 11
elseif has("gui_win32")
  set guifont=Ubuntu\ Mono:h11,Anonymous\ Pro:h11,DejaVu\ Sans\ Mono:h11,Consolas:h11
endif

set number              " Show line numbers
set numberwidth=1      " Try to use only 1 col when possible
"set textwidth=110      " Sets the max width text can be before vim inserts a linebreak
" Highlights text after going over the max text width
set nowrap  " Line wrapping off
set guioptions+=c      " Use console dialogs instead of popup dialogs for simple choices
set guioptions-=T      " Remove toolbar
set guioptions-=r      " Remove right-hand scroll bar
set guioptions-=m      " Removes the menu
set cursorline

map <c-f> :call JsBeautify()<cr>

"
" Messages, Info, & Status
"
set vb t_vb=            " No bells. Period.
set novisualbell        " No blinking
set noerrorbells        " No noise
set cmdheight=2        " Cmd bar 2 rows high
set showcmd            " Show partial command in the last line of the screen
set report=0            " : commands always print changed line count
set shortmess+=a        " Use [+]/[RO]/[w] for modified/readonly/written
set laststatus=2        " Always show the status line
set ruler              " Display position in the file

"
" Tabs / indentation
"
set smartindent
set tabstop=2          " Use 2 spaces for <tab>
set shiftwidth=2        " Indent level is 2 spaces wide
set softtabstop=2      " <BS> over an autoindent deletes shiftwidth worth of spaces
set smarttab            " Insert blanks properly at beginning of a line
set autoindent          " Copy indent from current line when starting a new line
set expandtab          " Use spaces not tabs
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set list

" Some file type really do require explicit tabs
autocmd FileType make      set noexpandtab

"
" Reading/Writing
"
set noautowrite        " Never write a file unless requested to
set noautowriteall      " Seriously.
set modeline            " Let vim options be embedded in files;
set modelines=5        " when in first or last 5 lines
set ffs=unix,dos,mac    " Try and recognize line endings in that order

"
" Backup / Swap files
"
set noswapfile

"
" Command Line
"
set history=1000        " Remember a long command history
set wildmenu            " Menu completion in command mode on <Tab>
" First list the available options and complete the longest common part, then have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full
set wildignore+=*.o,*.obj,.git,*.pyc.

" Linux / Mac
set wildignore+=*/.git/*

" Windows
set wildignore+=.git\*,Build\*,.sass-cache\*

"
" Per-Filetype Scripts
"
filetype on            " File type detection on
filetype indent on      " Use filetype-specific indenting when available
filetype plugin on      " Load filetype plugins
syntax on              " Enable per-filetype syntax highlighting


"
" Key Mappings
"
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<cr><space>

" set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Paste from clipboard
map <leader>p "+gP

" Remove trailing whitespace
map <leader>e :%s/\s\+$//<CR>:let @/=''<CR>

" Toggle tasklist
map <leader>td <Plug>TaskList

"
" Abbrevs
"
iab xdate <c-r>=strftime("%m/%d/%y %H:%M:%S")<cr>
iab xday <c-r>=strftime("%m/%d/%y")<cr>
iab xtime <c-r>=strftime("%H:%M:%S")<cr>
iab xname Sam Merrell

" execute selected script
"map <C-h> :py EvaluateCurrentRange()<CR>

" NERD Tree Settings
map <F4> :NERDTreeFind<CR>
map <TAB> :NERDTreeToggle<CR>

let Tlist_GainFocus_On_ToggleOpen=1
let NERDTreeQuitOnOpen=1

if ('has_guirunning')
  highlight OverLength ctermbg=DarkBlue ctermfg=white guibg=#592929  
  match OverLength /\%111v.\+/
endif

"
" Filetype Maps
"
autocmd BufRead *.spark set filetype=html
autocmd BufRead *.rst set tw=80
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType spark set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType scss set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

"
" Python tweaks (from Sontek - http://github.com/sontek/dotfiles)
"

" 80 column rst format
autocmd BufRead *.rst set tw=80

" treat html files as django templates
autocmd BufRead *.html set filetype=htmldjango

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
if has("python")
python << EOF
import os
import sys
import vim
# lets us use 'gf' to go to files imported
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))

# lets us execute the highlighted portion of the script
def EvaluateCurrentRange():
  eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOF
endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('less', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" test highlight just the glyph (icons) in nerdtree:
autocmd filetype nerdtree highlight haskell_icon ctermbg=none ctermfg=Red guifg=#ffa500
autocmd filetype nerdtree highlight html_icon ctermbg=none ctermfg=Red guifg=#ffa500
autocmd filetype nerdtree highlight go_icon ctermbg=none ctermfg=Red guifg=#ffa500

autocmd filetype nerdtree syn match haskell_icon ## containedin=NERDTreeFile
" if you are using another syn highlight for a given line (e.g.
" NERDTreeHighlightFile) need to give that name in the 'containedin' for this
" other highlight to work with it
autocmd filetype nerdtree syn match html_icon ## containedin=NERDTreeFile,html
autocmd filetype nerdtree syn match go_icon ## containedin=NERDTreeFile

let javascript_enable_domhtmlcss=1
