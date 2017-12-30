if g:spacevim_timer
  MP 'luochen1990/rainbow', { 'on': [] }
  MP 'sheerun/vim-polyglot', { 'on': [] }
  call timer_start(300, 'spacevim#defer#programming')
else
  MP 'luochen1990/rainbow'
  MP 'sheerun/vim-polyglot'
endif

" MP 'editorconfig/editorconfig-vim', { 'on': 'EditorConfigReload' }
MP 'editorconfig/editorconfig-vim'

MP 'matze/vim-move', { 'on': [
            \ '<Plug>MoveBlockDown',
            \ '<Plug>MoveBlockUp',
            \ '<Plug>MoveLineDown',
            \ '<Plug>MoveLineUp',
            \ ]}

MP 'junegunn/rainbow_parentheses.vim', { 'for': ['lisp', 'clojure', 'scheme'] }

" Need to disable airline extension for tagbar, see vim-airline issue 1313.
MP 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

MP 'Chiel92/vim-autoformat',          { 'on': 'Autoformat' }

MP 'Yggdroot/indentLine',             { 'on': 'IndentLinesToggle' }
MP 'nathanaelkane/vim-indent-guides', { 'on': 'IndentGuidesToggle' }

MP 'skywind3000/asyncrun.vim',        { 'on': ['AsyncRun!', 'AsyncRun'] }
