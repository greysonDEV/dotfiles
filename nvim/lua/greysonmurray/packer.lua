vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use "wbthomason/packer.nvim"
  use("numToStr/Comment.nvim")
  use "ellisonleao/gruvbox.nvim"
  use "christoomey/vim-tmux-navigator"
  use "Raimondi/delimitMate"
  use("kylechui/nvim-surround")
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use "nvim-treesitter/nvim-treesitter"
  use 'voldikss/vim-floaterm'

  -- LSP
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
end)
