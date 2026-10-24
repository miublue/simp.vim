" 
"  ########  ######  ##      ##  ######## 
" ###          ##    ####  ####  ##     ##
"  #######     ##    ## #### ##  ##     ##
"       ###    ##    ##  ##  ##  ######## 
"        ##    ##    ##      ##  ##         
" ########   ######  ##      ##  ##         
"
" Name:       simp.vim
" Mantainer:  Miu <https://github.com/miublue>
" Original:   https://github.com/miublue/momo.vim
" License:    MIT
"
" Minimalistic dark/light theme for Vim based on momo.

let s:is_dark=(&background == "dark")
highlight clear

if exists('syntax_on')
    syntax reset
endif

let g:colors_name='simp'

let s:bg_col = s:is_dark? ['#000000',  16] : ['#ffffff', 231]
let s:fg_col = s:is_dark? ['#ffffff', 231] : ['#000000',  16]
if get(g:, 'high_contrast_keywords', 0)
    let s:hl_col = ['#ff5faf', 205]
    let s:cs_col = ['#ff5faf', 205]
else
    let s:hl_col = s:is_dark? ['#bcbcbc', 249] : ['#808080', 244]
    let s:cs_col = s:is_dark? ['#bcbcbc', 249] : ['#808080', 244]
endif
let s:cm_col = s:is_dark? ['#808080', 244] : ['#bcbcbc', 249]
let s:da_col = ['#00d787',  42]
let s:dc_col = ['#87afff', 111]
let s:dd_col = ['#ff5faf', 205]
let s:sp_col = ['#ff5faf', 205]
let s:sl_col = ['#000000',  16]
let s:none   = ['NONE', 'NONE']

function! s:hl(item, foreground, background, style)
    let cmd  = 'highlight ' . a:item
    let cmd .= ' guifg=' . a:foreground[0] . ' ctermfg=' . a:foreground[1]
    let cmd .= ' guibg=' . a:background[0] . ' ctermbg=' . a:background[1]
    let cmd .= ' gui=' . a:style . ' cterm=' . a:style
    execute cmd
endfunction

" Transparent Background
if (get(g:, 'transparent_background', 0) == 1)
    call s:hl('Normal',      s:fg_col, s:none,   'NONE')
else
    call s:hl('Normal',      s:fg_col, s:bg_col, 'NONE')
endif

" Basic
call s:hl('Cursor',          s:fg_col, s:bg_col, 'REVERSE') " Cursor for GUI version
call s:hl('Folded',          s:fg_col, s:none,   'REVERSE')
call s:hl('WildMenu',        s:fg_col, s:none,   'REVERSE')
call s:hl('MatchParen',      s:sp_col, s:bg_col, 'UNDERLINE')

" Misc
call s:hl('Directory',       s:hl_col, s:none,   'NONE')
call s:hl('Ignore',          s:hl_col, s:none,   'NONE')
call s:hl('NonText',         s:cm_col, s:none,   'NONE')
call s:hl('SpecialKey',      s:hl_col, s:none,   'NONE')
call s:hl('Underlined',      s:hl_col, s:none,   'UNDERLINE')
call s:hl('Title',           s:hl_col, s:none,   'NONE')

" Status Line
call s:hl('StatusLine',      s:fg_col, s:none,   'UNDERLINE')
call s:hl('StatusLineNC',    s:cm_col, s:none,   'UNDERLINE')
call s:hl('VertSplit',       s:fg_col, s:none,   'NONE')

" Lines
call s:hl('CursorColumn',    s:none,   s:none,   'NONE')
call s:hl('CursorLine',      s:none,   s:none,   'NONE')
call s:hl('LineNr',          s:cm_col, s:none,   'NONE')
call s:hl('CursorLineNr',    s:hl_col, s:none,   'BOLD')

" Visual
call s:hl('Visual',          s:sl_col, s:sp_col, 'NONE')
call s:hl('VisualNOS',       s:sl_col, s:sp_col, 'NONE')
call s:hl('Search',          s:sl_col, s:sp_col, 'NONE')
call s:hl('IncSearch',       s:sl_col, s:sp_col, 'NONE')

" Messages
call s:hl('WarningMsg',      s:hl_col, s:none,   'BOLD')
call s:hl('ErrorMsg',        s:hl_col, s:none,   'BOLD')
call s:hl('ModeMsg',         s:hl_col, s:none,   'BOLD')
call s:hl('MoreMsg',         s:hl_col, s:none,   'BOLD')
call s:hl('Error',           s:hl_col, s:none,   'BOLD')

" Popup Menu
call s:hl('Pmenu',           s:fg_col, s:bg_col, 'NONE')
call s:hl('PmenuSbar',       s:fg_col, s:bg_col, 'NONE')
call s:hl('PmenuSel',        s:hl_col, s:bg_col, 'REVERSE')
call s:hl('PmenuThumb',      s:bg_col, s:bg_col, 'NONE')

" Tab Line
call s:hl('TabLine',         s:fg_col, s:none,   'NONE')
call s:hl('TabLineFill',     s:fg_col, s:none,   'NONE')
call s:hl('TabLineSel',      s:hl_col, s:none,   'UNDERLINE')

" Diffs
call s:hl('DiffDelete',      s:dd_col, s:none,   'NONE')
call s:hl('DiffChange',      s:dc_col, s:none,   'NONE')
call s:hl('DiffText',        s:dc_col, s:none,   'NONE')
call s:hl('DiffAdd',         s:da_col, s:none,   'NONE')

" Syntax
call s:hl('Comment',         s:cm_col, s:none,   'NONE')
highlight! link Todo         Comment

call s:hl('Identifier',      s:fg_col, s:none,   'NONE')
call s:hl('Function',        s:fg_col, s:none,   'NONE')

call s:hl('Constant',        s:cs_col, s:none,   'NONE')
highlight! link Number       Constant
highlight! link String       Constant
highlight! link Character    Constant
highlight! link Boolean      Constant
highlight! link Float        Constant

call s:hl('Operator',        s:hl_col, s:none,   'NONE')
call s:hl('Keyword',         s:hl_col, s:none,   'BOLD')
highlight! link Statement    Keyword
highlight! link Structure    Keyword
highlight! link Conditional  Keyword
highlight! link Exception    Keyword
highlight! link Tag          Keyword
highlight! link Label        Keyword
highlight! link Special      Keyword
highlight! link SpecialChar  Keyword

call s:hl('Type',            s:hl_col, s:none,   'BOLD')
highlight! link TypeDef      Type
highlight! link StorageClass Type

call s:hl('PreProc',         s:hl_col, s:none,   'BOLD')
highlight! link PreCondit    PreProc
highlight! link Include      PreProc
highlight! link Define       PreProc
highlight! link Macro        PreProc

