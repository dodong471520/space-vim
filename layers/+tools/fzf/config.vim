if g:spacevim_gui && !has('terminal')
  " LeaderF {
  nnoremap <Leader>ff :LeaderfFile ~<CR>
  nnoremap <Leader>f? :LeaderfFile<CR>
  nnoremap <Leader>fr :LeaderfMru<CR>
  nnoremap <Leader>fl :LeaderfLine<CR>
  nnoremap <Leader>fL :LeaderfLineAll<CR>
  " }
else
  " fzf.vim {
  let $LANG = 'en_US'
  " Customize fzf colors to match your color scheme
  let g:fzf_colors = g:spacevim#plug#fzf#colors
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
  nmap <Leader>? <plug>(fzf-maps-n)
  xmap <Leader>? <plug>(fzf-maps-x)
  omap <Leader>? <plug>(fzf-maps-o)

  " nnoremap <Leader>wg :Ag -w<CR>
  nnoremap <Leader>ag :Ag "-w ".expand("<cword>")<cr>
  nnoremap <Leader>bb :Buffers<CR>
  nnoremap <Leader>tag :Tags expand("<cword>")<cr>

  nnoremap <Leader>b? :Buffers<CR>
  nnoremap <Leader>w? :Windows<CR>
  nnoremap <Leader>ff :Files<CR>
  nnoremap <Leader>fl :BLines expand("<cword>")<CR>

  nnoremap <Leader>f? :Files ~<CR>
  " }

  " fzf-filemru {
  nnoremap <Leader>pr :ProjectMru --tiebreak=end<cr>
  " }
endif
