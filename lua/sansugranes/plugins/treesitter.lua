local treesitter_configs_status, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not treesitter_configs_status then
  print("treesitter configs not found")
  return
end

treesitter_configs.setup({
  ensure_installed = { "c", "lua", "vim", "vimdoc", "markdown", "markdown_inline" }
})
