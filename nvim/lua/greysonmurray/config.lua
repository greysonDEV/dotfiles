local M = require("greysonmurray.keymap")
local nnoremap = M.nnoremap
local inoremap = M.inoremap

-- Floaterm
nnoremap("<Leader>t", ":FloatermNew --autoclose=2 --wintype=normal <CR>")
-- Floaterm Rust Commands
nnoremap("<Leader>c", ":FloatermNew --autoclose=0 --wintype=normal cargo run <CR>")
nnoremap("<Leader>v", ":FloatermNew --autoclose=0 --wintype=normal cargo test <CR>")
nnoremap("<Leader>b", ":FloatermNew --autoclose=0 --wintype=normal cargo build <CR>")

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { silent=true, buffer=bufnr }
  nnoremap("gd", vim.lsp.buf.definition, bufopts)
  nnoremap("gD", vim.lsp.buf.declaration, bufopts)
  nnoremap("gt", vim.lsp.buf.type_definition, bufopts)
  nnoremap("rn", vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

require("lspconfig").rust_analyzer.setup({
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})

require("lspconfig").clangd.setup({
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--background-index",
    "--header-insertion=never",
    "--clang-tidy",
  }
})

require("lspconfig").pyright.setup({
  on_attach = on_attach
})

local cmp = require("cmp")

local tab_key = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    fallback()
  end
end, {
  "i"
})

cmp.setup({
  window = {
    -- completion = cmp.config.window.bordered()
  },
  mapping = {
    ["<Tab>"] = tab_key,
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp"}
  })
})

require("Comment").setup()
local ft = require("Comment.ft")

ft.lang("lua")
ft({"cpp", "c", "javascript", "mg"}, {"// %s", "/* %s */"})

require("nvim-treesitter.configs").setup({
  ensure_installed = { "cpp", "lua", "rust", "toml" },
  highlight = {
    enable = true,
  }
})

require("telescope").setup{
    defaults = {
        preview = false,
        layout_strategy = "vertical",
        layout_config = { height = 0.8 },
        file_ignore_patterns = {
            "%.o",
            "%.woff",
            "%.woff2",
            "%.ttf",
            "%.dSYM",
            "%.ico",
            "%.png",
            "%.jpeg",
            "%.jpg",
            "%.pyc",
            "pycache",
            "node_modules/.*"
        }
    },
    pickers = {
        find_files = {
            prompt_prefix = '  ',
        }
    }
}

require("nvim-surround").setup({
  surrounds = {
    -- do nothing if bad delimiter is sent
    invalid_key_behavior = {
      add = function() end,
      find = function() end,
      delete = function() end,
      change = {}
    }
  }
})
