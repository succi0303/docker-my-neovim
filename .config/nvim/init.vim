" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'easymotion/vim-easymotion'
Plug 'fatih/vim-go'
Plug 'mattn/emmet-vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'scrooloose/nerdtree'
Plug 'sjl/badwolf'
Plug 'thinca/vim-partedit'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'

call plug#end()

set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8
set backspace=indent,eol,start
set hidden
set showcmd
set cursorline
set number
set laststatus=2
set showmatch
set incsearch
set display+=lastline
set wildmenu
set ignorecase
set clipboard=unnamed

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set smartindent

set sh=bash

augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.go setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END

nnoremap s <Nop>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sq :<C-u>q<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT
nnoremap sQ :<C-u>tabclose<CR>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap <ESC><ESC> :nohlsearch<CR>

set wildmode=list,full

set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

colorscheme badwolf
set termguicolors
syntax on

" ale
let g:ale_linters = {
  \ 'ruby': ['rubocop'],
  \ 'python': ['flake8'],
  \ 'go': ['golint'],
  \ 'javascript': ['eslint'],
  \}
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'python': ['autopep8'],
  \ 'go': ['gofmt'],
  \ 'javascript': ['prettier'],
  \ 'json': ['prettier'],
  \ 'yaml': ['prettier'],
  \ 'markdown': ['prettier'],
  \}
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" vim-easymothon
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1
" <Leader>f{char} to move to {char}
map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" <Leader>s{char}{char} to move to {char}{char}
map <Leader>s <Plug>(easymotion-bd-f2)
nmap <Leader>s <Plug>(easymotion-overwin-f2)
" Move to Line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" n-character search
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
"hjkl
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>n <Plug>(easymotion_linebackward)

" nerdtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMapActivateNode = "<CR>"
let file_name = expand("%:p")
nnoremap <C-e> :NERDTreeToggle<CR>

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
" let g:airline_powerline_fonts = 1
" let g:airline_symbols_ascii = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme = 'badwolf'

" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constrains = 1
let g:go_highlight_generate_tags = 1
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']
" let g:go_metalinter_deadline = "5s"
let g:go_fmt_fail_silently = 1
let g:go_def_mode = 'godef'
let g:go_decls_includes = "func,type"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_play_open_browser = 0
let g:go_term_enabled = 1

" vim-lsp
let g:lsp_diagnostics_enabled = 0
if executable('solargraph')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'solargraph',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
    \ 'initialization_options': {"diagnostics": "true"},
    \ 'whitelist': ['ruby'],
    \ })
endif
if executable('gopls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'gopls',
    \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
    \ 'whitelist': ['go'],
    \ })
endif
if executable('pyls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': {server_info->['pyls']},
    \ 'whitelist': ['python'],
    \ })
endif
if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'javascript support using typescript-language-server',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
    \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
    \ 'whitelist': ['javascript', 'javascript.jsx'],
    \ })
endif
if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'typescript-language-server',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
    \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
    \ 'whitelist': ['typescript', 'typescript.tsx'],
    \ })
endif
" asyncomplete.vim
let g:asyncomplete_auto_popup = 1
inoremap <exp> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <exp> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <exp> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
let g:asyncomplete_remove_dupulicate = 1
" debug
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:asyncomplete_log_file = expand('~/asyncomplete.log')

" vim-partedit
vnoremap <C-l> :Partedit<CR>
noremap <C-h> :ParteditEnd<CR>
