if exists('g:easy_constructor_loaded')
  finish
endif
let g:easy_constructor_loaded=1


command! -nargs=0 -range EasyConstructor
\ call easyconstructor#execute()
