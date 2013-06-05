"stops vim from behaving in a strongly vi compatible way, need by many plug-ins
set nocompatible

"------------------------------
" NeoBundle Settings
" Note: don't include neobundle setting in .gvimrc
"------------------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" vimproc is recommended. After install, manually use shell ~/.vim/bundle/vimproc, 
" (n,g)make -f your_machines_makefile, or the following command can handle it.
" Since I only use vim under Linux, I removed all other cases
NeoBundle 'Shougo/vimproc', {'build' : { 'unix' : 'make -f make_unix.mak', },}

" Other plugins from Shougo
NeoBundle 'Shougo/neocomplcache'                    "new autocomplete plugin
NeoBundle 'Shougo/neosnippet'                       "new snippet plugin
NeoBundle 'Shougo/unite.vim'                        "another ctrlp-like plugin

" Fast editing
NeoBundle 'tsaleh/vim-matchit'                      "use % to jump between marker
NeoBundle 'Lokaltog/vim-easymotion'                 "simpler way to move in vim
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}       "edit HTML code faster
NeoBundle 'godlygeek/tabular'                       "fasting tabluarize text
"NeoBundle 'Raimondi/delimitMate'

" vim-scripts repos
NeoBundle 'L9'                                      "some utility functions and commands
NeoBundle 'FuzzyFinder'                             "fuzzy search of buffer/file/command/bookmark/tag
NeoBundle 'ctrlp.vim'                               "like fuzzyfinder

" Language support plugin
NeoBundle 'c.vim'                                   "cpp/c 
NeoBundle 'a.vim'                                   "cpp/c source/header switch
NeoBundle 'rails.vim'                               "rails plugin
NeoBundle 'tpope/vim-surround'                      "cs/ds/ys for surroundings of markup languages
"NeoBundle 'klen/python-mode'                        "python mode testing 

" IDE features
NeoBundle 'The-NERD-tree'                           "tree explorer plugin for navigating filesystem
"NeoBundle 'TabBar'                                  "miniBufExplorer-like plugin
NeoBundle 'Tagbar'                                  "tag/funtion window of source code
NeoBundle 'ack.vim'                                 "plugin to use perl Ack
NeoBundle 'tpope/vim-fugitive'                      "git plugin
NeoBundle 'Lokaltog/vim-powerline'                  "fancy status line
NeoBundle 'sjl/gundo.vim'                           "vim plugin to visualize vim undo tree
NeoBundle 'bufkill.vim'                             "kill buffer and close window
NeoBundle 'scrooloose/nerdcommenter'                "use to comment for all languages
NeoBundle 'nathanaelkane/vim-indent-guides'         "indent guide for ide feature



" Non github repos
NeoBundle 'git://git.wincent.com/command-t.git'    "Need ruby support in vim

" Non git repos
"NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
"NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

" ...
filetype plugin indent on     " Required!
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck


"------------------------------
" General setting here
"------------------------------
" Encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" File handling
filetype on
filetype plugin on
syntax on                                           "souce code highlight syntax
syntax enable

" You can have unwritten changes to a file and open a new file without being
" forced to write or undo your change first. Absolutely must-have
set hidden

au FocusLost * :wa                                  "autosave on losing focus

" UI settings
set gfn=Monospace\ 9
"autocmd BufEnter * :syntax sync fromstart
set background=dark
set laststatus=2                                    "use 2 lines for the status bar
set t_Co=256                                        "256 color
set title                                           "show file in titlebar
set showcmd                                         "show typed command in status bar
set showmode
set scrolloff=5                                     "5 lines above/below cursor when scrolling
set report=0                                        "always report number of lines changes
set nofoldenable                                    "never folding
set history=1000
set number                                          "line number
set autoread		                                "autoload the file when modified
set nobackup	                                    "no more useless backup files
set noswapfile
set nowritebackup
set wildmenu		                                "add autocomplete in the cmd mode
set confirm			                                "prompt message when unsaved or readonly file

" VimTip 80: Restore cursor to file position in previous editing session
" for unix/linux/solaris
set viminfo='10,\"100,:20,%,n~/.viminfo

" only for windows [give some path to store the line number info]
"set viminfo='10,\"100,:20,%,nc:\\Winnt\\_viminfo
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Mouse settings
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"setting about searching
"set showmatch		                                "highlight the matching parenthesis
set matchtime=5		                                "parenthesis matching time about 1/10 second

" Indent setting
set autoindent		                                "inherit the indent of previous line
set smartindent	                                    "necessary for indent mode
set cindent			                                "use c-style indent

set expandtab                                       "expand tab to space
set smarttab                                        "bs and tab auto align
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Search settings
set ignorecase		                                "ignore up/low case when searching
set smartcase                                       "when input any upper case, ignorecase cancelled
set incsearch		                                "highlight incrementally when searching
"set ruler			                                "show the ruler at the right botton corner
set hlsearch		                                "highlight the search results
set incsearch                                       "show search matches as you type

" Color scheme
"colorscheme ir_black
"colorscheme molokai
"let g:molokai_original = 1

" Color customized settings
hi PmenuSel ctermbg=darkcyan
" with highlight current line if the line is too long
highlight OverLength ctermbg=darkblue ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

" Cursor line color settings
hi CursorLine   cterm=NONE ctermbg=black  guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=black  guibg=darkred guifg=white

"autocmd InsertEnter,InsertLeave * set cul!
autocmd InsertEnter * set cul
autocmd InsertLeave * set cul!

"Ctags configuration
set tags=tags;
set autochdir

set clipboard=unnamedplus

"------------------------------
" General key settings
"------------------------------

"enable the alt key mapping in normal terminal found this at 
"http://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim"
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

