scriptencoding utf-8

if exists('g:loaded_tagjump_locationlist')
  finish
endif
let g:loaded_tagjump_locationlist = v:true

let g:tagjump_locationlist_use_default_keymappings = get(g:, 'tagjump_locationlist_use_default_keymappings', v:true)

nmap <Plug>(tagjump-locationlist) :<C-u>call tagjump_locationlist#cword()<CR>
vmap <Plug>(tagjump-locationlist) "zy:<C-u>tagjump_locationlist#search(@z)<CR>

command! -bar -nargs=+ TagjumpLocationlistSearch call tagjump_locationlist#search(<q-args>)
