syntax match gitNumber /\v<\d+>/

call Steampunklights.Highlight({
\   'gitConfigSection':    'String',
\   'gitConfigVariable':   'Function',
\   'gitConfigAssignment': 'chartreuse',
\ },'GitConfig')
