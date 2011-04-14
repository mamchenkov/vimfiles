set encoding=utf-8
set nocp

if version >= 600
	filetype plugin indent on
endif

let Tlist_Sort_Type = 'name'

" GUI options {{{
set guifont=Console
set guioptions-=m " No menu
set guioptions-=T " No toolbar
set guioptions+=c " Use console dialogs where possible
" }}}
" Carantine {{{
"“Insert <Tab> or complete identifier
"“if the cursor is after a keyword character
function MyTabOrComplete()
	let col = col('.')-1
	if !col || getline('.')[col-1] !~ '\k'
		return "\<tab>"
	else
		return "\<C-N>"
	endif
endfunction
inoremap <Tab> <C-R>=MyTabOrComplete()<CR>

" let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags=1
let php_baselib=1
let php_smart_members=1
let php_alt_properties=1
let php_short_tags=0
" let php_folding=1

noremap <silent> <F11> :cal VimCommanderToggle()<CR> 

" Set default SQL dialect to MySQL
let g:sql_type_default = 'mysql'

" PHP stuff
autocmd BufNewFile,BufRead *.php,*.thtml,*.ctp set ft=php
autocmd BufNewFile,BufRead *.php,*.thtml,*.ctp set makeprg=php\ -l\ %
autocmd BufNewFile,BufRead *.php,*.thtml,*.ctp set errorformat=%m\ in\ %f\ on\ line\ %l

" }}}
" F-keys {{{
"
" Find occurances of the word under the cursor, ask for match choice, and jump
map <F3> [I:let nr=input("Jump to where: ")<Bar>exe "normal " . nr . "[\t"<CR>
" Quit without saving
map <F4> :q<CR>
" Quit with saving
map <F10> :wq<CR>
" }}}
" Tabulation {{{
set wildchar=<tab>	" Complete filenames with Tab
set tabstop=4		" tabs are 4 characters long
set shiftwidth=4	" indent level
set autoindent	" automatic indenting of new lines
set smartindent	" get smart indenting for program code-like texts
" }}}
" Searching {{{
set nohlsearch	" do not highlight search patterns
set incsearch	" incremental search (search while pattern is typed)
set ignorecase	" ignore case
set smartcase	" case-insensitive searching until pattern is in lower case
" }}}
" Misc {{{
set numberwidth=4 " Number of columns in line numbering
set laststatus=2	" always display the status line
set title titlestring=vim\ -\ %F\ %h " format of the window title
set foldenable			" use folding
set foldmethod=marker	" use default marker for folding
set visualbell			" Don't beep me, you beep!
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v]\ [LEN=%L][%p%%]
" set cursorline
" }}}
" Colors {{{
syntax on			" switch on syntax highlighting
set bg=dark			" use colors for the dark background
" colorscheme aiseered	" use colorscheme
" colorscheme adobe	" use colorscheme
"
"if has("gui_running")
	colorscheme sea
"else
"	colorscheme leonid	" use colorscheme
"endif
" 
" colorscheme impact	" use colorscheme
" colorscheme torte
" colorscheme elflord
" }}}
" Options {{{
set mouse=a		" Mouse support
set autowrite	" saves unwritten buffers
set nobackup	" do not create backup files
set bs=2		" backspace over everything in insert mode
set ruler		" show cursor position in the file
set history=50	" keep last 50 commands
set showcmd	" show command autocompletion
set wildmenu	" show autocompetion in status menu
set wrapmargin=1	" margin from the right to show wrapping
set formatoptions=awtcrq
set number						" Line numbers
set complete-=k				" Do not complete from dictionaries
set formatoptions=croq
set nowrap						" No line wrapping
set showmatch					" Show matching opening bracket
set matchtime=5				" Show match for half a second
" }}}
:" Vertical indenting {{{2
:"set list
:"set listchars=tab:\|\ 	
" 2}}}
" Perl syntax check {{{
autocmd BufNewFile,BufRead *.pl,*.pm,*.cgi,*.t compiler perl
autocmd BufNewFile,BufRead *.pl,*.pm,*.cgi,*.t set ft=perl
augroup filetypedetect
autocmd! BufNewFile,BufRead *.epl setf embperl
augroup END
" }}}
" Start directory explorer if no files specified {{{
au! CursorHold * let @/ = '\%' . line('.') . 'l.*'
"if argc() == 0
"	silent exe 'e .'
"endif
" }}}

