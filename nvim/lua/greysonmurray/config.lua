local M = require("greysonmurray.keymap")
local nnoremap = M.nnoremap
local inoremap = M.inoremap

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- vim.diagnostic.config({
  --   virtual_text = false
  -- })

  -- Show line diagnostics automatically in hover window
  vim.o.updatetime = 50
  vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

  -- LSP Mappings
  local bufopts = { silent=true, buffer=bufnr }
  nnoremap("gd", vim.lsp.buf.definition, bufopts)
  nnoremap("gD", vim.lsp.buf.declaration, bufopts)
  nnoremap("gt", vim.lsp.buf.type_definition, bufopts)
  nnoremap("rn", vim.lsp.buf.rename, bufopts)
  nnoremap("gr", vim.lsp.buf.references, bufopts)
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
            -- procMacro = {
            --     enable = true
            -- },
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

ft({"cpp", "c", "javascript", "mg"}, {"// %s", "/* %s */"})

require("nvim-treesitter.configs").setup({
  ensure_installed = { "cpp", "lua", "rust", "toml", "vim", "help" },
  highlight = {
    enable = true,
  }
})

require("telescope").setup {
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
            "node_modules/.*",
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
