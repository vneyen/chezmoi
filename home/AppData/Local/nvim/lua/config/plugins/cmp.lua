local M = {
   "hrsh7th/nvim-cmp",
   event = "InsertEnter",
   dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "L3MON4D3/LuaSnip" },
   },
}

function M.config()
   local cmp = require("cmp")
   local luasnip= require("luasnip")
   require("luasnip/loaders/from_vscode").lazy_load()
   local icons = require("config.icons")

   cmp.setup({
      snippet = {
         expand = function(args)
            luasnip.lsp_expand(args.body)
         end,
      },
      mapping = cmp.mapping.preset.insert {
         ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
         ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
         ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
         ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
         ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close(), },
         ["<CR>"] = cmp.mapping.confirm { select = true },
         ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      },
      sources = {
         { name = "nvim_lsp" },
         { name = "lua_snip" },
         { name = "nvim_lua" },
         { name = "buffer" },
         { name = "path" },
         { name = "treesitter" },
      },
      formatting = {
         fields = { "kind", "abbr", "menu" },
         format = function (entry, vim_item)
            vim_item.kind = icons.kind[vim_item.kind]
            return vim_item
         end
      },
      window = {
         completion = {
            border = "rounded",
            scrollbar = false,
         },
         documentation = {
            border = "rounded",
         },
      },
      experimental = {
         ghost_text = false,
      },
   })
end

return M
