local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
  print("telescope plugin not found")
  return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  print("telescope actions not found")
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<c-j"] = actions.move_selection_next,
        ["<c-k"] = actions.move_selection_previous,
        ["<c-q"] = actions.send_selected_to_qflist + actions.open_qflist,

      }
    }
  }
})

telescope.load_extension("fzf")
