" -------------------------------------------------+
" Author: Siphesihle Mhlongo                       |
" Description: Colourful terminal vim colorscheme  |
" Created: 3 Feb 2018                              |
" Last Modified: 07 Jul 2018                       |
" Version: 3.1.02                                  |
" -------------------------------------------------+

" PREAMABLE
" clearing multiple times messes with the 
" contents of the ../syntax/ files
if !exists('s:already_cleared')
   highlight clear
   if exists('syntax')
      syntax reset
   endif
endif
let s:already_cleared = 1

set background=dark
let colors_name = 'steampunklights'

" INITIALIZATION
let Steampunklights = {}
let Steampunklights.config  = {}
let Steampunklights.palette = {}
" CONFIGS
" various configs {{{
" let Steampunklights.config.disables = [
" \   'GitGutter',
" \ ]
" }}}

" ESSENTIALS
" palette {{{
" Steampunklights.palette.gen() {{{
" palette generate function
function Steampunklights.palette.gen(foreground, ...)
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
let Steampunklights.palette.chartreuse = [154, '#afff00']
let Steampunklights.palette.hotpink    = [161, '#d7005f']
let Steampunklights.palette.lightblue  = [111, '#87afff']
let Steampunklights.palette.banana     = [226, '#ffff00']
let Steampunklights.palette.mustard    = [220, '#ffd700']
let Steampunklights.palette.blurple    = [105, '#8787af']
let Steampunklights.palette.coffee     = [95,  '#875f5f']
let Steampunklights.palette.burn       = [196, '#ff0000']
let Steampunklights.palette.navy       = [67,  '#5f87af']
let Steampunklights.palette.teal       = [37,  '#00afaf']
let Steampunklights.palette.lightgray  = [246, '#949494']
let Steampunklights.palette.gray       = [242, '#6c6c6c']
let Steampunklights.palette.midgray    = [240, '#585858']
let Steampunklights.palette.dimgray    = [236, '#303030']
let Steampunklights.palette.darkgray   = [234, '#1c1c1c']
let Steampunklights.palette.white      = [15,  '#ffffff']
let Steampunklights.palette.black      = [232, '#080808']
let Steampunklights.palette.red        = [167, '#d75f5f']
let Steampunklights.palette.orange     = [202, '#ff5f00']
let Steampunklights.palette.clear      = ["NONE", "NONE"]
let Steampunklights.palette.bg         = ["bg", "bg"]
" }}}
" highlighting function {{{
" s:split() {{{
" helper
function! s:split(higroups)
   let groups = []
   for higroup in split(a:higroups)
      if higroup =~ '\v.+\(.+\)'
         let base = substitute(higroup, '\v(.+)\(.+\)', '\1', '')
         let branches = substitute(higroup, '\v.+\((.+)\)', '\1', '')

         call extend(groups, map(split(branches, '|'),
            \ "base . (v:val == '.' ?  '' : v:val)"))
      else
         call add(groups, higroup)
      endif
   endfor

   return groups
endfunction
"}}}
" Steampunklights.HL() {{{
" core highlighting function
function! Steampunklights.HL(higroups, hioptions)
   let higroups = s:split(a:higroups)

   for higroup in higroups
      let hioptions = a:hioptions

      if type(hioptions) == type([])
         execute "let hioptions = self.palette.gen('" . 
                  \ join(hioptions, ''',''') . "')"
      endif
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
" Steampunklights.Highlight() {{{
" bulk highlighting function
function! Steampunklights.Highlight(hioptions, ...)
   let description_tags = a:000

   if exists('self.config.disables')
      for desc in description_tags
         for exclude in self.config.disables
            if desc =~? exclude
               return
            endif
         endfor
      endfor
   endif
   for [ higroups, hioptions ] in items(a:hioptions)
      call self.HL(higroups, hioptions)
   endfor
endfunction
" }}}
" }}}

" HIGHLIGHTING
" General Defaults {{{
" Normal has to be processed first so that 'bg' and 'fg' can be used.
call Steampunklights.HL('Normal', ["white", "black"])
call Steampunklights.Highlight({
\   'Keyword Statement':      ["lightblue"],
\   'Identifier':             ["chartreuse", "bold"],
\   'Comment Folded':         ["lightgray", "bg"],
\   'LineNr Special':         ["gray"],
\   'CursorLineNr':           ["burn"],
\   'String Directory Title': ["blurple"],
\   'Type StorageClass':      ["banana", "bold"],
\   'Operator Constant':      ["hotpink"],
\   'Cursorline':             ["clear", "darkgray"],
\   'Function':               ["coffee"],
\   'Number Preproc Macro':   ["navy"],
\   'WildMenu PmenuSel':      ["bg", "blurple"],
\   'StatuslineNC':           ["none", "white"],
\   'Statusline':             ["none", "dimgray"],
\   'Pmenu':                  ["white", "dimgray"],
\   'Delimiter SignColumn':   ["clear"],
\   'Boolean':                ["hotpink", "bold"],
\   'Visual':                 ["clear", "dimgray"],
\   'VertSplit':              ['dimgray', 'dimgray'],
\   'WarningMsg':             ['hotpink'],
\   'NonText':                ["blurple"],
\   'MoreMsg Question':       ["chartreuse"],
\ },'Defaults')

call Steampunklights.Highlight({
\   'DiffAdd(ed|.)':        ["chartreuse"],
\   'diff(Removed|Delete)': 'Operator',
\   'DiffChange':           ["banana"],
\   'diffLine':             'Directory',
\   'diffSubname':          'Normal',
\   'diffFile':             'PreProc',
\   'diffIndexLine':        'Macro',
\ },'Diff')
" }}}
" Plugin Spercific {{{
" GitGutter {{{
call Steampunklights.Highlight({
\   'GitGutterAddDefault':    'Identifier',
\   'GitGutterChangeDefault': 'Type',
\   'GitGutterDeleteDefault': 'Boolean',
\ },'GitGutter')
" }}}
" Signify {{{
call Steampunklights.Highlight({
\   'SignifySignDelete': 'Operator',
\   'SignifySignChange': ["orange"],
\ },'Signify')
" }}}
" Signature {{{
call Steampunklights.Highlight({
\   'SignatureMarkText':   'String',
\   'SignatureMarkerText': 'Statement',
\ },'Signature')
" }}}
" }}}
" Personal Statusline {{{
call Steampunklights.Highlight({
\   'C1':  ["black", "chartreuse"],
\   'C2':  ["black", "midgray"],
\   'C3':  ["lightgray", "darkgray"],
\ },'Statusline')
" }}}

" vim: fdm=marker:fdl=0
