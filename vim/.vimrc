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

Plug 'morhetz/gruvbox' 
Plug 'dracula/vim', {'as':'dracula'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'

if has('nvim')
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
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
colorscheme OceanicNext
" set t_Co=256                                    " set 256 colors


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
    inoremap <silent><expr> <c-space> coc#refresh()
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
endif

" --------------------------------------------------
" Misc. Keymaps
" --------------------------------------------------
map <space> <leader>
map <leader>b :w !python3.9<cr>
map <leader>m :wa \| !clear && make<cr>
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
