" ------------------------------------------------------------------------------------------------
" Author: Siphesihle Mhlongo 
" Description: Colourful terminal vim colorscheme
" Created: 3 Feb 2018
" Last Modified: 3 Feb 2018
" ------------------------------------------------------------------------------------------------

let s:palette = {}

let s:palette.chartreuse = [154]
let s:palette.hotpink    = [161]
let s:palette.lightblue  = [111]
let s:palette.yellow     = [226]
let s:palette.blurple    = [105]
let s:palette.coffee     = [95]
let s:palette.burn       = [196]
let s:palette.navy       = [67]
let s:palette.teal       = [37]

function s:palette.gen(foreground, ...)
   let hioptions = {}
   if exists('self[a:foreground]')
      let hioptions.fg = a:foreground
   endif

   if a:0 == 1 && exists('self[a:1]')

   else
   endif
   return hioptions
endfunction

function! s:HL(higroups, hioptions)
endfunction

hi Keyword ctermfg=111
hi Function ctermfg=95
hi Statement ctermfg=111
hi Identifier ctermfg=154
hi Operator ctermfg=161
hi Number ctermfg=67
hi String ctermfg=105
hi Type ctermfg=226 cterm=bold
hi Cursorline ctermbg=233
