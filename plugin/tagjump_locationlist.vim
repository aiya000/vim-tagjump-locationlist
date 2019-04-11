scriptencoding utf-8

if exists('g:loaded_tagjump_locationlist')
  finish
endif
let g:loaded_tagjump_locationlist = v:true

let g:tagjump_locationlist_use_default_keymappings = get(g:, 'tagjump_locationlist_use_default_keymappings', v:true)

nmap <silent> <Plug>(tagjump-locationlist) :<C-u>call tagjump_locationlist#cword()<CR>
vmap <silent> <Plug>(tagjump-locationlist) "zy:<C-u>call tagjump_locationlist#search(@z)<CR>

command! -bar -nargs=+ TagjumpLocationlistSearch call tagjump_locationlist#search(<q-args>)

if g:tagjump_locationlist_use_default_keymappings
  nmap <C-]> <Plug>(tagjump-locationlist)
  vmap <C-]> <Plug>(tagjump-locationlist)
endif
