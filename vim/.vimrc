" ==================================================
"
" .vimrc (Greyson Murray)
"
" ==================================================


" --------------------------------------------------
" Plugins (vim-plug)
" --------------------------------------------------
call plug#begin("~/.vim/plugged")
Plug 'morhetz/gruvbox' 
Plug 'dracula/vim', {'as':'dracula'}
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()


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
" Managing Splits
" --------------------------------------------------
set splitbelow                                  " splits new window below 
set splitright                                  " splits new window at right

" Ctrl + HJKL keys to move between splits
nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" --------------------------------------------------
" christoomey/vim-tmux-navigator 
" https://github.com/christoomey/vim-tmux-navigator
" --------------------------------------------------
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-Mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2


" --------------------------------------------------
" Colors
" --------------------------------------------------
colorscheme dracula
set background=dark
set t_Co=256                                    " set 256 colors


" --------------------------------------------------
" Misc. Keymaps
" --------------------------------------------------
"
" Leader Mappings
map <space> <leader>
map <leader>b :w !python3.9<cr>

" Restricts use of arrow keys - use HJKL instead
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>


" --------------------------------------------------
" Other Preferences
" --------------------------------------------------
set noerrorbells novisualbell                   " disables bells
set clipboard=unnamed                           " yanks to clipboard (OSX)
set noswapfile                                  " disables swap files
set undodir=~/.vim/undodir                      " sets undo directory
set undofile                                    " enables use of undo file
