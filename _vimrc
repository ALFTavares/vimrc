" uncomment the one I wanna use
" Absolute line numbers
" :set number		"toggle line numbers
" :set nonumber		"toggle numbers off

" Reslative line numbers
"set relativenumber	"toggle relative line numbers
"set norelativenumber	"toggle relative line numbers off

" Hybrid line numbers
:set number! relativenumber

" :set statusline=%t       "tail of the filename
" :set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
" :set statusline+=%{&ff}] "file format
" :set statusline+=%h      "help file flag
" :set statusline+=%m      "modified flag
" :set statusline+=%r      "read only flag
" :set statusline+=%y      "filetype
" :set statusline+=%=      "left/right separator
" :set statusline+=%c,     "cursor column
" :set statusline+=%l/%L   "cursor line/total lines
" :set statusline+=\ %P    "percent through file
:set statusline=%h%y%c,%l\%L\ %P

" Syntax Highlight
syntax on
" Syntax off

" Column number
:set ruler

" Functions
" Mixed hybrid lines with absolute numbers to make linenumber
" appear on line, lines as relative numbers and
" when entering insert mode lines appear as absolute numbers
:augroup numbertoggle
:	autocmd!
:	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
:augroup END

" Autocomplete function
" autocomplete with words that already know, so in the begining it
" might not know many words
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

" Cursor higlight
:hi CursorLine   cterm=NONE ctermbg=darkgrey ctermfg=white guibg=grey guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkgrey ctermfg=white guibg=grey guifg=white

:set cursorline! cursorcolumn!

" On pressing tab, insert 4 spaces
:set tabstop=4

" NERDTree
:autocmd vimenter * NERDTree

:set hidden

":autocmd StdinReadPre * let s:std_in=1
":autocmd VimEnter * if argc() == 1 && !exists("s:std_in") | NERDTree | elseif argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
:map <C-n> :NERDTereeToggle<CR>

" terminal
:set splitbelow
:term ++rows=16
