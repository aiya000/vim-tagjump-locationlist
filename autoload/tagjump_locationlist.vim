" Makes a location list to list up with a cword
function! tagjump_locationlist#cword() abort
  call tagjump_locationlist#search(expand('<cword>'))
endfunction

" Makes a location list to list up with a given regex
function! tagjump_locationlist#search(regex) abort
  let target_winnr = winnr()
  call setloclist(target_winnr, [])
  lopen

  call map(taglist(a:regex), function('s:laddexpr_line'))
  if empty(getloclist(target_winnr))
    echo printf('no "%s" found', a:regex)
    lclose
    return
  endif

  " NOTE: Why the cursor go to a previous window after open a new loclist?
  execute 'normal!' "\<C-w>p"
  setf tagjump_locationlist
endfunction

" {
"   'cmd': '/^# vim-tagjump-locationlist$/',
"   'static': 0,
"   'name': '# vim-tagjump-locationlist',
"   'kind': '',
"   'filename': '/path/to/vim-tagjump-locationlist/README.md'
" }
function! s:laddexpr_line(_, term) abort
  try
    let cmd = escape(a:term['cmd'], '[')
    let filename = fnameescape(a:term['filename'])
    execute ':silent lvimgrep' cmd filename
  catch /^Vim(lvimgrep):E480/
    " Ignore an already unexistent tag
  endtry
endfunction
