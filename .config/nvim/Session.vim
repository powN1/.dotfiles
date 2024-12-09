let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +29 lua/plugins/init.lua
badd +8 code.js
badd +95 lua/chadrc.lua
badd +6 .prettierrc.json
badd +146 lua/plugins/override/cmp.lua
argglobal
%argdel
edit lua/plugins/override/cmp.lua
argglobal
balt lua/plugins/override/cmp.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
8,10fold
30,31fold
32,33fold
34,35fold
28,36fold
26,37fold
25,38fold
42,45fold
49,53fold
46,54fold
17,57fold
13,58fold
62,70fold
61,71fold
79,80fold
86,87fold
100,102fold
103,105fold
106,107fold
108,109fold
76,110fold
113,114fold
117,120fold
122,124fold
116,125fold
128,129fold
127,130fold
146,148fold
153,154fold
155,156fold
152,157fold
158,159fold
160,161fold
151,162fold
163,165fold
170,171fold
172,173fold
169,174fold
175,176fold
177,178fold
168,179fold
180,182fold
135,183fold
185,191fold
74,192fold
195,196fold
206,210fold
205,212fold
200,214fold
199,215fold
let &fdl = &fdl
let s:l = 146 - ((24 * winheight(0) + 25) / 50)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 146
normal! 0
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
