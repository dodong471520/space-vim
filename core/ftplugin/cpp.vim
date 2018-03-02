setlocal cindent tabstop=4 shiftwidth=4 softtabstop=4

nnoremap <buffer> <LocalLeader>= :ClangFormat<CR>
vnoremap <buffer> <LocalLeader>= :<C-U>ClangFormat<CR>
