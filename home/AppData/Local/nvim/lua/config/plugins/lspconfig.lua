local M = {
   "neovim/nvim-lspconfig",
   event = { "BufReadPre", "BufNewFile" },
}

function M.config()
   local servers = {
      "lua_ls",
   }

   local wk = require("which-key")
   local mappings = {
      li = { "<cmd>LspInfo<cr>", "Info" },
   }
   wk.register(mappings, { prefix="<leader>" })

   require("lspconfig.ui.windows").default_options.border = "rounded"

   local icons = require("config.icons")
   vim.diagnostic.config({
      signs = {
         active = true,
         values = {
            { name = "DiagnosticSignError", text = icons.diagnostics.Error },
            { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
            { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
            { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
         },
      },
      virtual_text = false,
      underline = true,
      severity_sort = true,
      float = {
         focusable = true,
         style = "minimal",
         border = "rounded",
         header = "",
         prefix = "",
      },
   })
   for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
   end

   local on_attach = function (client, bufnr)
      local opts = { noremap = true, silent = true }
      local keymap = vim.api.nvim_buf_set_keymap
      keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
      keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

      if client.supports_method "text/Document/inlayHint" then
         vim.lsp.inlay_hint.enable(bufnr, true)
      end
   end

   local capabilities
   local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
   if status_ok then
      capabilities =  cmp_nvim_lsp.default_capabilities()
   else
      capabilities = vim.lsp.protocol.make_client_capabilities()
   end

   local lspconfig = require("lspconfig")
   for _, server in pairs(servers) do
      local opts = {
         on_attach = on_attach,
         capabilities = capabilities,
      }
      local require_ok, settings = pcall(require, "config.lspsettings." .. server)
      if require_ok then
         opts = vim.tbl_deep_extend("force", settings, opts)
      end
      lspconfig[server].setup(opts)
   end
end

return M
