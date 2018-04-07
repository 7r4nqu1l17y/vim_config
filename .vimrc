"===============================================
"General

colo peachpuff
set number

" 開啟上色模式
syntax on
set autoindent
set smartindent
" set tabstop=4 et
" set shiftwidth=4
set ts=4 sw=4 et
set smarttab
set softtabstop=4
set showmatch
filetype on
set history=100
set ruler
set clipboard+=unnamed
set autowrite
"set cursorline
set magic
set foldenable
set foldlevel=4
set foldmethod=indent
set foldcolumn=0
set ff=unix
set completeopt=preview,menu
filetype plugin indent on
set mouse=a

" # ejs syntax highlight
au BufNewFile,BufRead *.ejs set filetype=html

"搜尋不分大小寫
set ic
"顯示相對行號
set relativenumber

"自動縮排，啟用自動縮排以後，在貼上剪貼簿的資料時排版可能會亂掉，這時可以手動切換至貼上模式 :set paste 再進行貼上
set ai!

"Ctr + \ , open current file vertical
map <C-\> :vsp <CR>

"===============================================
"NerdTree
let g:NERDTreeWinSize = 20 
nnoremap <silent> <F5> :NERDTree<CR>
"按F5就会自动展开目录树
map <Leader>n <plug>NERDTreeTabsToggle<CR>
"在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
"显示行号
let NERDTreeShowLineNumbers=1

map <Leader>n <plug>NERDTreeTabsToggle<CR>

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
"vim-css-color
let g:cssColorVimDoNotMessMyUpdatetime = 1
"Ctr + Right , moves to the next tab
map  <C-Right> :tabn<CR>
"Ctr + Left , moves to the previous tab
map  <C-Left> :tabp<CR>
"Ctr + n , creates a new tab
map  <C-n> :tabnew<CR>



"set status line
set laststatus=1
" enable powerline-fonts
let g:airline_powerline_fonts = 1

"===============================================
"{<([符号自动补全

inoremap < <><ESC>i
inoremap > <c-r>=ClosePair('>')<CR>
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {<CR>}<ESC>O
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i


"===============================================
"vim-javascript

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
set foldmethod=syntax
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = ""
let g:javascript_conceal_underscore_arrow_function = ""
set conceallevel=1

"============================================
"ale

"保持侧边栏可见
let g:ale_sign_column_always = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
" Set this in your vimrc file to disabling highlighting
let g:ale_set_highlights = 0

"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
"<Leader>s触发/关闭语法检查
"nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
"nmap <Leader>d :ALEDetail<CR>


"=================================================
"neocomplete

"Note This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1
" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1
" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"For perlomni.vim setting.
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"=================================================
"vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=4
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=3
let g:indent_guides_guide_size = 1


"=================================================
"powerline
set laststatus=2
let g:Powerline_symbols= 'unicode'

"選擇全部
nmap <C-a> ggVG"*yG<CR>

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete



"=================================================
set nocompatible              " 去除VI一致性,必须要添加
filetype off                  " 必须要添加

"设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


"=================================================
"Plugin
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'skammer/vim-css-color'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'w0rp/ale'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'isRuslan/vim-es6'
Plugin 'shougo/neocomplete.vim'
Plugin 'Lokaltog/vim-powerline.git'


"以下范例用来支持不同格式的插件安装.
"请将安装插件的命令放在vundle#begin和vundle#end之间.
"Github上的插件
"格式为 Plugin '用户名/插件仓库名'

"你的所有插件需要在下面这行之前
call vundle#end()



filetype plugin indent on
"忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"常用的命令
":PluginList       - 列出所有已配置的插件
":PluginInstall     - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
":PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
":PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"查阅 :h vundle 获取更多细节和wiki以及FAQ
