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

"" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'Shougo/denite.nvim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'bling/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'morhetz/gruvbox'
Plugin 'ervandew/supertab'
Plugin 'geekjuice/vim-mocha'
Plugin 'gmarik/vundle'
Plugin 'mileszs/ack.vim'
"Plugin 'mtscout6/vim-cjsx'
"Plugin 'mxw/vim-jsx'
Plugin 'neomake/neomake'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'frazrepo/vim-rainbow'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'fatih/vim-go',
Plugin 'hashivim/vim-terraform',

" Typescript
    Plugin 'leafgarland/typescript-vim'
    Plugin 'maxmellon/vim-jsx-pretty'

Plugin 'neoclide/coc.nvim', {'branch': 'release'}
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
"noremap <tab> <c-w><c-w>

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
colorscheme gruvbox
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

let g:prettier#autoformat = 1

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
autocmd BufWritePre *.md,*.js,*.jsx,*.ts,*.tsx Prettier

" indentline
let g:indentLine_concealcursor="nc"
let g:indentLine_setColors=1

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)


" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)

" Go settings
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>f <Plug>(go-test-func)
au FileType go nmap <silent> gf :GoFillStruct<CR>


let g:rainbow_active = 1

" fzf
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'
nnoremap <silent> <C-f> :Files<CR>

let g:terraform_fmt_on_save=1

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

