local M = {
   "nvim-telescope/telescope.nvim",
   dependencies =  {
      "nvim-lua/plenary.nvim",
   },
}

function M.config()
   local wk = require "which-key"
   local mappings = {
      fb = { "<cmd>Telescope buffers<cr>", "Buffers" },
      fc = { "<cmd>Telescope colorscheme<cr>", "Colorschemes" },
      ff = { "<cmd>Telescope find_files<cr>", "Find files" },
      ft = { "<cmd>Telescope live_grep<cr>", "Find text" },
      fh = { "<cmd>Telescope help_tags<cr>", "Help" },
      fl = { "<cmd>Telescope resume<cr>", "Last search" },
      fk = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      fr = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
   }
   wk.register(mappings, { prefix = "<leader>" })

   local icons = require "config.icons"

   require("telescope").setup{
      defaults = {
         prompt_prefix = icons.ui.Telescope .. " ",
         selection_caret = icons.ui.Forward .. " ",
         entry_prefix = "   ",
         color_devicons = true,
      },
      pickers = {
         buffers = {
            theme = "dropdown",
            previewer = false,
         },
         colorscheme = {
            enable_preview = true,
         },
         find_files = {
            theme = "dropdown",
            previewer = false,
            -- path_display = filenameFirst
         },
         live_grep = {
            theme = "dropdown",
         },
      },
   }
end

return M
