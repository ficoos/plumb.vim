function! plumb#open_at(m)
  if !filereadable(a:m[1])
    return
  endif
  :execute "e " . a:m[1]
  if !empty(a:m[3])
    :call cursor(a:m[2], a:m[3])
  elseif !empty(a:m[2])
    :call cursor(a:m[2], 0)
  endif
endfunction
let g:plumb#conf = [
  \ ['File "\(\f\+\)", line \(\d\+\),', 'plumb#open_at'],
  \ ['\(\f\+\): line \(\d\+\), col \(\d\+\)', 'plumb#open_at'],
  \ ['\(\f\+\): line \(\d\+\)', 'plumb#open_at'],
  \ ['\(\f\+\):\(\d\+\):\(\d\+\):', 'plumb#open_at'],
  \ ['\(\f\+\):\(\d\+\)', 'plumb#open_at'],
  \ ['\(\f\+\)', 'plumb#open_at']
  \ ]

function! plumb#exec(data)
  for entry in g:plumb#conf
    let m = matchlist(a:data, entry[0])
    if len(m) > 0
      execute 'call ' . entry[1] . '(m)'
      break
    endif
  endfor
endfunction

" vim: set tabstop=2 shiftwidth=2 expandtab:
