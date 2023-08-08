local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  print("lspconfig plugin not found")
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  print("cmp_nvim_lsp plugin not found")
end

local typescript_status, typescript = pcall(require, "typescript")
if not typescript_status then
  print("typescript plugin not found")
end

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set lsp keybindings
  vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<cr>", opts)
  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<cr>", opts)
  vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
  vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
  vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
  vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
  vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<cr>", opts)
  vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
  vim.keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<cr>", opts)

  if client.name == "tsserver" then
    vim.keymap.set("n", "<leader>rf", "<cmd>TypescriptRenameFile<cr>", opts)
  end
end

-- used to enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach
})

lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make language server recognize "vim" global
      diagnostics = {
        globals = { "vim" }
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        }
      }
    }
  }
})

typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach
  }
})
