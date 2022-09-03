
function! SetUniversalSyntaxGroups()

  " Clear existing syntax groups

  syntax clear


  " Define universal syntax groups

  syntax region Rounds start=/\V(/ end=/\V)/ contains=TOP

  syntax region Brackets start=/\V[/ end=/\V]/ oneline contains=TOP

  syntax match Braces /\V{\|}/

  syntax match Sharps /\V<\|>/

  syntax region String start=/\W\@<='/ skip=/[^\\]\\'/ end=/'/ oneline
  syntax region String start=/\W\@<="/ skip=/[^\\]\\"/ end=/"/ oneline
  syntax region String start=/\W\@<=`/ skip=/[^\\]\\`/ end=/`/ oneline
  syntax region String start=/'''/ end=/'''/
  syntax region String start=/"""/ end=/"""/
  syntax region String start=/```/ end=/```/

  syntax match Define /\<\%(\w\|-\)*\w\+\ze\s*:\?=\(\w\|\s\|['"`({]\|$\)/

  syntax match Constant /\<[_A-Z][-_A-Z0-9]\+\>/

  syntax match Label /["']\?\<\%(\w\|-\)\+["']\?:/

  " Contains exclusion for '=~' regex matching
  syntax match Symbol /\%(\s\|\w\)\zs\(=\~\s\+\)\@![\!?=+-/*%~^&|∷→]\+\ze\%(\s\|\w\)/ contains=NONE

  syntax match Prefix /\(^\|\W\)\@=[!&@$#\\]\+/

  " Contains exclusion for '=~' regex matching
  syntax match Symbol /\(^\|\s\)\zs\(=\~\s\+\)\@![\!=+-/*%~^&|#<>∷→]\+\ze\(\s\|$\)/

  " For variable increment, decrement, etc
  syntax match Symbol /\w\+\zs\([-+/*%=∷→]\)\+/

  syntax match Separator /[-+/*%~|:;,.=]/

  syntax match DotPath /\<[a-zA-Z]\(\w\|-\)*\>\.\<\(\w\|-\|\.\)\+\>/

  " Colon delimited
  syntax match ScopedPath /\<\%(\w\|-\)\+\(:\+\w*\)\+/
  syntax match ScopedPath /\W\@<=\(:\+\w\+\)\>/

  syntax match Tag /<[?!]\?\w\+[^>]*\(\/\?>\|$\)/ contains=ALL
  syntax match Tag /<\/[^>]*>/ contains=ALL

  syntax match NavPath /\(<\|\<\w\+\)\@<!\W\@=\(\.*\|\w\+:\)\/\+\S\{-}\ze\(<\+\|>\+\|\s\|[()'"`?]\+\|$\)/ contains=NONE

  syntax match TagClosed /\(^\|\s\)\/>/

  syntax match Function /\<\(\w\|-\)\+\ze(/

  syntax match Macro /\(^\|\W\)\@<=#\w\(\w\|-\)*\>/

  syntax match Color /\(\s\|^\)\@<=#\([0-9a-fA-F]\)\+\>/

  syntax match Annotation /@\@<=\(\w\|-\)\+\(\s\|,\|$\)/

  " Assume a handful of common programming keywords, unless filetype is empty or 'text'
  if (&ft == 'text' || &ft == 'pandoc'  || &ft == 'markdown' || $ft == 'help')
    syntax clear Keyword
  else
    syntax keyword Keyword import namespace package module extends macro function return yield exit
    syntax match Keyword /\<\(class\|struct\|enum\|type\)\>\(\s*=\)\@!/
  endif

  " Short (-s) or long (--long) form options
  syntax match Option /\(^\|\s\|\W\)\@<=-\+\(\d\+\(\D\|$\)\)\@!\(\w\|-\)\+/

  " Attempts to account for scientific notation, etc
  syntax match Number /\(\<\|[-+pePE]\)\@<=\(0[bo]\)\?\d[0-9_]*\(\.\(\d\|_\)\+\)*\ze\(\s\|[pePE][-+0-9]\|\>\)%\@!/
  syntax match Number /\(\<\|[-+]\)\@<=0x[0-9a-fA-F][0-9a-fA-F_]*\(\.[0-9a-fA-F][0-9a-fA-F_]*\)*\ze\(\s\|[pePE][-+0-9a-fA-F]\|\>\)%\@!/

  " Units following numeric value, like in 100px
  syntax match Units /\(\<\|\|[-+]\)\d\+\.\?\(\d\|\.\)*\D\@=\zs\(\w\+\|%\)\>/ contains=NONE

  syntax match RegexMatch /=\~/

  syntax match Regex #\(^\|\s\)\(//\S\|/[^/]\+/\)\(\s\|$\)# contains=NONE
  syntax match Regex /\%(=\~\s\+\)\S\+/ contains=RegexMatch

  syntax match Parens /\V(\|)/


  " Comments
  
  if &commentstring =~ '^\/'
    syntax match Comment #\(^\|\s\)\@<=//.*$# contains=NONE
    syntax region Comment start=/\(^\s*\)\@<=\/\*/ end=/\*\// contains=NONE
  endif  
  if &commentstring =~ '^\#'
    syntax match Comment /\(^\|\s\)\@<=#.*$/ contains=NONE
  endif  
  if &commentstring =~ '^"'
    syntax match Comment #\(^\|\s\)\@<=".*$# contains=NONE
  endif  
  if &commentstring =~ '^;'
    syntax match Comment #\(^\|\s\)\@<=;.*$# contains=NONE
  endif  
  if &commentstring =~ '^--'
    syntax match Comment #\(^\|\s\)\@<=--.*$# contains=NONE
  endif
  if &commentstring =~ '^%%'
    syntax match Comment #\(^\|\s\)\@<=%%.*$# contains=NONE
  endif
  if &commentstring =~ '^<!--'
    syntax region Comment start=/<\!--/ end=/-->/ contains=NONE
  endif  

endfunction


function! SetUniversalSyntaxHighlighting()

  highlight link Parens Normal 
  highlight link Rounds Parens

  highlight link Brackets Special 

  highlight link Braces Statement 

  highlight link Sharps PreProc 

  highlight link Tag Sharps 
  highlight! link TagClosed Tag

  highlight link String Character  

  highlight link Define Identifier 

  highlight link Constant Special 

  highlight link Label Directory 

  highlight link Symbol Special 

  highlight link Separator Special 

  highlight link Number Title 

  highlight link Prefix Number 

  highlight link DotPath Identifier 

  highlight link ScopedPath Directory 

  highlight link NavPath Question 

  highlight link Function ModeMsg 

  highlight link Units Special 

  highlight link Macro ModeMsg 

  highlight link Color ModeMsg 

  highlight link Annotation Title 

  highlight link Keyword Question 

  highlight link Option Boolean 

  highlight link Regex MoreMsg 
  highlight link RegexMatch Symbol 

  highlight link Comment SignColumn 

endfunction


autocmd BufRead,BufNewFile,FileType * silent call SetUniversalSyntaxGroups() | silent call SetUniversalSyntaxHighlighting()
