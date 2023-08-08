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

  -- appearance
  use({"catppuccin/nvim", as = "catppuccin"}) -- colorsheme
  use("nvim-lualine/lualine.nvim") -- lualine

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

  if packer_bootstrap then
    require("packer").sync()
  end
end)
