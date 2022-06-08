" ==================================================
"
" .vimrc (Greyson Murray)
"
" ==================================================


" --------------------------------------------------
" Plugins (vim-plug)
" --------------------------------------------------
call plug#begin("~/.vim/plugged")
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jparise/vim-graphql'
Plug 'posva/vim-vue'
Plug 'morhetz/gruvbox' 
Plug 'dracula/vim', {'as':'dracula'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'
Plug 'lifepillar/vim-colortemplate'
Plug 'drewtempelmeyer/palenight.vim'

if has('nvim')
    Plug 'EdenEast/nightfox.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

call plug#end()


" --------------------------------------------------
" Other Preferences
" --------------------------------------------------
set wildignore=*.o
set noerrorbells novisualbell                   " disables bells
set clipboard=unnamed                           " yanks to clipboard (OSX)
set noswapfile                                  " disables swap files
if has('nvim')
    set guicursor=a:block
else
    set undodir=~/.vim/undodir
endif
set undofile                                    " enables use of undo file
set timeoutlen=1000                             " mapping delays
set ttimeoutlen=10                              " keycode delays
" set nocompatible


" --------------------------------------------------
" Text / Tab / Indentation
" --------------------------------------------------
set tabstop=4                                   " sets width of tab to four spaces 
set softtabstop=4                               " removes/inserts four spaces when deleting/inserting a tab 
set shiftwidth=4                                " inserts four spaces when auto-indenting 
set expandtab                                   " converts tabs to spaces as they are typed
set smartindent                                 " indents based on syntax of file
set nowrap                                      " disable text wrapping if line is too long
set backspace=indent,eol,start                  " enable backspace as delete key


" --------------------------------------------------
" Searching
" --------------------------------------------------
set ignorecase                                  " when combined with smartcase, '/the' will find 'the' and 'The' 
set smartcase                                   " when combined with ignorecase, '/The' will only find 'The'
set hlsearch                                    " highlights text while typing search query
set incsearch                                   " searches while typing search query


" --------------------------------------------------
" User Interface
" --------------------------------------------------
syntax on                                       " enables syntax highlighting
set number                                      " enable line numbers
set relativenumber                              " enable relative numbers
set scrolloff=5                                 " 5 lines of buffer space when scrolling vertically
set sidescrolloff=10                            " 10 characters of buffer space when scrolling horizontally


" --------------------------------------------------
" Colors
" --------------------------------------------------
set background=dark
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set cursorline
colorscheme palenight
set t_Co=256                                    " set 256 colors


" --------------------------------------------------
" File Explorer
" --------------------------------------------------
let g:netrw_liststyle = 3
let g:netrw_winsize = 15


" --------------------------------------------------
" Managing Splits
" --------------------------------------------------
set splitbelow                                  " splits new window below 
set splitright                                  " splits new window at right


" --------------------------------------------------
" christoomey/vim-tmux-navigator 
" https://github.com/christoomey/vim-tmux-navigator
" --------------------------------------------------
let g:tmux_navigator_no_mappings = 1
nmap <C-h> :TmuxNavigateLeft<cr>
nmap <C-j> :TmuxNavigateDown<cr>
nmap <C-k> :TmuxNavigateUp<cr>
nmap <C-l> :TmuxNavigateRight<cr>

" write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2 

" --------------------------------------------------
" NeoVim Keymaps
" --------------------------------------------------
if has('nvim')
    " inoremap <silent><expr> <c-space> coc#refresh()
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
endif

" --------------------------------------------------
" Vim Fugitive Keymaps
" https://github.com/tpope/vim-fugitive
" --------------------------------------------------
map <leader>g :Git<cr>
map <leader>gs :Git status<cr>
map <leader>gp :Git push<cr>

" --------------------------------------------------
" Misc. Keymaps
" --------------------------------------------------
nmap <esc> :noh<cr>
map <space> <leader>
map <leader>b :w !python3.10<cr>
map <leader>m :wa \| !clear && make<cr>
map <leader>v :source $MYVIMRC<cr>
nmap zz :wa<cr>
nmap zqq :wqa<cr>

" restrict use of arrow keys - use HJKL instead
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

" coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" --------------------------------------------------
" Auto-Commands
" --------------------------------------------------

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" prevents shifting of gutter when sign appears
set signcolumn=yes

" --------------------------------------------------
" Auto-Commands
" --------------------------------------------------
autocmd BufRead,BufNewFile ~/Developer/dpl/apps/* set tabstop=2 softtabstop=2 shiftwidth=2

" set default comment to '// my comment' instead of '/* my comment */'
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType c setlocal commentstring=//\ %s

" my custom language
autocmd FileType mg setlocal commentstring=//\ %s
autocmd BufRead,BufNewFile *.mg set filetype=mg
