local M = require("greysonmurray.keymap")
local nnoremap = M.nnoremap
local tnoremap = M.tnoremap
local inoremap = M.inoremap

nnoremap("<leader>l", ":luafile $MYVIMRC<CR>")

nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- Floaterm
nnoremap("<Leader>t", ":FloatermNew --title=[\\ floaterm($1/$2)\\ ] --autoclose=2 --wintype=float --height=0.8 --width=0.9 <CR>")
-- Floaterm lazygit
nnoremap("<Leader>g", ":FloatermNew --title=[\\ lazygit\\ ] --autoclose=2 --wintype=float --height=0.95 --width=0.95 lazygit <CR>")
-- Floaterm Rust Commands
nnoremap("<Leader>c", ":FloatermNew --title=[\\ cargo\\ run\\ ] --autoclose=0 --wintype=float --height=0.8 --width=0.9 cargo run<CR>")
nnoremap("<Leader>v", ":FloatermNew --title=[\\ cargo\\ test\\ ] --autoclose=0 --wintype=float --height=0.8 --width=0.9 cargo test <CR>")
nnoremap("<Leader>b", ":FloatermNew --title=[\\ cargo\\ build\\ ] --autoclose=0 --wintype=float --height=0.8 --width=0.9 cargo build <CR>")
nnoremap("<Leader>d", ":FloatermNew --title=[\\ cargo\\ doc\\ ] --autoclose=1 --wintype=float --height=0.8 --width=0.9 cargo doc --no-deps --document-private-items --open <CR>")

nnoremap("<Leader>m", ":FloatermNew --autoclose=0 --wintype=float --height=0.8 --width=0.9 make && rm -rf disk.img && ./grade.sh -v <CR>")

-- Remap 'escape' to switch from Terminal mode to Normal mode
-- tnoremap("<Esc>", "<C-\\><C-n>")

-- tmux navigator
nnoremap("<C-h>", "<cmd>TmuxNavigateLeft<cr>")
nnoremap("<C-j>", "<cmd>TmuxNavigateDown<cr>")
nnoremap("<C-k>", "<cmd>TmuxNavigateUp<cr>")
nnoremap("<C-l>", "<cmd>TmuxNavigateRight<cr>")

nnoremap("<esc>", "<cmd>noh<cr>")
nnoremap("zz", ":wa<cr>")

nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")

vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern="*.cx", command="set filetype=cx" }
)
