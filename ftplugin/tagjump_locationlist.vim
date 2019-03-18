let b:undo_ftplugin = 'setl ' . join([
  \ 'errorformat<',
\ ])

let &errorformat = '%f:(%l\,%c):%m'

nnoremap <buffer> <CR> :<C-u>call <SID>close_after_go()<CR>
nnoremap <buffer> Q :<C-u>close<CR>

function! s:close_after_go() abort
  execute 'normal!' "\<CR>"
  execute 'normal!' "\<C-w>p"
  close
endfunction
