scriptencoding utf-8

if exists('g:loaded_tagjump_locationlist')
  finish
endif
let g:loaded_tagjump_locationlist = v:true

let g:tagjump_locationlist_use_default_keymappings = get(g:, 'tagjump_locationlist_use_default_keymappings', v:true)

nmap <expr> <Plug>(tagjump-locationlist) tagjump_locationlist#cword()
vmap <expr> <Plug>(tagjump-locationlist) tagjump_locationlist#visual()

command! -bar -nargs=+ TagjumpLocationlistSearch call tagjump_locationlist#search(<q-args>)
