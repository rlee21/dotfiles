"################################
" Plugin Manager
"################################
set rtp+=~/.vim/bundle/Vundle.vim
filetype off                            "required for Vundle
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'        "status bar
Plugin 'vim-airline/vim-airline-themes' "status bar themes
Plugin 'tpope/vim-fugitive'             "git
Plugin 'tpope/vim-rhubarb'              "git browse handler
Plugin 'junegunn/fzf'                   "fuzzy finder
Plugin 'junegunn/fzf.vim'               "fuzzy finder
Plugin 'scrooloose/nerdtree'            "folder tree
Plugin 'vim-syntastic/syntastic'        "syntax checker
Plugin 'w0rp/ale'                       "syntax checker
Plugin 'mattn/emmet-vim'                "html and css snippets
Plugin 'prettier/vim-prettier'          "code formatter
Plugin 'tpope/vim-commentary'           "commenting blocks of code
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-surround'
Plugin 'MarcWeber/vim-addon-mw-utils'   "SnipMate dependency
Plugin 'tomtom/tlib_vim'                "SnipMate dependency
Plugin 'garbas/vim-snipmate'            "code snippet with tab completion
Plugin 'honza/vim-snippets'             "code snippet with tab completion
Plugin 'dsfcode/hive.vim.git'           "syntax highlighting for Hive
Plugin 'morhetz/gruvbox'                "color scheme
Plugin 'slim-template/vim-slim.git'     "syntax highlighting for slim
Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'kchmck/vim-coffee-script'
Plugin 'webdevel/tabulous'              "enhance tabline including numbered tabs
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'styled-components/vim-styled-components', { 'branch': 'main' }
Plugin 'jparise/vim-graphql'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
call vundle#end()
filetype on

"################################
" Plugin Settings
"################################
" let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_check_on_wq = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_set_highlights = 0
let g:ale_enabled = 0
let g:jsx_ext_required = 0
let g:github_enterprise_urls = ['https://github.com']
hi link coffeeSemicolonError NONE

"################################
" Appearance
"################################
syntax on
colorscheme gruvbox
set background=dark
set showmode
set tabstop=4
set shiftwidth=4
set expandtab
" set noexpandtab
set number relativenumber
set wildmenu
set history=1000
set encoding=utf-8
set nocompatible
set clipboard=unnamed
set ruler
set ignorecase | set smartcase                    "Use case insensitive search, except when using capital letters (smartcase)
set laststatus=2                                  "show status bar"
set backspace=indent,eol,start                    "allow backspace in insert mode
set showcmd                                       "show incomplete cmds down the bottom
set gcr=a:blinkon0                                "disable cursor blink
set visualbell                                    "no sounds"
set listchars=tab:>·,trail:·                      "make tabs and trailing spaces visible
set lazyredraw                                    "prevent redraw while executing macros
set re=2                                          "prevent vim from freezing on TypeScript files
set list
set noswapfile | set nowritebackup | set nobackup "run faster by turning off swap files/backup
set clipboard=unnamedplus                         "+ register as the default register
let g:snipMate = { 'snippet_version' : 1 }
" highlight colorcolumn ctermbg=grey
call matchadd('colorcolumn', '\%80v', 100)        "set colorcolumn highlight for 80th character

"################################
" Auto Commands
"################################
" autocmd FileType python,ruby,javascript setlocal colorcolumn=80 "set colorcolumn highlight for 80th character
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType python,ruby,sh setlocal commentstring=#%s
autocmd FileType javascript setlocal commentstring=//%s
autocmd FileType sql,hive setlocal commentstring=--%s
autocmd FileType html,markdown setlocal commentstring=<!--\ %s\ -->
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

"################################
" Key Bindings
"################################
inoremap kj <Esc>
cnoremap kj <Esc>
let mapleader = ","
nmap <leader>n :NERDTree<cr>
nmap <Leader>w <C-w>w
nmap <leader>, :Files<cr>
nmap <leader>g :Rg<cr>
nmap <leader>gb :Git blame<cr>
nmap <leader>go :Gbrowse<cr>
nmap <leader>a :ALEToggle<cr>
nmap <leader>m :Emodel<cr>
nmap <leader>v :Eview<cr>
nmap <leader>c :Econtroller<cr>
" nmap <leader>t :Eunittest<cr>
nmap <leader>ct <C-]><cr>
nmap <leader>c :!
nmap <leader>s /\c
nmap <leader>d obinding.pry<esc>==<cr>
nmap <leader>t :!bundle exec ruby -I "test" %<cr>
nmap <leader>tr :!bundle exec rspec %<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
" set tags=~/code/tags
" ctags -R --exclude=.git --exclude=log --exclude="*.js" --exclude="*.sql" --exclude="*.py" *
"
"################################
" Misc
"################################
" find and replace multiple files
" vim `find . -name '*.rb' -exec grep -le 'text being searched' {} \;`
" :bufdo %s/old text/new text/gce
" :bufdo wq!
"
"################################
" LSP
"################################
" Use extensions for TypeScript language server
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ ]

" Use <Tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()

inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at
" current position. Coc only does snippet and additional edit on confirm.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                            \: "\<C-g>u\<CR>"
