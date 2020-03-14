syntax match xmlEndTag /\v\<\/[^ /!?<>"']+\>/ contains=SPxmlTagChars
syntax match SPxmlTagChars /\v(\<\/?|\>)/ contained

syntax region xmlString start=/"/ end=/"/ contains=SPxmlDirective
syntax region xmlString start=/'/ end=/'/ contains=SPxmlDirective
syntax match SPxmlDirective /\v\@\+?\w+/ contained

syntax match SPxmlAttrib /\v\w+\ze:/ contained
syntax match xmlAttrib
    \ /[-'"<]\@1<!\<[a-zA-Z:_][-.0-9a-zA-Z:_]*\>\%(['">]\@!\|$\)/
    \ contained
    \ contains=xmlAttribPunct,@xmlAttribHook,SPxmlAttrib

call Steampunklights.Highlight({
\   'xml(TagName|EndTag)': ['blurple', 'bold'],
\   'xmlTag': 'Function',
\   'xmlAttrib': 'Identifier',
\   'xmlProcessingDelim': ['midgray'],
\   'dtdTagName': ['mustard', 'bold'],
\   'SPxmlDirective': 'Macro',
\   'SPxmlTagChars': 'xmlTag',
\   'SPxmlAttrib': 'Function',
\ },'Xml')
