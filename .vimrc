colo tranquility
set number
syntax on
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set showmatch
filetype on
set history=100
set ruler
set clipboard+=unnamed
set autowrite
" set cursorline
set magic
set foldenable
set foldlevel=4
set foldmethod=indent
set foldcolumn=0
set ff=unix
set completeopt=preview,menu
filetype plugin indent on
set mouse=a
" Ctr + \ , open current file vertical
map <C-\> :vsp <CR>
" ===============================================
" NerdTree

nnoremap <silent> <F5> :NERDTree<CR>
" 按F5就会自动展开目录树
map <Leader>n <plug>NERDTreeTabsToggle<CR>
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
"显示行号
let NERDTreeShowLineNumbers=1

map <Leader>n <plug>NERDTreeTabsToggle<CR>

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
" vim-css-color
let g:cssColorVimDoNotMessMyUpdatetime = 1
" Ctr + Right , moves to the next tab
map  <C-Right> :tabn<CR>
" Ctr + Left , moves to the previous tab
map  <C-Left> :tabp<CR>
" Ctr + n , creates a new tab
map  <C-n> :tabnew<CR>


" ===============================================
" vim-javascript

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

" vim-indent-guides

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=4
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=3
let g:indent_guides_guide_size = 1

"
"選擇全部
nmap <C-a> ggVG"*yG<CR>

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete


set nocompatible              " 去除VI一致性,必须要添加
filetype off                  " 必须要添加

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'skammer/vim-css-color'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'






" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'

" 你的所有插件需要在下面这行之前
call vundle#end()



filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall     - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
