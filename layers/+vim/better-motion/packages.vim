if g:spacevim_timer
  MP 'justinmk/vim-sneak'                  , { 'on': [] }
  MP 'easymotion/vim-easymotion'           , { 'on': [] }
  MP 'haya14busa/incsearch-easymotion.vim' , { 'on': [] }
  call timer_start(500, 'spacevim#defer#motion')
else
  MP 'justinmk/vim-sneak'
  MP 'easymotion/vim-easymotion'
  MP 'haya14busa/incsearch-easymotion.vim'
endif
