" -------------------------------------------------+
" Author: Siphesihle Mhlongo                       |
" Description: Colourful terminal vim colorscheme  |
" Created: 3 Feb 2018                              |
" Last Modified: 5 Feb 2018                        |
" Version: 2.0.01                                  |
" -------------------------------------------------+

" PREAMABLE
highlight clear

if exists('syntax')
   syntax reset
endif

set background=dark
let colors_name = 'steampunklights'

" FUNCTIONS & PALETTE
" palette {{{
let s:palette = {}
" palette generate function {{{
function s:palette.gen(foreground, ...)
   let hioptions = {}
   if exists('self[a:foreground]')
      let hioptions.ctermfg = self[a:foreground][0]
      let hioptions.guifg   = self[a:foreground][1]
   endif

   let start = 0
   if exists('a:1') && exists('self[a:1]')
      let hioptions.ctermbg = self[a:1][0]
      let hioptions.guibg   = self[a:1][1]
      let start += 1
   endif
   if exists('a:2') && exists('self[a:2]')
      let hioptions.guisp = self[a:2][1]
      let start += 1
   endif
   if exists('a:' . start)
      let hioptions.cterm = extend(["none"], a:000[start:-1])
      let hioptions.gui   = extend(["none"], a:000[start:-1])
   endif
   return hioptions
endfunction
" }}}
let s:palette.chartreuse = [154, '#afff00']
let s:palette.hotpink    = [161, '#d7005f']
let s:palette.lightblue  = [111, '#87afff']
let s:palette.banana     = [226, '#ffff00']
let s:palette.blurple    = [105, '#8787af']
let s:palette.coffee     = [95,  '#875f5f']
let s:palette.burn       = [196, '#ff0000']
let s:palette.navy       = [67,  '#5f87af']
let s:palette.teal       = [37,  '#00afaf']
let s:palette.lightgray  = [246, '#949494']
let s:palette.gray       = [242, '#6c6c6c']
let s:palette.dimgray    = [236, '#303030']
let s:palette.darkgray   = [234, '#1c1c1c']
let s:palette.white      = [15,  '#ffffff']
let s:palette.black      = [232, '#080808']
let s:palette.clear      = ["NONE", "NONE"]
let s:palette.bg         = ["bg", "bg"]
" }}}
" highlighting function {{{
function! s:HL(higroups, hioptions)

   for higroup in split(a:higroups)
      let hioptions = a:hioptions
      
      if type(hioptions) == type({})
         let hiparts = ["highlight", higroup]
         if !exists('hioptions["ctermbg"]') || !exists('hioptions["guibg"]')
            let hioptions.ctermbg = "bg"
            let hioptions.guibg   = "bg"
         endif
         for [ attr, value ] in sort(items(hioptions))
            if type(value) == type([])
               let value = join(value, ",")
            endif
            call add(hiparts, attr . "=" . value)
         endfor
         execute join(hiparts, " ")
      else
         execute "highlight link " . higroup . " " . hioptions
      endif
   endfor
endfunction
" }}}

" HIGHLIGHTING
" General / UI {{{
call s:HL('Normal Todo CommentTitle', s:palette.gen("white", "black"))
call s:HL('Keyword Statement', s:palette.gen("lightblue"))
call s:HL('Identifier', s:palette.gen("chartreuse", "bold"))
call s:HL('Comment Folded', s:palette.gen("lightgray", "bg"))
call s:HL('LineNr', s:palette.gen("gray"))
call s:HL('CursorLineNr', s:palette.gen("burn"))
call s:HL('String Directory Title', s:palette.gen("blurple"))
call s:HL('Type', s:palette.gen("banana", "bold"))
call s:HL('Operator', s:palette.gen("hotpink"))
call s:HL('Cursorline', s:palette.gen("clear", "dimgray"))
call s:HL('Function', s:palette.gen("coffee"))
call s:HL('Number Preproc', s:palette.gen("navy"))
call s:HL('WildMenu PmenuSel', s:palette.gen("bg", "blurple"))
call s:HL('Statusline Pmenu', s:palette.gen("white", "dimgray"))
call s:HL('Delimiter', s:palette.gen("clear"))
" }}}
" Language Spercific {{{
" ruby {{{
" }}}
" python {{{
" }}}
" html/js/css {{{
call s:HL('htmlItalic', s:palette.gen("lightblue", "italic"))
" }}}
" vimscript {{{
call s:HL('vimCommentTitle', s:palette.gen("white"))
call s:HL('vimUserFunc vimMapMod vimBracket vimFuncSID', s:palette.gen("coffee"))
call s:HL('vimMapModKey vimNotation', s:palette.gen("blurple"))
call s:HL('vimContinue', 'Operator')
call s:HL('vimOption vimGroupName' , s:palette.gen('hotpink', "bold"))
"call s:HL('', s:palette.gen(""))
"call s:HL('', s:palette.gen(""))
" }}}
" markdown {{{
call s:HL('markdownListMarker markdownHeadingDelimiter', s:palette.gen("hotpink"))
call s:HL('markdownCode markdownCodeDelimiter markdownCodeBlock',
   \ s:palette.gen("chartreuse", "darkgray"))
" }}}
" }}}
" Plugin Spercific {{{
" startify {{{
call s:HL('StartifyNumber', s:palette.gen("hotpink"))
call s:HL('StartifyHeader', s:palette.gen("lightblue"))
call s:HL('StartifySection', s:palette.gen("lightgray"))
call s:HL('StartifyFile', s:palette.gen("coffee"))
" }}}
" }}}

" CLEAN UP
unlet s:palette
delfunction s:HL

source $MYVIMRC
" vim:ts=3:sts=3:sw=3:et
