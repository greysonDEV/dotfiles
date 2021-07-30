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
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
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
" Colors
" --------------------------------------------------
set background=dark
colorscheme gruvbox
set t_Co=256                                    " set 256 colors


" --------------------------------------------------
" File Explorer
" --------------------------------------------------
let g:netrw_liststyle=3
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
" Misc. Keymaps
" --------------------------------------------------
" leader Mappings
map <space> <leader>
map <leader>b :w !python3.9<cr>
map <leader>m :wa \| !clear && make && make run<cr>

" restricts use of arrow keys - use HJKL instead
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
set timeoutlen=1000                             " mapping delays
set ttimeoutlen=10                              " keycode delays
