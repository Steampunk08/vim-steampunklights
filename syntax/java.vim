" syntax match SPjavaUserType /\v<([A-Z][a-z]+){1,}>/

syntax match SPjavaUserType /\v<([A-Z][a-z]+){1,}(\d+)?>|[A-Z]+\ze\./
syntax region  javaParenT	transparent matchgroup=javaParen  start="(" end=")" contains=@javaTop,javaParenT1,SPJavaUserType

call Steampunklights.Highlight({
\   'java(ScopeDecl|Repeat|Conditional)': 'Statement',
\   'java(Exceptions)': 'Statement',
\   'javaStorage': 'Type',
\   'javaExternal': 'PreProc',
\   'SPjavaUserType': 'Function',
\ })
