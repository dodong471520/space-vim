if g:spacevim_gui && !has('terminal')
  MP 'Yggdroot/LeaderF'
else
  if g:spacevim_timer
    MP 'dodong471520/fzf',  { 'dir': '~/.fzf', 'do': './install --all', 'on': [] }
    MP 'dodong471520/fzf.vim', { 'on': [] }
    call timer_start(700, 'spacevim#defer#fzf')
  else
    MP 'dodong471520/fzf',  { 'dir': '~/.fzf', 'do': './install --all' }
    MP 'dodong471520/fzf.vim'
  endif
  MP 'tweekmonster/fzf-filemru', { 'on': 'ProjectMru' }
endif
