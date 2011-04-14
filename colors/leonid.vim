set bg=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "leonid"

hi Normal guifg=white guibg=black term=none gui=none

" Other
hi Todo         guifg=yellow  ctermfg=yellow term=none 
hi LineNr 		guifg=darkgray ctermfg=darkgray term=none
" hi StatusLine 		guifg=black guibg=white term=none
" hi StatusLineNC 		guifg=black guibg=white term=none
" hi CursorLine 	guibg=lightblue ctermbg=lightgray

" Syntax
hi Comment		guifg=gray ctermfg=gray
