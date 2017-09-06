set number
set guioptions-=e
set expandtab
set tabstop=4
set shiftwidth=4
set mouse=a
set splitbelow
set splitright
set backspace=indent,eol,start

highlight Comment ctermbg=blue ctermfg=white
highlight ZenkakuOrTrailingSpace cterm=underline ctermfg=red
match ZenkakuOrTrailingSpace /　\|\s\+$/

syntax on

if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}
  Plug 'KeitaNakamura/railscasts.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'KeitaNakamura/lightline-railscasts.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'Shougo/neocomplete.vim'
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'tpope/vim-endwise'
  Plug 'Townk/vim-autoclose'
  Plug 'osyo-manga/vim-monster'
  Plug 'todesking/ruby_hl_lvar.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tomtom/tcomment_vim'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'Yggdroot/indentLine'
  Plug 'rhysd/accelerated-jk'
  Plug 'tyru/open-browser.vim'
  Plug 'thinca/vim-quickrun'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'fatih/vim-go'
call plug#end()

let g:lightline = {}
let g:lightline.colorscheme = 'railscasts'
set laststatus=2

colorscheme railscasts

nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

" ファイル保存時に余分なスペースを削除する
autocmd BufWritePre * :FixWhitespace

" 検索モードを開く
nmap <Leader>f :CtrlP<CR>

" カーソル下のURLや単語をブラウザで開く
nmap <Leader>b <Plug>(openbrowser-smart-search)
vmap <Leader>b <Plug>(openbrowser-smart-search)

" j/kによる移動を速くする
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" ブランチ情報を表示する
let g:airline#extensions#branch#enabled = 1

" 自動補完機能を有効にする
let g:neocomplete#enable_at_startup = 1

" vim-monsterを有効にする
let g:neocomplete#sources#omni#input_patterns = {
\  'ruby': '[^. *\t]\.\w*\|\h\w*::'
\}


