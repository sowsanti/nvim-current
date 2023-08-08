local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  print("lspsaga plugin not found")
  return
end

saga.setup({
  move_in_saga = {
    next = "<c-j>", prev = "<c-k>"
  },
  symbol_in_winbar = {
    enable = false
  },
  ui = {
    code_action = '',
    title = false,
    colors = {
      normal_bg = "#FF00FF"
    }
  },
  code_action = {
    num_shortcut = false
  },
  definition = {
    keys = {
      edit = "<cr>"
    }
  },
  finder = {
    keys = {
      edit = "<cr>"
    }
  }
})
