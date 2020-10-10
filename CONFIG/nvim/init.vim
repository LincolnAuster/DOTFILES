"
" INIT STUFF
"

set linebreak

autocmd BufEnter *.js set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

"
" LIST MACROS
"

" highlight lines beginning with n
nnoremap <silent> ;; :syn region p start=/^n/ end=/$/ oneline <bar> highlight link p String<CR>
" mark line as done
nnoremap <silent> ;d 0ry
" create new task
nnoremap <silent> ;n on<tab>

"
" TEXT MACROS
"

" end of line, but dash is more convenient than $ 
nnoremap - $
" spelling
nnoremap <silent> <F1> :set spell  <CR>
nnoremap <silent> <F2> :set nospell<CR>
" line numbers
nnoremap <silent> <F3> :set number<CR>
nnoremap <silent> <F4> :set nonumber<CR>
" disable highlight (after search, etc)
noremap <silent> <F6> :noh<CR>
" center line
nnoremap <silent> <RETURN> zz

"
" MARKDOWN MACROS
"

" make header
nnoremap <silent> " 0i# <esc>j
" make bullet point
nnoremap <silent> U 0i* <esc>j
nnoremap <silent> <F10> ":!pandoc " . shellescape(@%) . " -o out.pdf -V geometry:margin=1in<CR>"

"
" LATEX MACROS
"

" emph/italic
nnoremap <silent> ti i\emph{}<esc>i
inoremap <silent> <C-t>i \emph{}<esc>i
" compile doc
noremap <expr> <silent> <F12> ":!pdflatex " . shellescape(@%) . "<CR>"
" compile doc (ignore log)
noremap <expr> <silent> <F11> ":!pdflatex " . shellescape(@%) . "<CR><CR>"
