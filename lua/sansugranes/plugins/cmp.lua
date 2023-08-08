local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  print("cmp plugin not found")
  return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  print("luasnip plugin not found")
  return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  print("lspkind plugin not found")
  return
end

-- load friendly-snippets
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<c-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<c-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<c-h>"] = cmp.mapping.scroll_docs(-4), -- scroll up in preview
    ["<c-n>"] = cmp.mapping.scroll_docs(4), -- scroll down in preview
    ["<c-space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<c-e>"] = cmp.mapping.abort(), -- close completion window
    ["<cr>"] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- lsp
    { name = "luasnip" }, -- snippets
    { name = "buffer" }, -- text within current buffer
    { name = "path" }, -- file system paths
  }),
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = "..."
    })
  }
})
