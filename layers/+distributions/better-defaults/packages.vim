" if g:MAC
    " Plug 'ybian/smartim'
" endif

if g:spacevim_timer
  MP 'dodong471520/vim-signature'        , { 'on': [] }
  MP 'tpope/vim-rsi'                , { 'on': [] }
  MP 't9md/vim-choosewin'           , { 'on': [] }
  MP 'dominikduda/vim_current_word' , { 'on': [] }
  call timer_start(500, 'spacevim#defer#defaults')
else
  MP 'tpope/vim-rsi'
  MP 't9md/vim-choosewin'
  MP 'dodong471520/vim-signature'
  MP 'dominikduda/vim_current_word'
endif

MP 'mhinz/vim-startify', { 'on': 'Startify' }
augroup spacevimStart
  autocmd!
  autocmd VimEnter *
              \   if !argc()
              \|    call plug#load('vim-startify')
              \|    silent! Startify
              \|  endif
augroup END

" Bug here.
" MP 'kana/vim-operator-user',         { 'on': '<Plug>(operator-flashy)' }
" MP 'haya14busa/vim-operator-flashy', { 'on': '<Plug>(operator-flashy)' }

MP 'ntpeters/vim-better-whitespace', { 'on': 'StripWhitespace' }

if has('patch-8.0.1238')
  MP 'haya14busa/is.vim'
  MP 'osyo-manga/vim-anzu', { 'on': ['<Plug>(anzu-n-with-echo)', '<Plug>(anzu-N-with-echo)'] }
else
  MP 'dodong471520/vim-searchindex'
  if !g:spacevim_nvim
    MP 'haya14busa/incsearch.vim'
    MP 'haya14busa/incsearch-fuzzy.vim'
  endif
endif
