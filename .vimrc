execute pathogen#infect()
filetype plugin indent on
"autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType py setlocal shiftwidth=4 tabstop=4
hi Comment ctermfg=DarkGray
hi Error ctermfg=Black ctermbg=DarkRed
hi TabLine ctermfg=White ctermbg=Black
hi TabLineFill ctermfg=Black ctermbg=White
hi TabLineSel ctermfg=White ctermbg=DarkBlue
hi Todo ctermfg=DarkRed ctermbg=Black cterm=underline,bold
set autoindent
set background=dark
set cursorline
set expandtab shiftwidth=8 softtabstop=8
set hidden
set hlsearch incsearch ignorecase showmatch smartcase
set lazyredraw
set lbr
set mouse=a
set nowrap
"set paste
set ruler
set runtimepath+=/usr/share/lilypond/2.12.3/vim/
set scrolloff=4
set sessionoptions-=options
"set textwidth=79
syntax on

" From http://vimcasts.org/episodes/the-file-explorer/#comment-45366660
let g:netrw_liststyle=3 " Use tree-mode as default view
let g:netrw_preview=1 " preview window shown in a vertically split

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

inoremap \fn <C-R>=expand("%:t:r")<CR>

"Macros for corpus tagging

let @f=':b footerggVGy:b#pG'

" From http://vim.wikia.com/wiki/Windo_and_restore_current_window
" Just like windo, but restore the current window when done.
function! WinDo(command)
    let currwin=winnr()
    execute 'windo ' . a:command
    execute currwin . 'wincmd w'
endfunction
com! -nargs=+ -complete=command Windo call WinDo(<q-args>)

" Just like Windo, but disable all autocommands for super fast processing.
com! -nargs=+ -complete=command Windofast noautocmd call WinDo(<q-args>)

" Just like bufdo, but restore the current buffer when done.
function! BufDo(command)
    let currBuff=bufnr("%")
    execute 'bufdo ' . a:command
    execute 'buffer ' . currBuff
endfunction
com! -nargs=+ -complete=command Bufdo call BufDo(<q-args>)
