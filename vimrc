" dein Scripts-----------------------------
" mkdir -p ~/.vim/bundle
" curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
" sh installer.sh ~/.vim/bundle
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundle')
  call dein#begin('~/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('Shougo/neosnippet.vim')
  " call dein#add('Shougo/neosnippet-snippets')
  call dein#add('scrooloose/nerdtree')
  " Rails/sinatra/rspec等スニペットによる補完
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  " " 辞書閲覧
  call dein#add('thinca/vim-ref')
  " " statuslineのデザイン変更
  call dein#add('itchyny/lightline.vim')
  " " ファイルの構文エラーチェック
  call dein#add('scrooloose/syntastic')
  " " :BenchVimrc vim起動速度測定
  call dein#add('mattn/benchvimrc-vim')
  " " NeoBundle vim用syntax & snippets
  call dein#add('glidenote/roadworker.vim')
  " " インデントに色を付けて見やすくする
  call dein#add('nathanaelkane/vim-indent-guides')
  " " ctag
  call dein#add('majutsushi/tagbar')
  " " html5
  " call dein#add('othree/html5.vim')
  " " html5 check
  call dein#add('othree/html5.vim')
  call dein#add('hokaccha/vim-html5validator')
  " " css3
  call dein#add('hail2u/vim-css3-syntax')
  " " vuejs
  call dein#add('posva/vim-vue')
  " " javascript
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('altercation/solarized')
  call dein#add('nanotech/jellybeans.vim')
  call dein#add('w0ng/vim-hybrid')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('chriskempson/tomorrow-theme')
  call dein#add('tomasr/molokai')
  call dein#add('sjl/badwolf')
  call dein#add('djjcast/mirodark')

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

filetype plugin indent off
" changelog
" let changelog_user         = system("echo -n ${USER} @ `hostname -s`")
let g:changelog_timeformat = "%Y-%m-%d"
" let g:changelog_username   = changelog_user

" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" 環境拡張用
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" マシン固有の設定は.vimrc.localに用意して読み込む
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
" Mac用の設定を用意
if has('mac')
  source ~/.vimrc.mac
endif

" _____________________________________________________________________________
" -----------------------------------------------------------------------------
" 一般設定
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" コマンド、検索パターンを50個まで履歴に残す
set history=50
" 256色化
set t_Co=256
" 配色設定
set background=dark
" 入力モード中に素早くJJと入力した場合はESCとみなす
" inoremap jj <Esc>
" tagの設定
set tags=$HOME/tags

" 文末スペースハイライト
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

colorscheme molokai
set clipboard=unnamed
" _____________________________________________________________________________
" -----------------------------------------------------------------------------
" 検索関連
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" {{{
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索文字列入力時に順次対象文字列にヒットさせない
set noincsearch
" Esc連打で検索時にハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR>
" }}}

" _____________________________________________________________________________
" -----------------------------------------------------------------------------
" 装飾関連
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" {{{
"行番号を表示させる
set number
" タイトルをウインドウ枠に表示
" set notitle
" ルーラーを表示
set ruler
" タブや改行を表示
set nolist
" タブと半角表示を指定
set listchars=tab:>-,trail:.,eol:¶
" 入力中のコマンドをステータスに表示する
set showcmd
" 括弧入力時の対応する括弧を表示
set noshowmatch
" 補完候補をリスト表示
" set wildmenu
" 7.4以降で変なファイルが出来ないようにする
if v:version > 740
  set noundofile
endif
" ステータスラインを常に表示
set laststatus=2
set nowrap
" ハイライト
if &t_Co > 2 || has("gui_running")
  " シンタックスハイライトを有効にする
  syntax on
  " 検索結果文字列のハイライトを有効にする
  set hlsearch
endif

" 120文字以上をハイライトhttp://vim-users.jp/2011/05/hack217/
autocmd FileType sh,vim,php,js,html setlocal colorcolumn=120