"Enable windows copy/cut/paste and selection
" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

"CTRL-W is close current buffer
noremap <C-w>		:bd<CR>
vnoremap <C-w>		<C-C>:bd<CR>
inoremap <C-w>		<C-O>:bd<CR>

"Ctrl-q to quite vim
noremap <A-q>		:q!<CR>
vnoremap <A-q>		<C-C>:q!<CR>
inoremap <A-q>		<C-O>:q!<CR>

"CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

"CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

"CTRL-V and SHIFT-Insert are Paste
noremap <C-V>		"+gP
inoremap <C-V>		<C-O>"+gp
vnoremap <C-V>		"+gp

"CTRL-C and SHIFT-Insert are Paste
noremap <C-C>		"+y
inoremap <C-C>		<C-O>"+y
vnoremap <C-C>		"+y

"window switch operation
nnoremap <A-w> <C-w>
inoremap <A-w> <C-\><C-O><C-w>
vnoremap <A-w> <C-w>

"delete current line
nnoremap <silent> <C-d> dd
inoremap <silent> <C-d> <C-O>dd
vnoremap <silent> <C-d> dd

"map end of line, beginning of line
nnoremap <silent> <A-l> 0
inoremap <silent> <A-l> <C-O>0
vnoremap <silent> <A-l> 0

nnoremap <silent> <C-l> $
inoremap <silent> <C-l> <C-\><C-O>$
vnoremap <silent> <C-l> $

"search use ack-grep
nnoremap <f7> :Ack<SPACE>
inoremap <f7> <C-O>:Ack<SPACE>
vnoremap <f7> <C-C>:Ack<SPACE>

" Change the leader key
let mapleader = ","
nnoremap ; :
inoremap jj <ESC>
cnoremap jj <ESC>

nnoremap <leader><space> :noh<CR>


"configure the ctrlp plugin
let g:ctrlp_map = '<f8>'
"Set Alt-R as open recent edited files
nnoremap <silent> <A-r> :CtrlPMRU<CR>
inoremap <silent> <A-r> <C-O>:CtrlPMRU<CR>
vnoremap <silent> <A-r> <C-C>:CtrlPMRU<CR>

"configure the tagbar plugin 
let g:tarbar_singleclick = 1

"Set Alt-D as showing all opened buffers
nnoremap <silent> <A-d> :CtrlPBuffer<CR>
inoremap <silent> <A-d> <C-O>:CtrlPBuffer<CR>
vnoremap <silent> <A-d> <C-C>:CtrlPBuffer<CR>

let g:ackprg="ack-grep -H --nocolor --nogroup --column"
"nnoremap <tab> %
"vnoremap <tab> %

"compile current project
"nnoremap <C-r> :cd ../build<CR>:make<CR> 
"inoremap <C-r> <ESC>:cd ../build<CR>:make<CR>a
"vnoremap <C-r> <C-C>:cd ../build<CR>:make<CR>

"Error handling
nnoremap <silent> <F3> :cn<CR>
inoremap <silent> <F3> <C-O>:cn<CR>
nnoremap <silent> <F2> :cp<CR>
inoremap <silent> <F2> <C-O>:cp<CR>

"remap HJKL to make it more intuitively
noremap i k
noremap k j
noremap j h
noremap h i
noremap H I

"easier navigation between split windows
nnoremap <silent><A-down> <c-w>j
inoremap <silent><A-down> <C-O><c-w>j
nnoremap <A-up> <c-w>k
inoremap <silent><A-up> <C-O><c-w>k
nnoremap <A-left> <c-w>h
inoremap <silent><A-left> <C-O><c-w>h
nnoremap <A-right> <c-w>l
inoremap <silent><A-right> <C-O><c-w>l


"Keybindings for plugin toggle
nmap <F5> :TagbarToggle<cr>
imap <F5> <C-O>:TagbarToggle<cr>
"nmap <F5> :make<cr>
"imap <F5> <C-O>:make<cr>
nmap <F6> :NERDTreeToggle<cr>
"nmap <F3> :GundoToggle<cr>
"nmap <F4> :IndentGuidesToggle<cr>
nmap  <D-/> :
nnoremap <leader>a :Ack
nnoremap <leader>v V`]

"Some key settings for specific file type
"I want to set F4 as the universal execute key
autocmd FileType python nnoremap <F4> :!python %<CR>
autocmd FileType python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd FileType c set makeprg=make
autocmd FileType cpp set makeprg=make
"autocmd FileType python set makeprg=python\ %

"easy-motion
let g:EasyMotion_leader_key = '<Leader>'

"------------------------------
" ctrlp.vim settings 
"------------------------------
let g:ctrlp_show_hidden = 1

set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

"------------------------------
" neocomplcache settings
"------------------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"

inoremap <expr><ScrollWheelUp>    neocomplcache#close_popup() . "\<ScrollWheelUp>"
inoremap <expr><ScrollWheelDown>  neocomplcache#close_popup() . "\<ScrollWheelDown>"

" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"------------------------------
" neosnippet settings (should be after neocomplcache)
"------------------------------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tagbar
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1

hi Tb_Normal guifg=white ctermfg=white
hi Tb_Changed guifg=green ctermfg=green
hi Tb_VisibleNormal ctermbg=252 ctermfg=235
hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white

let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
" tag for coffee
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }

  let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'sort' : 0,
    \ 'kinds' : [
        \ 'h:sections'
    \ ]
    \ }
endif

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"

" nerdcommenter
let NERDSpaceDelims=1
nmap <C-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1


autocmd BufNewFile,BufRead wscript* set filetype=python
autocmd BufNewFile,BufRead wscript* set makeprg=waf
