scriptencoding utf-8

augroup spacevimNewFile
  autocmd!
  " Add title automatically when new files and move cursor to the end of file
  autocmd BufNewFile *.py,*.cpp,*.c,*.sh,*.java,*.pl call spacevim#vim#auto#AddTitle()
augroup END

" vim-move {
  " vim-move config
  " for terms that send Alt as Escape sequence
  " see http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim
  " for why the <F20> hack. Keeps Esc from waiting for other keys to exit visual
  set <F20>=j
  set <F21>=k
  vmap <F20> <Plug>MoveBlockDown
  vmap <F21> <Plug>MoveBlockUp
  nmap <F20> <Plug>MoveLineDown
  nmap <F21> <Plug>MoveLineUp
" }

" rainbow {
  let g:rainbow_active = 1
  let g:rainbow_conf = {
              \   'guifgs': ['#4F97D7', '#D75F87', '#D697E6', '#40AF81', '#DA61AE', '#70AF67'],
              \   'ctermfgs': ['68', '168', '176', '104', '73', '212'],
              \   'operators': '_,_',
              \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
              \   'separately': {
              \       '*': {},
              \       'tex': {
              \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
              \       },
              \       'lisp': {
              \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', '#FF69B4', '#DDA0DD', '#F08080', '#FF8C00', '#20B2AA'],
              \       },
              \       'vim': {
              \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
              \       },
              \       'html': {
              \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
              \       },
              \       'css': 0,
              \       'c': {
              \           'parentheses': ['start=/\v(#ifdef|#ifndef|#if)/ step=/\v(#else|#elif)/ end=/#endif/'],
              \       },
              \       'cpp': {
              \           'parentheses': ['start=/\v(#ifdef|#ifndef|#if)/ step=/\v(#else|#elif)/ end=/#endif/'],
              \       },
              \   }
              \}
" }

" rainbow_parentheses.vim {
  augroup rainbowLisp
    autocmd!
    autocmd FileType lisp,clojure,scheme RainbowParentheses
  augroup END
" }

" tagbar {
  let g:tagbar_autofocus = 0
  let g:tagbar_autoshowtag = 1
  nnoremap <F6> :TagbarToggle<CR>
  inoremap <F6> <ESC>:TagbarToggle<CR>
  nnoremap <Leader>tt :TagbarToggle<CR>
  nnoremap <Leader>tf :TagbarShowTag<CR>
  let g:tagbar_sort = 0
  let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \},
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \},
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
  \}
" }

" asyncrun.vim {
  nnoremap <F5> :call spacevim#plug#asyncrun#CompileAndRun()<CR>
  augroup spacevimAsyncRun
    autocmd!
    autocmd User AsyncRunStart call spacevim#vim#auto#AsyncRunStart()
  augroup END
" }

" indentLine {
        let g:indentLine_char='¦'
        let g:indentLine_enabled=1
  let g:indentLine_color_term=239
  let g:indentLine_color_gui = '#4A9586'
  let g:indentLine_concealcursor='vc'      " default 'inc'
  let g:indentLine_fileTypeExclude = ['help', 'startify', 'vimfiler']
" }

" vim-indent-guides {
  let g:indent_guides_start_level = 2
  let g:indent_guides_guide_size = 1
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_auto_colors = 0
  nnoremap <Leader>ti :IndentGuidesToggle<CR>
" }

" vim-polyglot {
  " Reset errorformat to its default value for cooperating with asyncrun.vim
  autocmd BufEnter * set errorformat&
" }
