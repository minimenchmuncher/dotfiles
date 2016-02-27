"--Universal Options--
" encoding detection
set encoding=utf-8
set fillchars=stl:-,stlnc:-,vert:\│
source ~/.vim/bundles.vim
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set clipboard=unnamed

" enable filetype detection and ft specific plugin/indent
filetype plugin indent on

" enable syntax.
syntax on
au BufNewFile,BufRead *.plist,*.lmx set filetype=xml
au BufNewFile,BufRead *.psql,*.pgsql set filetype=sql
au BufNewFile,BufRead *.Rmd,*.rmd set filetype=md
"--User Interface--
set background=dark
colorscheme solarized
" and make a few adjustments
"hi Normal ctermbg=NONE
"hi Folded ctermbg=NONE
"hi NonText ctermbg=None
"hi VertSplit ctermbg=White ctermbg=NONE cterm=NONE
"au WinLeave * set nocursorline "nocursorcolumn " Highlight current line
"au WinEnter * set cursorline "cursorcolumn     "
set lazyredraw  " don't redraw all of the time
set magic       " turn on regexes

"set cursorline cursorcolumn

"-search settings
set incsearch
" don't set highlight here
" set highlight
set ignorecase
set smartcase

"-editor settings
set history=1000                              " Lots of lines
set nocompatible                              " dunno?
"set nofoldenable                              " no folds??
set confirm                                   " confirm when exiting unsaved file
set backspace=indent,eol,start                " More powerful backspacing
set t_Co=256                                  " Explicitly tell vim I haz 256 colors
set mouse=a                                   " this may need external options too...
set report=0                                  " always report # lines changed
set nowrap                                    " don't wrap lines
set scrolloff=5                               " set num lines above/below cursor when scrolling
set number                                    " show line numbers
set showmatch                                 " show matching bracket (jumps briefly?)
set showcmd                                   " show command in status bar
set title                                     " show filename in titlebar
set matchtime=2                               " limit match time for bracket (*.1 sec)
set laststatus=2

" indentation
set autoindent
set smartindent    " indent when
set tabstop=4      " tabwidth
set softtabstop=4  " backspace
set shiftwidth=4   " indent width
set expandtab      " expand tab to space
set linespace=0    " for vim-airline?

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml,xml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0 matchpairs+=<:>

"autocmd Syntax javascript set syntax=jquery
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"-- Plugin Settings --

" tabbar
"let g:TB_MaxSize = 2
"let g:Tb_TabWrap = 1
"
"hi Tb_Normal guifg=white ctermfg=white
"hi Tb_Changed guifg=green ctermfg=green
"hi Tb_VisibleNormal ctermbg=252 ctermfg=235
"hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white

" tagbar
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
"" for R support
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 's:Sections',
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
    \ }

" CtrlP
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.(.git|hg|svn)|\_site|\_\_pycache\_\_)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
  \}
" use nearest .git directy as cwd
let g:ctrlp_working_path_mode = 'r'
" map leader-p to CtrlP
nmap <leader>p :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>


" powerline / airline
"set rtp+=$HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
set laststatus=2                              " use # lines in status bar (requires powerline)
set showtabline=1   " show tabs, even if not present
set noshowmode      " don't show the bottom -- INSERT -- line
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
"
set guifont=Source\ Code\ Pro\ for\ Powerline
"let g:Powerline_symbols = "fancy"
"set guifont=Menlo
"set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
"if has ("guirunning")
"    let s:uname = system("uname")
"    if s:uname == "Darwin\n"
"        set guifont=Source\ Code\ Pro\ for\ Powerline
"    endif
"endif

" Syntastic
let g:syntastic_python_python_exec = '/usr/local/bin/python3'

"" YouCompleteMe
"let g:ycm_complete_in_comments = 0 " don't complete in comments
"let g:ycm_complete_in_strings = 0  " don't complete when typing strings, either!
"let g:ycm_seed_identifiers_with_syntax = 1 " seed matches with vim syntax
"let g:ycm_path_to_python_interpretr = '/usr/local/bin/python3' " use python3 for ycmd
"let g:ycm_autoclose_preview_window_after_insertion = 1 " close preview window after leaving insert mode

" NERDTree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '*/__pycache__/']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = 'right'

" Vim R plugin
let vimrplugin_assign = 2 " I want my underscores back!!
"let vimrplugin_applescript = 0 " try this for enableing osascript.

" Keybindings for plugin toggle
nnoremap <F1> :set invpaste paste?<CR>
set pastetoggle=<F1>
nmap <F5> :TagbarToggle<CR>
nmap <F6> :NERDTreeToggle<CR>
nmap <F3> :GundoToggle<cr>
nmap <F4> :IndentGuidesToggle<cr>
nmap  <D-/> :
nnoremap <leader>v v`]

"highlight search matches
set hlsearch

set foldmethod=indent

" remap F2 to resync syntax
noremap <F2> <Esc>:syntax sync fromstart<CR>
inoremap <F2> <C-o>:syntax sync fromstart<CR>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" w!! = sudo write file
cmap w!! %!sudo tee > /dev/null %

" tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>



" edit/reload vimrc file
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>
