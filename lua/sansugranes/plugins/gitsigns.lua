local gitsigns_status, gitsigns = pcall(require, "gitsigns")
if not gitsigns_status then
	print("gitsigns plugin not found")
	return
end

gitsigns.setup()
