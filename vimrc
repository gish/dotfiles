"" Basic
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8
filetype off          " required
set colorcolumn=80

"" Pane sizing
" Move right
nmap <c-n> 5<c-w>>
" Move left
nmap <c-m> 5<c-w><


"" Cursorline
set cursorline
set cursorcolumn


"" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'Shougo/denite.nvim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Yggdroot/indentLine'
Plugin 'bling/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'dracula/vim'
Plugin 'ervandew/supertab'
Plugin 'freitass/todo.txt-vim'
Plugin 'geekjuice/vim-mocha'
Plugin 'gmarik/vundle'
Plugin 'junegunn/fzf'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'mhartington/nvim-typescript'
Plugin 'mileszs/ack.vim'
Plugin 'mtscout6/vim-cjsx'
Plugin 'mxw/vim-jsx'
Plugin 'neomake/neomake'
Plugin 'pangloss/vim-javascript'
Plugin 'prettier/vim-prettier'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on

"" Tabbing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"" Fugitive
nmap <leader>gb :Gblame<CR>
nmap <leader>gl :Glog<CR>

"" Mappings
" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>
" Tab between buffers
noremap <tab> <c-w><c-w>

"" CtrlP
map <leader>t :CtrlP<CR>

"" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
if isdirectory(argv(0))
    bd
    autocmd vimenter * exe "cd" argv(0)
    autocmd VimEnter * NERDTree
endif
let NERDTreeShowHidden=1

"" NERDCommenter
map <leader>/ <plug>NERDCommenterToggle<CR>

"" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

"" Git
autocmd Filetype gitcommit setlocal spell textwidth=72

"" Autoload changed file
set autoread

"" Theming
let g:dracula_italic = 0
let g:dracula_colorterm = 0
colorscheme dracula
set background=dark

"" Delete trailing white space
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

"" Indentation
" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

"" Directories
set undodir=~/.vim/undo/

autocmd FileType coffee :setlocal sw=4 ts=4 sts=4
autocmd FileType javascript :setlocal sw=4 ts=4 sts=4
autocmd FileType ruby :setlocal sw=4 ts=4 sts=4
autocmd FileType yaml :setlocal sw=4 ts=4 sts=4
autocmd FileType scss :setlocal sw=4 ts=4 sts=4

" Remove highlighting with double ESC
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

" Neomake configuration
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_typescript_enabled_makers = ['tslint']
let g:neomake_typescript_tslint_exe = $PWD .'/node_modules/.bin/tslint'
let g:neomake_php_enabled_makers = ['php']

" Don't use backup or swapfiles
set nobackup
set noswapfile

" Markdown preview
let vim_markdown_preview_hotkey='<C-l>'
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_perl=1
let vim_markdown_preview_github=1

" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0

let g:prettier#exec_cmd_path = $PWD .'/node_modules/.bin/prettier'
let g:prettier#autoformat = 0
" autocmd BufWritePre *.md,*.js,*.jsx,*.ts,*.tsx PrettierAsync

" Typescript bindings
nnoremap <leader>t :TSType<CR>
let g:deoplete#enable_at_startup = 1


" indentline
let g:indentLine_concealcursor="nc"
let g:indentLine_setColors=1