hi colorcolumn ctermbg=238
" }}}

" _____________________________________________________________________________
" -----------------------------------------------------------------------------
" 編集、文書整形関連
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" {{{
" backspaceキーの挙動を設定する
" indent        : 行頭の空白の削除を許す
" eol           : 改行の削除を許す
" start         : 挿入モードの開始位置での削除を許す
set backspace=indent,eol,start
" 新しい行を直前の行と同じインデントにする
" (コーディング意外は邪魔になることが多いので無効、独自関数で簡単に切り替える)
set noautoindent
" Tab文字を画面上の見た目で何文字幅にするか設定
" FuelPHP用
set tabstop=2
" タブの入力を空白文字に置き換える
set expandtab
" 長い行を表示
set display=lastline

" スニペットの高さ
set pumheight=10
" スニペットの高さ
" }}}

" _____________________________________________________________________________
" -----------------------------------------------------------------------------
" ファイル関連
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" {{{
" nobackup
" バックアップファイルを作成しない
set nobackup
set noswapfile
" 一時ファイルを一か所にまとめる
"set directory=$HOME/.vim/tmp
"set backupdir=$HOME/.vim/tmp
"set undodir=$HOME/.vim/tmp
" }}}

" _____________________________________________________________________________
" -----------------------------------------------------------------------------
" マップ定義
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
"{{{
" autocmd
if has("autocmd")
  " textファイルのカラムを78に設定
  autocmd FileType text setlocal textwidth=0
  " カーソル位置を記憶しておく
  autocmd BufReadPost *
              \ if line("'\"") > 0 && line("'\"") <= line("$") |
              \   exe "normal g`\"" |

  " これらのftではインデントを無効に
  " autocmd FileType php html js css filetype indent off

  " 自動でコメントアウトされないように
  autocmd FileType * setlocal formatoptions-=ro

  " autocmd FileType php :set indentexpr=
  " autocmd FileType html :set indentexpr=
  autocmd FileType xhtml :set indentexpr=

  " Indent
  autocmd FileType sh         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType css        setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 noet
  autocmd FileType javascript setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xml        setlocal sw=2 sts=2 ts=2 noet
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType php        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js         setlocal sw=2 sts=2 ts=2 et
endif " has("autocmd")
" }}}

" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" プラグイン関連
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" _____________________________________________________________________________
" -----------------------------------------------------------------------------
" vim-indent-guides
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" {{{
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=234
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_guide_size = 2
" }}}
" _____________________________________________________________________________
" -----------------------------------------------------------------------------
" syntastic
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" {{{
" syntastic with rubocop
" let g:syntastic_check_on_wq = 0
" let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1
" php コマンドのオプションを上書かないと動かなかった
let g:syntastic_php_php_args = '-l'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" }}}
" _____________________________________________________________________________
" -----------------------------------------------------------------------------
" neosnippet & spnippets
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" {{{
" highlight
highlight Pmenu ctermbg=238 ctermfg=247
highlight PmenuSel ctermfg=255 ctermbg=23
highlight PMenuSbar ctermbg=8
highlight PmenuThumb ctermbg=5
highlight CursorLine term=reverse cterm=none ctermbg=4
" highlight Normal  ctermfg=0 ctermbg=15 guifg=Black guibg=White
" アクティブウィンドウに限りカーソル行(列)を強調する
" augroup vimrc_set_cursorline_only_active_window
"   autocmd!
"   autocmd VimEnter,BufWinEnter,WinEnter * setlocal cursorline
"   autocmd WinLeave * setlocal nocursorline
" augroup END


" notime
augroup InsModeAu
  autocmd!
  autocmd InsertEnter,CmdwinEnter * set noimdisable
  autocmd InsertLeave,CmdwinLeave * set imdisable
augroup END

