" Syntax Highlighting
" Language: .cx

if exists("b:current_syntax")
  finish
endif

" Functions (calls and definitions)
syntax match cxFuncIds '\w\+\s*\ze(' 

" Keywords
syntax keyword cxFuncKwd func nextgroup=cxFuncIds skipwhite
syntax keyword cxKwds ret if else for while in extern include let enum struct

" Types
syntax keyword cxTypes bool
syntax match cxIntTypes '\(u\|i\|f\)\(8\|16\|32\|64\|128\)\ze\($\|\s\|[^[:alnum:]]\)'

" Numeric literals
syntax match cxNums '\d\+\.\?\d*'
syntax keyword cxBools true false 

" Comments
syntax keyword cxTodos TODO FIXME XXX NOTE
syntax match cxComments '//.*$' contains=cxTodos

" Strings
syntax region cxStrings start='"' end='"'


" Highlight groups
highlight default link cxFuncIds Function 
highlight default link cxFuncKwd Keyword
highlight default link cxKwds Keyword
highlight default link cxTypes Type
highlight default link cxIntTypes Type
highlight default link cxNums Number
highlight default link cxBools Number
highlight default link cxTodos Todo
highlight default link cxComments Comment
highlight default link cxStrings String

let b:current_syntax = "cortex"
