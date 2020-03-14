call Steampunklights.Highlight({
\   'jsGlobalObjects': 'Type',
\   'jsSpecial jsRegexpOr': 'Special',
\   'jsVariableDef': ["midgray", "bold"],
\   'jsFuncCall': 'Function',
\   'jsExceptions jsGlobalNodeObjects': ["navy", "bold"],
\   'jsRegexpBoundary': ["burn"],
\   'jsStorageClass jsFunction jsRegexp(Quantifier|CharClass)': 'Statement',
\   'jsObjectProp': 'PreProc',
\ },'Js', 'JavaScript')

" FIXME: needs to be converted to new style
" if !exists('g:steamlights.tone_it_down') || !g:steamlights.tone_it_down
   " call s:HL('jsVariableDef jsParen(Repeat|IfElse|.)', 'Identifier')
" endif
