local treesitter_configs_status, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not treesitter_configs_status then
	print("treesitter configs not found")
	return
end

treesitter_configs.setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	ensure_installed = {
		"c",
		"cpp",
		"lua",
		"vim",
		"vimdoc",
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"bash",
		"gitignore",
		"dockerfile",
		"markdown",
		"markdown_inline",
	},
	auto_install = true,
})
