local M = require("greysonmurray.keymap")
local nnoremap = M.nnoremap
local inoremap = M.inoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- tmux navigator
nnoremap("<C-h>", "<cmd>TmuxNavigateLeft<cr>")
nnoremap("<C-j>", "<cmd>TmuxNavigateDown<cr>")
nnoremap("<C-k>", "<cmd>TmuxNavigateUp<cr>")
nnoremap("<C-l>", "<cmd>TmuxNavigateRight<cr>")

-- restrict use of arrow keys
nnoremap("<left>", "<nop>")
nnoremap("<right>", "<nop>")
nnoremap("<up>", "<nop>")
nnoremap("<down>", "<nop>")

nnoremap("<esc>", "<cmd>noh<cr>")
nnoremap("zz", ":wa<cr>")

nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")

-- inoremap("<Enter>", "coc#pum#visible() ? coc#_select_confirm() : '<Enter>'", {silent = true, expr = true})
-- inoremap("<tab>", "coc#pum#visible() ? coc#pum#next(1) : '<Tab>'", {silent = true, expr = true})
-- inoremap("<S-Tab>", "coc#pum#visible() ? coc#pum#prev(1) : '<S-Tab>'", {silent = true, expr = true})
--
-- nnoremap("gd", "<Plug>(coc-definition)", {silent = true})
-- nnoremap("gt", "<Plug>(coc-type-definition)", {silent = true})

vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern="*.mg", command="set filetype=mg" }
)
