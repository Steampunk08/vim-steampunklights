" runtime $VIMRUNTIsyntax/tagbar.vim

let include_list = [
         \ 'TagbarVisibilityPublic', 'TagbarVisibilityProtected', 
         \ 'TagbarVisibilityPrivate', 'TagbarSignature', 
         \ 'TagbarHelp', 'TagbarKind', 'TagbarScope', 'TagbarPseudoID',
         \ 'TagbarNestedKind', 'TagbarFoldIcon', 'TagbarType',
         \ ]

for include in include_list
   try
      execute 'syntax include ' . include . ' ../tagbar/syntax/tagbar.vim'
   catch
   endtry
endfor

execute 'syntax match STagbarNormal /\v./ contains=' . join(include_list, ',')
syntax keyword TagbarType class interface struct

call Steampunklights.Highlight({
\    'TagbarVisibilityPrivate':   'Operator',
\    'TagbarVisibilityProtected': 'String',
\    'TagbarVisibilityPublic':    'Identifier',
\    'TagbarHelp':                ['midgray'],
\    'TagbarHelpTitle':           'String',
\    'TagbarHelpKey':             'Macro',
\    'TagbarFoldIcon':            'Operator',
\    'TagbarNestedKind':          ['chartreuse'],
\    'TagbarKind':                'String',
\    'TagbarSignature':           'Statement',
\    'STagbarNormal':             ['midgray'],
\ }, 'Tagbar')
