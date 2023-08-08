local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim whenever this file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local packer_status, packer = pcall(require, "packer")
if not packer_status then
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim") -- provides lua functions that many other plugins use 
  use("nvim-treesitter/nvim-treesitter")

  -- appearance
  use({"catppuccin/nvim", as = "catppuccin"}) -- colorsheme
  use("nvim-lualine/lualine.nvim") -- lualine
  use("nvim-tree/nvim-web-devicons") -- icons

  -- which key
  use("folke/which-key.nvim")

  -- tmux & split window navigation
  use("christoomey/vim-tmux-navigator")
  -- maximize split
  use("szw/vim-maximizer")

  -- life saver plugins
  use("tpope/vim-surround") -- surround motion/word with character (ys<motion><character>,cs<old_character><new_character>,ds<character>)
  use("vim-scripts/ReplaceWithRegister") -- replace motion/word with register (gr<motion>)
  use("numToStr/comment.nvim") -- comment selection (gc<motion>)
  -- telescope, fuzzy finder
  use("nvim-telescope/telescope.nvim") -- telescope itself
  use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"}) -- utility to make telescope faster

  -- autocompletion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  -- snippets
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")
  -- lsp
  use("williamboman/mason.nvim") -- lsp server manager
  use("neovim/nvim-lspconfig") -- lsp configurator
  use("williamboman/mason-lspconfig.nvim") -- blend between mason and nvim-lspconfig
  -- lsp server configurations
  use("hrsh7th/cmp-nvim-lsp") -- make the lsp appear in completion
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }) -- enhanced lsp uis
  use("jose-elias-alvarez/typescript.nvim")
  use("onsails/lspkind.nvim") -- add icons to lsp completion

  if packer_bootstrap then
    require("packer").sync()
  end
end)
