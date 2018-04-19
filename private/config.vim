
function! ReloadTags_Go()
    if exists("g:have_go_tags")
        return
    endif
    let g:have_go_tags=1
    let l:oldtags=&tags
    let l:oldtags=l:oldtags.",".$GOROOT."/src/tags".",".$GOPATH."/src/tags"
    let &tags=l:oldtags
endfunction

function! ConqueGdb_Focus()
    exe 'ConqueGdb'
    if !exists('g:conquegdb_oldwinheight')
        let g:conquegdb_oldwinheight=winheight(0)/2
        exe 'resize '. g:conquegdb_oldwinheight
    endif
endfunction

" go
" gotags -R /root/go/src >/root/go/src/tags
" gotags -R /usr/local/go/src >/usr/local/go/src/tags
autocmd! filetype go :call ReloadTags_Go()
" map <leader>ee :e /mnt/hgfs/C/work/GameClient/Assets/Scripts/Lua/Controller/Equip/EquipCtrl.lua<cr>

" gdb
" let g:ConqueTerm_StartMessages = 0
" nnoremap <leader>d :call ConqueGdb_Focus()<cr>
set magic
set noswapfile

" bookmark
" save viminfo 
" augroup save_viminfo
    " autocmd!
    " autocmd VimLeavePre * :wviminfo ~/viminfo
" augroup END
let g:bookmark_save_per_working_dir = 1
" let g:bookmark_manage_per_buffer = 1
let g:bookmark_center = 1
let g:bookmark_disable_ctrlp = 1
let g:bookmark_no_default_key_mappings = 0
let g:bookmark_location_list = 1

" gitgutter
set updatetime=400
nmap ghp <Plug>GitGutterPreviewHunk
" nmap ghs <Plug>GitGutterStageHunk
" nmap ghu <Plug>GitGutterUndoHunk
 
