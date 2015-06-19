function! s:sanitize_arg(arg)
  let result=a:arg
  let result=substitute(result, "=.*", "", "g")
  let result=split(result, " ")[-1]
  return result
endfunction

function! s:split_args(strargs)
  let strargs = substitute(a:strargs, "\n", " ", "g")
  let strargs = matchstr(strargs, "(.\\+)")[1:-2]
  return map(split(strargs, ","), "s:sanitize_arg(v:val)")
endfunction

function! s:arg_to_constructor(argname)
  return printf("%s_(%s)", a:argname, a:argname)
endfunction

function! s:execute_impl(selected_lines)
  return map(
    s:split_args(a:selected_lines),
    "s:arg_to_constructor(v:val)")
endfunction

function! easyconstructor#execute() range
  let selected_str=join(getline(a:firstline, a:lastline+1), "\n")
  let result=s:execute_impl(selected_str)
  if len(result) > 0
    call append(a:lastline+1, ": ".join(result, ", "))
  endif
endfunction
