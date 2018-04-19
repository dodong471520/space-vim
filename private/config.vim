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

let s:SIGN_POINTER = 'my_gdb_sign_pointer'
let s:SIGN_ID = 11011
sil exe 'sign define ' . s:SIGN_POINTER . ' linehl=Search'
function! MyGdb_UpdatePointer(fname,linenum)
    sil exe 'sign unplace ' . s:SIGN_ID
    if bufwinnr(a:fname)==-1
        " echom "okk"
        sil exe 'e! +'.a:linenum.' '.a:fname
    endif
    sil exe 'sign place ' . s:SIGN_ID . ' line=' . a:linenum . ' name=' . s:SIGN_POINTER . ' file=' . a:fname
    sil exe 'normal '.(a:linenum-1).'gg'
endfunction
function! MyGdb_BreakPointCreated(id,fname,linenum,enabled)
    if a:enabled==0
        let l:name='my_gdb_break_disabled'.a:id
        sil exe 'sign define '.l:name.' text='.a:id.' texthl=WarningMsg'
    else
        let l:name='my_gdb_break_enabled'.a:id
        sil exe 'sign define '.l:name.' text='.a:id.' texthl=errormsg'
    endif
    sil exe 'sign unplace '.a:id
    if bufnr(a:fname)==-1
        sil exe 'e! +' . a:linenum . ' ' . a:fname
    endif
    let l:buf=bufnr(a:fname)
    let l:place_msg='sign place '.a:id.' line='.a:linenum.' name='.l:name.' buffer='.l:buf
    " echom l:place_msg
    sil exe l:place_msg
    sil exe 'normal lh'
endfunction
function! MyGdb_BreakPointDeleted(id)
    sil exe 'sign unplace ' . a:id
endfunction
function! MyGdb_CleanSign()
    sil exe 'sign unplace *'
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
"
" set mouse=r
