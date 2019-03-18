" Makes a location list to list up with a cword
function! tagjump_locationlist#cword() abort
  call tagjump_locationlist#search(expand('<cword>'))
endfunction

" Makes a location list to list up with a given regex
function! tagjump_locationlist#search(regex) abort
  call setloclist(winnr(), [])
  lopen

  call map(taglist(a:regex), function('s:laddexpr_line'))

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
  execute ':lvimgrep' a:term['cmd'] a:term['filename']
endfunction
