vim.g.mapleader = " "

-- most keybindings are set in which-key.lua plugin file
-- fuzzy finding (telescope) bindings are set in the telescope.lua plugin file

-- do not copy to register
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "<del>", '"_x')
