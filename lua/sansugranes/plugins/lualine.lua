local lualine_status, lualine = pcall(require, "lualine")
if not lualine_status then
  print("lualine plugin not found")
  return
end

local lualine_catppuccin = require("lualine.themes.catppuccin")

lualine.setup({
    options = {
        theme = lualine_catppuccin
        -- ... the rest of your lualine config
    }
})
