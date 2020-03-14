" syntax patch for files with -|+ if you have
" -|+ as one of your fold icons for nerdtree
syntax match NERDTreeFile /\v[+-]\S+/

call Steampunklights.Highlight({
\    'NERDTree(Closable|ToggleOff)':    'Operator',
\    'NERDTree(Openable|ToggleOn)':     ['chartreuse'],
\    'NERDTreeCWD':                     'Keyword',
\    'NERDTree(DirSlash|Help)':         ['midgray'],
\    'NERDTreeFile':                    'Special',
\    'NERDTreeLink(Dir|File)':          ['lightblue', 'bold'],
\    'NERDTreeLinkTarget':              'Function',
\    'NERDTreeHelp(Key|Command)':       'Macro',
\    'NERDTree(HelpTitle|Bookmark)':    'String',
\    'NERDTree(BookmarkName|ExecFile)': 'Identifier',
\ }, 'Nerdtree')
