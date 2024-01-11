local M = {
   "williamboman/mason-lspconfig.nvim",
   dependencies = {
      "williamboman/mason.nvim",
   },
   event = { "BufReadPre", "BufNewFile" },
}

function M.config()
   require("mason").setup {
      ui = {
         border = "rounded",
      },
   }
   require("mason-lspconfig").setup {
      ensure_installed = {
         "lua_ls",
      },
   }
end

return M
