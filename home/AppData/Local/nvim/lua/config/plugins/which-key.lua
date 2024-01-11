local M = {
   "folke/which-key.nvim",
   event = "VeryLazy",
}

function M.config()
   local which_key = require("which-key")
   which_key.setup({
      window = {
         border = "rounded",
         position = "border",
      },
   })

   local mappings = {
      v = { "<cmd>vsplit<CR>", "Split" },
      f = { name = "Find" },
      l = { name = "LSP" },
      p = { name = "Plugins" },
   }
   which_key.register(mappings, { mode = "n", prefix = "<leader>" })
end

return M