" 自作snippets用ディレクトリを用意
let g:neosnippet#snippets_directory = [
  \'~/.vim/snippets',
  \]

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
" }}}
" _____________________________________________________________________________
" -----------------------------------------------------------------------------
" Vimの便利な画面分割＆タブページ
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" {{{
" http://qiita.cm/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap s <Nop>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT
nnoremap sw <C-w>w
nnoremap sl <C-w>15<
nnoremap sh <C-w>15>
nnoremap sk <C-w>10-
nnoremap sj <C-w>10+
nnoremap si :<C-u>NF<CR>
nnoremap se :<C-u>Nq<CR>
" }}}
" _____________________________________________________________________________
" -----------------------------------------------------------------------------
" custom lightline https://github.com/itchyny/lightline.vim"
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" {{{
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ 'separator': { 'left': '⮀', 'right': '⮂' },
  \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
  \ }
" 'separator': { 'left': '⮀', 'right': '⮂' },
nnoremap <silent> <leader>cf :ChefFindAny<CR>
nnoremap <silent> <leader>cs :ChefFindAnySplit<CR>
nnoremap <silent> <leader>cv :ChefFindAnyVsplit<CR>
nnoremap <silent> <leader>cr :ChefFindRelated<CR>
"let g:lightline = {
"  \ 'colorscheme': 'wombat',
"  \ 'active': {
"  \   'left': [ [ 'mode', 'paste' ],
"  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
"  \ },
"  \ 'component': {
"  \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
"  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
"  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
"  \ },
"  \ 'component_visible_condition': {
"  \   'readonly': '(&filetype!="help"&& &readonly)',
"  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
"  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
"  \ },
"  \ 'separator': { 'left': '⮀', 'right': '⮂' },
"  \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
"  \ }
"nnoremap <silent> <leader>cf :ChefFindAny<CR>
"nnoremap <silent> <leader>cs :ChefFindAnySplit<CR>
"nnoremap <silent> <leader>cv :ChefFindAnyVsplit<CR>
"nnoremap <silent> <leader>cr :ChefFindRelated<CR>
" }}}
" _____________________________________________________________________________
" -----------------------------------------------------------------------------
" vim-ref
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" {{{
" wget http://jp2.php.net/get/php_manual_ja.tar.gz/from/this/mirror
" tar zxvf php_manual_ja.tar.gz
"-----------------------------------------------------------------------------
" let $PATH = $PATH . ':' . '/home/sgs_nkitada/local/lib/lynx-2.8.8rel.2/bin'
let g:ref_phpmanual_path = '/home/pronet/.vim/php-chunked-xhtml'
" }}}
" _____________________________________________________________________________
" -----------------------------------------------------------------------------
" NERDTree
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" {{{
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1

" デフォルトでツリーを表示させる
"autocmd VimEnter * execute 'NERDTree'
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
  autocmd VimEnter * execute 'NERDTree ./'
endif
" }}}
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" 独自関数定義
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
" {{{
" 一時キーマクロも置いておく
let @t='/\(epark_receivedatamove\|epark_countreserve\|epark_epark_point_add\|epark_create-use-history\)'

function! SpaceClearFunction()
    :%s/\s\+$//ge
endfunction

command! SpaceClear :call SpaceClearFunction()

" .vimrc編集時に自動読込
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" $HOME直下のメモを横分割表示
function! VimrcEdit()
    :sp
    :view $HOME/.vimrc
endfunction

command! Config :call VimrcEdit()
" $HOME直下のメモを横分割表示
function! MemoEdit()
    :sp
    :view $HOME/memo.txt
endfunction
command! Memo :call MemoEdit()

" NERDTree Findコマンド省略
command! NF :NERDTreeFind
command! Nq :NERDTreeClose
command! SS :SyntasticReset
"cpコマンド作成
command! Cp :call MakeCpCmd()
function! MakeCpCmd()
    :%s/^/cp --parent /
    :%s/$/ $HOME\/xxxxx/
endfunction

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
" }}}

