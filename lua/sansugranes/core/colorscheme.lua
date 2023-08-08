local catppuccin_status, catppuccin = pcall(require, "catppuccin")
if not catppuccin_status then
  return
end

catppuccin.setup({
  flavour = "mocha",
  background = {
    light = "latte",
    dark = "mocha"
  },
  transparent_background = true
})

local status, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not status then
  print("Colorscheme not found!")
  return
end
