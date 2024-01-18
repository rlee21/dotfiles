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
autocmd FileType typescript set tabstop=2|set shiftwidth=2|set expandtab
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
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gr <Plug>(coc-references)
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
" nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
" nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
" nmap <leader>do <Plug>(coc-codeaction)
" nmap <leader>rn <Plug>(coc-rename)
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
" CoC (LSP)
"################################
" let g:coc_start_at_startup = v:false

" Use extensions for TypeScript language server
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ ]

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
