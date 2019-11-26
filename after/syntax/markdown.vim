" multi-markdown
"
" Syntax Guide:
" https://github.com/fletcher/MultiMarkdown/wiki/MultiMarkdown-Syntax-Guide
"
" Tables
syn region  mmdTable start="^\%(\[.*\]\n\)\{}.*|.*\n[-|\:\. ]\+$" end="\%(\n\[.*\]\n\)\{}\ze\n[^|]\+\n$" keepend contains=mmdTableHeader,mmdTableHeadDelimiter,mmdTableDelimiter,mmdTableCaption
syn match   mmdTableDelimiter "|" contained
syn match   mmdTableAlign "[\.:]" contained
syn region  mmdTableHeader start="^\zs.*\ze\n[-|\:\. ]\+$" end="$" nextgroup=mmdTableHeadDelimiter contained contains=mmdTableDelimiter
syn match   mmdTableHeadDelimiter "^[-|\:\.\ ]\+$" contained contains=mmdTableDelimiter,mmdTableAlign
syn region mmdTableCaption matchgroup=mmdTableCaptionDelimiter start="^\[" end="\]$" keepend contained

hi! link mmdTableHeader           Constant
hi! link mmdTableDelimiter        Delimiter
hi! link mmdTableAlign            Identifier
hi! link mmdTableHeadDelimiter    Delimiter
hi! link mmdTableCaptionDelimiter Delimiter
hi! link mmdTableCaption          Comment

" footnotes
syn region mmdFootnoteMarker matchgroup=mmdFootnoteDelimiter start="\[^" end="\]" keepend
hi! link mmdFootnoteDelimiter  Delimiter
hi! link mmdFootnoteMarker     Constant

syn region mdInlineCode matchgroup=mdCode start=/`/ end =/`/ contains=mdInlineCodeStartMark, mdInlineCodeEndMark concealends
syn match mdInlineCodeStartMark /`/ contained containedin=mdInlineCode conceal
syn match mdInlineCodeEndMark /`/ contained containedin=mdInlineCode conceal

" CriticMarkup
" reference: http://criticmarkup.com
syn region mdCriticAddition matchgroup=mdCriticAdd start=/{++/ end=/++}/ contains=mdCriticAddStartMark, mdCriticAddEndMark concealends
syn match  mdCriticAddStartMark /{++/ contained containedin=mdCriticAddition  conceal
syn match  mdCriticAddEndMark /++}/ contained containedin=mdCriticAddition conceal

syn region mdCriticDeletion matchgroup=mdCriticDel start=/{--/ end=/--}/ contains=mdCriticDelStartMark,mdCriticDelEndMark concealends
syn match  mdCriticDelStartMark /{--/ contained conceal
syn match  mdCriticDelEndMark /--}/ contained conceal

syn region mdCriticSubRemove start=/{\~\~/ end=/.\(\~>\)\@=/ keepend
syn match  mdCriticSubStartMark /{\~\~/ contained containedin=mdCriticSubRemove conceal
syn region mdCriticSubstitute start=/\~>/ end=/\~\~}/ keepend
syn match  mdCriticSubTransMark /\~>/ contained containedin=mdCriticSubstitute conceal
syn match  mdCriticSubEndMark /\~\~}/ contained containedin=mdCriticSubstitute conceal

syn region mdCriticComment matchgroup=mdCriticCom start=/{>>/ end=/<<}/ contains=mdCriticCommentStartMark, mdCriticCommentEndMark concealends
syn match  mdCriticCommentStartMark /{>>/ contained containedin=mdCriticComment conceal
syn match  mdCriticCommentEndMark /<<}/ contained containedin=mdCriticComment conceal

syn region mdCriticHighlight matchgroup=mdCriticExtra start=/{==/ end=/==}/ concealends

" Color Wheel Colors

hi RedFg          ctermfg=NONE guifg=#ff0000 
hi VermilionFg    ctermfg=NONE guifg=#ff4000 
hi OrangeFg       ctermfg=NONE guifg=#ff8000 
hi AmberFg        ctermfg=NONE guifg=#ffc000 
hi YellowFg       ctermfg=NONE guifg=#ffff00 
hi ChartreuseFg   ctermfg=NONE guifg=#99eb00 
hi GreenFg        ctermfg=NONE guifg=#00cc00 
hi ViridianFg     ctermfg=NONE guifg=#00ad91 
hi BlueFg         ctermfg=NONE guifg=#3333ff 
hi VioletFg       ctermfg=NONE guifg=#5533e6 
hi PurpleFg       ctermfg=NONE guifg=#aa66cc 
hi MagentaFg      ctermfg=NONE guifg=#ff0080 

hi ForestGreenFg  ctermfg=NONE guifg=#47a628 
hi TundoraLightFg ctermfg=240  guifg=#4A4A4A

hi! link mdCriticAdd                    ForestGreenFg      " #47a628
hi! link mdCriticAddition               ForestGreenFg      " #47a628
hi! link mdCriticAddStartMark           ForestGreenFg      " #47a628
hi! link mdCriticAddEndMark             ForestGreenFg      " #47a628
hi! link mdCriticDel                    RedFg              " #ff0000
hi! link mdCriticDeletion               TundoraLightFg     " #4A4A4A
hi! link mdCriticDelStartMark           RedFg              " #ff0000 
hi! link mdCriticDelEndMark             RedFg              " #ff0000
hi! link mdCriticSubRemove              TundoraLightFg     " #4A4A4A
hi! link mdCriticSubStartMark           OrangeFg           " #ff8000
hi! link mdCriticSubstitute             OrangeFg           " #ff8000
hi! link mdCriticSubTransMark           OrangeFg           " #ff8000
hi! link mdCriticSubEndMark             OrangeFg           " #ff8000
hi! link mdCriticComment                PurpleFg           " #aa66cc
hi! link mdCriticCommentStartMark       PurpleFg           " #aa66cc
hi! link mdCriticCommentEndMark         PurpleFg           " #aa66cc
hi! link mdCriticCom                    PurpleFg           " #aa66cc
hi! link mdCriticHighlight              AmberFg            " #ffc000
hi! link mdCriticExtra                  AmberFg            " #ffc000
"
hi! link mdCode                         markdownCodeBlock
hi! link mdInlineCode                   markdownCodeBlock

