local wk = require("which-key")
local wk_status, wk = pcall(require, "which-key")
if not wk_status then
  print("which-key not found")
  return
end

wk.register({
  ["<leader>"] = {

    -- file/telescope stuff
    f = {
      name = "+file/telescope",
      v = { "<cmd>Ex<cr>", "File explorer" },
      -- telescope
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      s = { "<cmd>Telescope live_grep<cr>", "Live grep" },
      c = { "<cmd>Telescope grep_string<cr>", "Grep string" },
      b = { "<cmd>Telescope buffers<cr>", "Find buffers" },
      h = { "<cmd>Telescope help_tags<cr>", "Help tags" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    },

    -- window split stuff
    s = {
      name = "+split",
      ["|"] = { "<c-w>v", "Split vertically" },
      ["-"] = { "<c-w>s", "Split horizontally" },
      ["="] = { "<c-w>=", "Make splits equal width" },
      x = { "<c-w>c", "Close current split" },
      l = { "5<c-w>>", "Make V split bigger" },
      h = { "5<c-w><", "Make V split smaller" },
      k = { "5<c-w>+", "Make H split bigger" },
      j = { "5<c-w>-", "Make H split smaller" },
      m = { "<cmd>MaximizerToggle<cr>", "Maximize split" } -- from szw/vim-maximizer plugin
    },

    -- other stuff
    nh = { "<cmd>nohl<cr>", "Clear highlights" },
    ["+"] = { "<C-a>", "Increment number" },
    ["-"] = { "<C-x>", "Decrement number" },
  },
})
